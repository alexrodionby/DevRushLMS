//
//  Endpoints.swift
//  
//
//  Created by Илья Шаповалов on 18.02.2024.
//

import Foundation

extension Endpoint {
    static func withCommonHeaderFields(path: String) -> Self {
        Endpoint(path: path)
            .headers(
                ("accept", "application/json"),
                ("Content-Type", "application/json-patch+json")
            )
    }
    
    static func login() -> Self {
        Endpoint
            .withCommonHeaderFields(path: "authorization/login")
            .httpMethod(.POST)
    }
}
