//
//  Constants.swift
//  DevRushSolo
//
//  Created by Alexandr Rodionov on 25.02.24.
//

import Foundation

struct Constants {
    
    static let scheme = "https"
    static let baseURL = "devrush.online"
    static var accessToken: String {
        get {
            if let storedToken = KeychainService().readUserToken(tokenType: .accessToken) {
                return storedToken
            } else {
                return ""
            }
        }
    }
    static var refreshToken: String {
        get {
            if let storedToken = KeychainService().readUserToken(tokenType: .refreshToken) {
                return storedToken
            } else {
                return ""
            }
        }
    }
}
