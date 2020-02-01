//
//  NetworkManager.swift
//  Network Layer
//
//  Created by Ahmed M. Hassan on 7/31/19.
//  Copyright © 2019 ITI. All rights reserved.
//

import Foundation
import Moya

protocol Networkable {
    
    var provider: MoyaProvider<FlickrAPI> { get }
    
}

class NetworkManager {
    
    public static let shared = NetworkManager()
    
    private init() {}
    
    static let environment: NetworkEnvironment = .production
    static let myAPIKey = ""
    let provider = MoyaProvider<FlickrAPI>(plugins: [/*NetworkLoggerPlugin(verbose: true)*/])
}



extension NetworkManager: Networkable{
    
    //func getPhotos(withTag)
    
    
//    func getNewMovies(page: Int, sortType: PopularMoviesSortType, completion: @escaping ([Movie]?, Swift.Error?) -> ()) {
//        provider.request(.popular(page: page, sortType: sortType)) { (result) in
//            switch result {
//            case let .success(response):
//                let json = JSON(data: response.data)
//                completion(MovieApiResponse(from: json).movies, nil)
//            case let .failure(error):
//                print(error)
//                completion(nil, error)
//            }
//        }
//    }
    
    
}






