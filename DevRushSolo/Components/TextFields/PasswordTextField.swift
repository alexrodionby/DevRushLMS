//
//  PasswordTextField.swift
//  DevRushSolo
//
//  Created by Alexandr Rodionov on 25.02.24.
//

import SwiftUI

struct PasswordTextField: View {
    
    @Binding var textFieldValue: String
    @Binding var textFieldBorderColor: Color
    
    var textFieldPlaceholder: LocalizedStringKey = LocalizedStringKey("password placeholder")
    var textFieldCornerRadius: CGFloat = 12
    var textFieldHeight: CGFloat = 45
    var textFieldStrokeLineWidth: CGFloat = 1
    var textFieldInternalPadding: CGFloat = 12
    
    var body: some View {
        HStack {
            SecureField(textFieldPlaceholder, text: $textFieldValue)
                .foregroundStyle(.lightDarkC1)
                .padding(textFieldInternalPadding)
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)
                .keyboardType(.asciiCapable)
        }
        .frame(height: textFieldHeight)
        .background {
            RoundedRectangle(cornerRadius: textFieldCornerRadius)
                .fill(.lightDarkC6)
                .overlay {
                    RoundedRectangle(cornerRadius: textFieldCornerRadius)
                        .stroke(textFieldBorderColor, lineWidth: textFieldStrokeLineWidth)
                }
        }
    }
}

#Preview("WhiteRU") {
    PasswordTextField(textFieldValue: .constant(""), textFieldBorderColor: .constant(.lightDarkC5), textFieldPlaceholder: LocalizedStringKey("password placeholder"))
        .padding()
        .preferredColorScheme(.light)
        .environment(\.locale, .init(identifier: "ru"))
}

#Preview("DarkEn") {
    PasswordTextField(textFieldValue: .constant(""), textFieldBorderColor: .constant(.lightDarkC5), textFieldPlaceholder: LocalizedStringKey("password placeholder"))
        .padding()
        .preferredColorScheme(.light)
        .environment(\.locale, .init(identifier: "en"))
}
