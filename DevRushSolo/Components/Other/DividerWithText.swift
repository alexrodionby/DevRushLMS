//
//  DividerWithText.swift
//  DevRushSolo
//
//  Created by Alexandr Rodionov on 26.02.24.
//

import SwiftUI

struct DividerWithText: View {
    
    var dividerText: LocalizedStringKey = LocalizedStringKey("or")
    var dividerLineColor: Color = .lightDarkC3
    var dividerLineHeight: CGFloat = 1
    var dividerTextColor: Color = .lightDarkC3
    var dividerFontSize: CGFloat = 12
    var dividerFontWeight: Font.Weight = .medium
    
    var body: some View {
        HStack {
            Rectangle()
                .fill(dividerLineColor)
                .frame(height: dividerLineHeight)
            
            Text(dividerText)
                .font(.system(size: dividerFontSize, weight: dividerFontWeight))
                .foregroundStyle(dividerTextColor)
                .padding(.horizontal, 8)
            
            Rectangle()
                .fill(dividerLineColor)
                .frame(height: dividerLineHeight)
        }
    }
}

#Preview("WhiteRU") {
    DividerWithText()
        .padding()
        .preferredColorScheme(.light)
        .environment(\.locale, .init(identifier: "ru"))
}

#Preview("DarkEn") {
    DividerWithText()
        .padding()
        .preferredColorScheme(.dark)
        .environment(\.locale, .init(identifier: "en"))
}
