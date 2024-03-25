//
//  AuthorizationMainViewModel.swift
//  DevRushSolo
//
//  Created by Alexandr Rodionov on 26.02.24.
//

import Foundation
import Combine
import SwiftUI

class AuthorizationMainViewModel: ObservableObject {
    
    @ObservedObject var userData = UserDataGlobalModel.shared
    
    @Published var navigationPath: NavigationPath = .init()
    
    private var network: HTTPClient = .init()
    private var keychain: KeychainService = .init()
    private let jwtService: JWTService = .init()
    private var cancellables: Set<AnyCancellable> = .init()
    
    /// Логиним пользователя и сохраняем его токены
    func loginUser(inputData: [String: Any]) {
        network.request(endpoint: AuthorizationEndpoint.loginUser(inputData))
            .receive(on: DispatchQueue.main)
            .sink { complition in
                switch complition {
                case .finished:
                    print("--- Запрос loginUser завершился успешно ---")
                case let .failure(error):
                    print("--- Запрос loginUser завершился неудачно ---")
                    print("--- Ошибка ===", error.localizedDescription, " ---")
                }
            } receiveValue: { [weak self] (result: UserLoginResponseModel) in
                print("--- Данные получены по запросу loginUser ---")
                self?.jwtService.saveUsersTokens(userResponse: result)
                self?.userData.isUserLoggedIn = true
            }
            .store(in: &cancellables)
    }
    
    ///  Проверяем, залогинен ли пользователь на старте приложения
    func checkUserLoginStatus(completion: @escaping (Bool) -> Void) {
        jwtService.checkTokensAndRefreshIfNeeded { tokensRefreshed in
            completion(tokensRefreshed)
        }
    }

    
}
