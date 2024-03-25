//
//  EmailTextField.swift
//  DevRushSolo
//
//  Created by Alexandr Rodionov on 25.02.24.
//

import SwiftUI

struct EmailTextField: View {
    
    @Binding var textFieldValue: String
    @Binding var textFieldBorderColor: Color
    
    var textFieldPlaceholder: LocalizedStringKey = LocalizedStringKey("e-mail placeholder")
    var textFieldCornerRadius: CGFloat = 12
    var textFieldHeight: CGFloat = 45
    var textFieldStrokeLineWidth: CGFloat = 1
    var textFieldInternalPadding: CGFloat = 12
    var keyboardType: UIKeyboardType = .emailAddress
    var fillColor: Color = .lightDarkC6
    
    var body: some View {
        HStack {
            TextField(textFieldPlaceholder, text: $textFieldValue)
                .foregroundStyle(.lightDarkC1)
                .padding(textFieldInternalPadding)
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)
                .keyboardType(keyboardType)
        }
        .frame(height: textFieldHeight)
        .background {
            RoundedRectangle(cornerRadius: textFieldCornerRadius)
                .fill(fillColor)
                .overlay {
                    RoundedRectangle(cornerRadius: textFieldCornerRadius)
                        .stroke(textFieldBorderColor, lineWidth: textFieldStrokeLineWidth)
                }
        }
    }
}

#Preview("WhiteRU") {
    EmailTextField(textFieldValue: .constant(""), textFieldBorderColor: .constant(.lightDarkC5), textFieldPlaceholder: LocalizedStringKey("e-mail placeholder"))
        .padding()
        .preferredColorScheme(.light)
        .environment(\.locale, .init(identifier: "ru"))
}

#Preview("DarkEn") {
    EmailTextField(textFieldValue: .constant(""), textFieldBorderColor: .constant(.lightDarkC5), textFieldPlaceholder: LocalizedStringKey("e-mail placeholder"))
        .padding()
        .preferredColorScheme(.dark)
        .environment(\.locale, .init(identifier: "en"))
}
