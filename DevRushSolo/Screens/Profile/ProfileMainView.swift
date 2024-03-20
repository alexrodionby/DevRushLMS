//
//  ProfileMainView.swift
//  DevRushSolo
//
//  Created by Alexandr Rodionov on 4.03.24.
//

import SwiftUI

struct ProfileMainView: View {
    
    @ObservedObject var profileMainVM: ProfileMainViewModel
    
    private var logoutButtonText: LocalizedStringKey = LocalizedStringKey("logoutButtonLabel")
    
    init(profileMainVM: ProfileMainViewModel) {
        self.profileMainVM = profileMainVM
    }
    
    var body: some View {
        VStack {
            Spacer()
            LogoutButton(buttonLableText: logoutButtonText) {
                print("--- Нажали кнопку Logout ---")
                profileMainVM.logoutUser()
            }
            .padding(.bottom)
        }
    }
}

#Preview("WhiteRU") {
    ProfileMainView(profileMainVM: ProfileMainViewModel())
        .padding()
        .preferredColorScheme(.light)
        .environment(\.locale, .init(identifier: "ru"))
}

#Preview("DarkEn") {
    ProfileMainView(profileMainVM: ProfileMainViewModel())
        .padding()
        .preferredColorScheme(.dark)
        .environment(\.locale, .init(identifier: "en"))
}
