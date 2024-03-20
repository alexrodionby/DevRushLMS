//
//  MainActionButton.swift
//  DevRushSolo
//
//  Created by Alexandr Rodionov on 25.02.24.
//

import SwiftUI

struct MainActionButton: View {
    
    var buttonLableText: LocalizedStringKey
    
    var buttonCornerRadius: CGFloat = 100
    var buttonBackgroundColor: Color = .blue1
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
                    Text(buttonLableText)
                        .font(.system(size: buttonFontSize, weight: .semibold, design: .default))
                        .foregroundStyle(.lightDarkC6)
                }
        }
    }
}

#Preview("WhiteRU") {
    MainActionButton(buttonLableText: LocalizedStringKey("authorizationMainViewActionButtonText"))
        .padding()
        .preferredColorScheme(.light)
        .environment(\.locale, .init(identifier: "ru"))
}

#Preview("DarkEn") {
    MainActionButton(buttonLableText: LocalizedStringKey("authorizationMainViewActionButtonText"))
        .padding()
        .preferredColorScheme(.dark)
        .environment(\.locale, .init(identifier: "en"))
}
