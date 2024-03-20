//
//  LogoutButton.swift
//  DevRushSolo
//
//  Created by Alexandr Rodionov on 9.03.24.
//

import SwiftUI

struct LogoutButton: View {
    
    var buttonLableText: LocalizedStringKey
    
    var buttonCornerRadius: CGFloat = 100
    var buttonBackgroundColor: Color = .lightDarkC6
    var buttonHeight: CGFloat = 46
    var buttonFontSize: CGFloat = 16
    
    var buttonTapAction: (() -> Void)?
    
    var body: some View {
        Button {
            buttonTapAction?()
        } label: {
            RoundedRectangle(cornerRadius: buttonCornerRadius)
                .fill(buttonBackgroundColor)
                .frame(height: buttonHeight)
                .overlay(alignment: .center) {
                    HStack {
                        Image(.logout2)
                            .resizable()
                            .scaledToFit()
                            .padding(.vertical, 14)
                        Text(buttonLableText)
                            .font(.system(size: buttonFontSize, weight: .semibold, design: .default))
                    }
                    .foregroundStyle(.blue1)
                }
        }
    }
}

#Preview("WhiteRU") {
    LogoutButton(buttonLableText: LocalizedStringKey("logoutButtonLabel"))
        .padding()
        .preferredColorScheme(.light)
        .environment(\.locale, .init(identifier: "ru"))
}

#Preview("DarkEn") {
    LogoutButton(buttonLableText: LocalizedStringKey("logoutButtonLabel"))
        .padding()
        .preferredColorScheme(.dark)
        .environment(\.locale, .init(identifier: "en"))
}
