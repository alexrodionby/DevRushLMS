//
//  ForgotPasswordCodeView.swift
//  DevRushSolo
//
//  Created by Alexandr Rodionov on 25.03.24.
//

import SwiftUI

struct ForgotPasswordCodeView: View {
    
    @EnvironmentObject var authorizationVM: AuthorizationMainViewModel
    
    private var forgotPasswordMainViewTitle: LocalizedStringKey = LocalizedStringKey("forgotPasswordMainViewTitle")
    private var emailTextFieldStaticLabel: LocalizedStringKey = LocalizedStringKey("emailTextFieldStaticLabel")
    private var actionContinueButtonTextTitle: LocalizedStringKey = LocalizedStringKey("actionContinueButtonTextTitle")
    private var codeTextFieladLabel: LocalizedStringKey = LocalizedStringKey("codeTextFieladLabel")
    private var codeTextFieladPlaceholder: LocalizedStringKey = LocalizedStringKey("codeTextFieladPlaceholder")
    private var forgotPasswordMainMessage: LocalizedStringKey = LocalizedStringKey("forgotPasswordMainMessage")
    
    @State private var emailTextValue: String = .init()
    @State private var emailTextFieldBorderColor: Color = .lightDarkC5
    @State private var codeTextValue: String = .init()
    @State private var codeTextFieldBorderColor: Color = .lightDarkC5
    
    private var textFieldStackSpacing: CGFloat = 8
    private var mainStackSpacing: CGFloat = 16
    
    var body: some View {
        ZStack {
            Color.baseWhiteDark
                .ignoresSafeArea()
            
            VStack(alignment: .center, spacing: mainStackSpacing) {
                
                VStack(alignment: .center) {
                    Text(forgotPasswordMainMessage)
                        .foregroundStyle(.lightDarkC2)
                        .font(.system(size: 14, weight: .regular, design: .default))
                        .multilineTextAlignment(.center)
                }
                .padding(.horizontal)
                
                VStack(alignment: .leading, spacing: textFieldStackSpacing) {
                    Text(emailTextFieldStaticLabel)
                        .foregroundStyle(.lightDarkC2)
                        .font(.system(size: 14, weight: .regular, design: .default))
                    EmailTextField(textFieldValue: $emailTextValue, textFieldBorderColor: $emailTextFieldBorderColor, fillColor: .lightDarkC4)
                        .disabled(true)
                }
                
                VStack(alignment: .leading, spacing: textFieldStackSpacing) {
                    Text(codeTextFieladLabel)
                        .foregroundStyle(.lightDarkC2)
                        .font(.system(size: 14, weight: .regular, design: .default))
                    EmailTextField(textFieldValue: $codeTextValue, textFieldBorderColor: $codeTextFieldBorderColor, textFieldPlaceholder: codeTextFieladPlaceholder)
                }
                
                Spacer()
                
                MainActionButton(buttonLableText: actionContinueButtonTextTitle) {
                    print("--- Нажали на кнопку Отправить ---")
                    /// Отработка нажатия кнопки отправить адрес почты
                }
                .padding(.bottom)
            }
            .padding(.horizontal)
            .padding(.top)
        }
        .navigationTitle(forgotPasswordMainViewTitle)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview("WhiteRU") {
    NavigationView {
        ForgotPasswordCodeView()
            .preferredColorScheme(.light)
            .environment(\.locale, .init(identifier: "ru"))
    }
}

#Preview("DarkEn") {
    NavigationView {
        ForgotPasswordCodeView()
            .preferredColorScheme(.dark)
            .environment(\.locale, .init(identifier: "en"))
    }
}
