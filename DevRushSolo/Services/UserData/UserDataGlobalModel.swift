//
//  UserDataGlobalModel.swift
//  DevRushSolo
//
//  Created by Alexandr Rodionov on 9.03.24.
//

import Foundation

class UserDataGlobalModel: ObservableObject {
    
    static let shared = UserDataGlobalModel()
    private init() {}
    
    private let jwtService: JWTService = .init()
    
    @Published var isUserLoggedIn: Bool = false
    
    func isUserAuthenticated() {
        if jwtService.areTokensStored() {
            if jwtService.isTokenExpired() {
                jwtService.refreshUserToken() {
                    self.isUserLoggedIn = true
                }
            } else {
                isUserLoggedIn = true
            }
        } else {
            isUserLoggedIn = false
        }
    }
    
}

