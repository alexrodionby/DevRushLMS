//
//  LoginRequest.swift
//
//
//  Created by Илья Шаповалов on 18.02.2024.
//

import Foundation

public struct LoginRequest: Encodable {
    let email: String
    let password: String
    
    public init(email: String, password: String) {
        self.email = email
        self.password = password
    }
}
