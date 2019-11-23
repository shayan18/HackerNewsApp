//
//  StoryService.swift
//  HackerNews
//
//  Created by Shayan Ali on 23/11/2019.
//  Copyright © 2019 Shayan Ali. All rights reserved.
//

import Moya
enum StoryService {
    case getStoriesList
    case getStory(id: Int)
}

extension StoryService: TargetType {
    
    var baseURL: URL {
        return URL(string: Constants.baseUrl)!
    }
    
    var path: String {
        switch self {
        
        case .getStoriesList:
            return "topstories.json"
        case .getStory(let id):
            return "item/\(id).json"

        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getStoriesList,.getStory:
            return .get
    
        }
    }
    
    var task: Task {
        switch self {
        case .getStoriesList,.getStory:
            return .requestPlain
            
        }
    }
    
    var headers: [String: String]? {
        
        return [:]
    }
    
    var sampleData: Data {
        return Data()
    }
}
