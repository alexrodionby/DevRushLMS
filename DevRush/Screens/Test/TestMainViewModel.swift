//
//  TestMainViewModel.swift
//  DevRush
//
//  Created by Alexandr Rodionov on 17.02.24.
//

import Foundation
import Combine

class TestMainViewModel: ObservableObject {
    
    private var network: HTTPClient = .init()
    
    private var cancellables: Set<AnyCancellable> = .init()
    
    @Published var serverResponse: UserLoginResponseModel?
    
    func loginUser(inputData: [String: Any]) {
        network.request(endpoint: AuthorizationEndpoint.loginUser(inputData))
            .receive(on: DispatchQueue.main)
            .sink { complition in
                switch complition {
                case .finished:
                    print("loginUser query finished")
                case let .failure(error):
                    print("Error ===", error.localizedDescription)
                }
            } receiveValue: { [weak self] (result: UserLoginResponseModel) in
                self?.serverResponse = result
            }
            .store(in: &cancellables)


    }
    
}
