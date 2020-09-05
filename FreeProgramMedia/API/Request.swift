//
//  Request.swift
//  FreeProgramMedia
//
//  Created by Roman Haiduk on 05.09.2020.
//  Copyright © 2020 Roman Haiduk. All rights reserved.
//

import Foundation
import Moya

enum Request {
    
    case mediaFree
    
    fileprivate static let baseUrl = URL(string: "https://api.iawaketechnologies.com/api/v2/")!
}

extension Request: TargetType {
    
    var baseURL: URL {
        Self.baseUrl
    }
    
    var path: String {
        switch self {
        case .mediaFree: return "media-library/free"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .mediaFree: return .get
        }
    }
    
    var sampleData: Data {
        Data()
    }
    
    var params: [String: Any] {
        
        switch self {
        case .mediaFree:
            return ["resetCache": true]
        }
    }
    
    var task: Task {
        .requestParameters(parameters: params, encoding: URLEncoding() )
    }
    
    var headers: [String : String]? {
        [:]
    }
}
