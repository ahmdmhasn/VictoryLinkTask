//
//  BaseHandler.swift
//  VictoryLinkTask
//
//  Created by Ahmed M. Hassan on 9/18/19.
//  Copyright © 2019 Ahmed M. Hassan. All rights reserved.
//

import Foundation

enum SearchType {
    case tag(String)
    case coordinates(Double, Double)
}

class BaseHandler {
    
    public static let shared = BaseHandler()
    
    private init() {
        
    }
    
    var searchType: SearchType?
    
}
