//
//  ProfileMainViewModel.swift
//  DevRushSolo
//
//  Created by Alexandr Rodionov on 9.03.24.
//

import Foundation
import Combine
import SwiftUI

class ProfileMainViewModel: ObservableObject {
    
    @ObservedObject var userData = UserDataGlobalModel.shared
    
    private var network: HTTPClient = .init()
    private var keychain: KeychainService = .init()
    private var cancellables: Set<AnyCancellable> = .init()
    
    func logoutUser() {
        network.request(endpoint: AuthorizationEndpoint.logoutUser)
            .receive(on: DispatchQueue.main)
            .sink { complition in
                switch complition {
                case .finished:
                    print("--- Запрос logoutUser завершился успешно ---")
                case let .failure(error):
                    print("--- Запрос logoutUser завершился неудачно ---")
                    print("--- Ошибка ===", error.localizedDescription, " ---")
                }
            } receiveValue: { [weak self] (result: UserLoginResponseModel) in
                print("--- Данные получены по запросу logoutUser ---")
                self?.userData.isUserLoggedIn = false
                self?.keychain.resetTokens()
            }
            .store(in: &cancellables)
    }
}
