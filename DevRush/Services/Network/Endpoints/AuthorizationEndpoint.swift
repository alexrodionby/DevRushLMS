//
//  AuthorizationEndpoint.swift
//  DevRush
//
//  Created by Alexandr Rodionov on 17.02.24.
//

import Foundation

enum AuthorizationEndpoint {
    case loginUser([String: Any]?)
}

extension AuthorizationEndpoint: APIEndpoint {
    var scheme: String {
        switch self {
        default:
            return Constants.scheme
        }
    }
    
    var host: String {
        switch self {
        default:
            return Constants.baseURL
        }
    }
    
    var path: String {
        switch self {
        case .loginUser:
            return "/api/v1/authorization/login"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .loginUser:
            return .post
        }
    }
    
    var parameters: [String : Any]? {
        switch self {
        default:
            return nil
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default:
            return nil
        }
    }
    
    var body: [String : Any]? {
        switch self {
        case let .loginUser(dictionary):
            return dictionary
        }
    }
    
    var contentType: ContentType? {
        switch self {
        case .loginUser:
            return .json
        }
    }
    
    var acceptType: ContentType? {
        switch self {
        case .loginUser:
            return .plainText
        }
    }
    
    
}
