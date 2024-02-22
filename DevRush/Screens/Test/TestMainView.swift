//
//  TestMainView.swift
//  DevRush
//
//  Created by Alexandr Rodionov on 17.02.24.
//

import SwiftUI

struct TestMainView: View {
    
    @ObservedObject var testVM = TestMainViewModel()
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack {
                Text("accessToken")
                    .font(.title)
                Text(testVM.serverResponse?.body?.accessToken ?? "No accessToken")
            }
            .padding(.vertical)
            
            VStack {
                Text("refreshToken")
                    .font(.title)
                Text(testVM.serverResponse?.body?.refreshToken ?? "No refreshToken")
            }
            .padding(.vertical)
            
            Button(action: {
                print("Press test button")
                testVM.loginUser(inputData: ["email": "alexrodionby@gmail.com", "password": "1916ap1916ap"])
            }, label: {
                Text("Test query!")
            })
            .buttonStyle(.bordered)
            
            Spacer()
        }
    }
}

#Preview {
    TestMainView()
}
