//
//  FlickrAPI.swift
//  VictoryLinkTask
//
//  Created by Ahmed M. Hassan on 9/18/19.
//  Copyright © 2019 Ahmed M. Hassan. All rights reserved.
//

import Foundation

import Foundation
import Moya
import Alamofire


enum NetworkEnvironment {
    case qa
    case production
    case staging
}

public enum FlickrAPI {
    case popular(page: Int)
    case withinArea(page: Int, lat: Double, long: Double)
    case search(page: Int, text: String)
    case image(id: String)
}

extension FlickrAPI: TargetType {
    
    private var environmentBaseURL: String {
        switch NetworkManager.environment {
        case .production: return "https://api.flickr.com/services/rest/"
        case .qa: return "https://api.flickr.com/services/rest/"
        case .staging: return "https://api.flickr.com/services/rest/"
        }
    }
    
    /// The target's base `URL`.
    public var baseURL: URL {
        guard let url = URL(string: environmentBaseURL) else {
            fatalError("BaseURL could not be configured")
        }
        return url
    }
    
    /// The path to be appended to `baseURL` to form the full `URL`.
    public var path: String {
//        switch self {
//        case .recommended(let id):
//            return "\(id)/recommendations"
//        case .popular:
//            return "/discover/movie"
//        }
        return ""
    }
    
    /// The HTTP method used in the request.
    public var method: Moya.Method {
        return .get
    }
    
    /// The type of HTTP task to be performed.
    public var task: Task {
        switch self {
        case .popular(let page):
            return .requestParameters(parameters: ["api_key": NetworkManager.myAPIKey,
                                                   "page":page],
                                      encoding: URLEncoding.default)
        case .withinArea(let page, let lat, let long):
            return .requestParameters(parameters: ["api_key": NetworkManager.myAPIKey,
                                                   "page":page,
                                                   "method": "flickr.photos.search",
                                                   "lat":lat,
                                                   "lon":long],
                                      encoding: URLEncoding.default)
        case .search(let page, let text):
            return .requestParameters(parameters: ["api_key": NetworkManager.myAPIKey,
                                                   "page":page,
                                                   "method": "flickr.photos.search",
                                                   "text":text],
                                      encoding: URLEncoding.default)
        case .image(let id):
            return .requestParameters(parameters: ["api_key": NetworkManager.myAPIKey,
                                                   "photo_id":id],
                                      encoding: URLEncoding.default)
        }
    }
    
    /// Whether or not to perform Alamofire validation. Defaults to `false`.
    public var validate: Bool {
        return false
    }
    
    public var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
    
    public var sampleData: Data {
        return Data()
    }

}

