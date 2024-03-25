//
//  NewPasswordView.swift
//  DevRushSolo
//
//  Created by Alexandr Rodionov on 25.03.24.
//

import SwiftUI

struct NewPasswordView: View {
    
    private var newPasswordViewTitle: LocalizedStringKey = LocalizedStringKey("newPasswordViewTitle")
    private var actionContinueButtonTextTitle: LocalizedStringKey = LocalizedStringKey("actionContinueButtonTextTitle")
    private var newPasswordMainMessage: LocalizedStringKey = LocalizedStringKey("newPasswordMainMessage")
    private var passwordPlaceholder: LocalizedStringKey = LocalizedStringKey("password placeholder")
    private var passwordEnterTextFieldLabel: LocalizedStringKey = LocalizedStringKey("passwordEnterTextFieldLabel")
    
    @State private var passwordTextValue: String = .init()
    @State private var passwordTextFieldBorderColor: Color = .lightDarkC5
    @State private var rePasswordTextValue: String = .init()
    @State private var rePasswordTextFieldBorderColor: Color = .lightDarkC5
    
    private var textFieldStackSpacing: CGFloat = 8
    private var mainStackSpacing: CGFloat = 16
    
    var body: some View {
        ZStack {
            Color.baseWhiteDark
                .ignoresSafeArea()
            
            VStack(alignment: .center, spacing: mainStackSpacing) {
                
                VStack(alignment: .center) {
                    Text(newPasswordMainMessage)
                        .foregroundStyle(.lightDarkC2)
                        .font(.system(size: 14, weight: .regular, design: .default))
                        .multilineTextAlignment(.center)
                }
                .padding(.horizontal)
                
                VStack(alignment: .leading, spacing: textFieldStackSpacing) {
                    Text(passwordPlaceholder)
                        .foregroundStyle(.lightDarkC2)
                        .font(.system(size: 14, weight: .regular, design: .default))
                    PasswordTextField(textFieldValue: $passwordTextValue, textFieldBorderColor: $passwordTextFieldBorderColor)
                }
                
                VStack(alignment: .leading, spacing: textFieldStackSpacing) {
                    Text(passwordEnterTextFieldLabel)
                        .foregroundStyle(.lightDarkC2)
                        .font(.system(size: 14, weight: .regular, design: .default))
                    PasswordTextField(textFieldValue: $rePasswordTextValue, textFieldBorderColor: $rePasswordTextFieldBorderColor)
                }
                
                Spacer()
                
                MainActionButton(buttonLableText: actionContinueButtonTextTitle) {
                    print("--- Нажали на кнопку Продолжить ---")
                    /// Отработка нажатия кнопки продолжить
                }
                .padding(.bottom)
            }
            .padding(.horizontal)
            .padding(.top)
        }
        .navigationTitle(newPasswordViewTitle)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview("WhiteRU") {
    NavigationView {
        NewPasswordView()
            .preferredColorScheme(.light)
            .environment(\.locale, .init(identifier: "ru"))
    }
}

#Preview("DarkEn") {
    NavigationView {
        NewPasswordView()
            .preferredColorScheme(.dark)
            .environment(\.locale, .init(identifier: "en"))
    }
}
