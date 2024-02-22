//
//  UserLoginResponseModel.swift
//  DevRush
//
//  Created by Alexandr Rodionov on 17.02.24.
//

import Foundation

// MARK: - UserLoginResponseModel
struct UserLoginResponseModel: Codable {
    var success: Bool?
    var errors: [ErrorResponseModel]?
    var body: Body?
    var resetToken: Bool?
}

struct ErrorResponseModel: Codable {
    var code: Int?
    var message, target: String?
    var systemException, innerException, stackTrace: String?
}

// MARK: - Body
struct Body: Codable {
    var accessToken, refreshToken: String?
}
