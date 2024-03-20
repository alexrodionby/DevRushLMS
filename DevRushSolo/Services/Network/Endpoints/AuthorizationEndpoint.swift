//
//  AuthorizationEndpoint.swift
//  DevRushSolo
//
//  Created by Alexandr Rodionov on 26.02.24.
//

import Foundation

enum AuthorizationEndpoint {
    case loginUser([String: Any]?)
    case refreshAccessToken
    case logoutUser
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
        case .refreshAccessToken:
            return "/api/v1/authorization/refresh"
        case .logoutUser:
            return "/api/v1/authorization/logout"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .loginUser:
            return .post
        case .refreshAccessToken:
            return .put
        case .logoutUser:
            return .put
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
        case .logoutUser:
            return ["Authorization": "Bearer " + Constants.accessToken]
        default:
            return nil
        }
    }
    
    var body: [String : Any]? {
        switch self {
        case let .loginUser(dictionary):
            return dictionary
        case .refreshAccessToken:
            return ["token": Constants.refreshToken]
        case .logoutUser:
            return ["token": Constants.accessToken]
        }
    }
    
    var contentType: ContentType? {
        switch self {
        case .loginUser:
            return .json
        case .refreshAccessToken:
            return .json
        case .logoutUser:
            return .json
        }
    }
    
    var acceptType: ContentType? {
        switch self {
        case .loginUser:
            return .plainText
        case .refreshAccessToken:
            return .plainText
        case .logoutUser:
            return .plainText
        }
    }
}
