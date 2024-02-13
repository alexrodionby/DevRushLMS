//
//  DividerWithCenteredText.swift
//  DevRush
//
//  Created by Alexandr Rodionov on 13.02.24.
//

import SwiftUI

struct DividerWithCenteredText: View {
    
    var dividerText: LocalizedStringKey = LocalizedStringKey("или")
    var dividerLineColor: Color = Color.custom.lightDarkC4
    var dividerLineHeight: CGFloat = 1
    var dividerTextColor: Color = Color.custom.lightDarkC4
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

#Preview {
    DividerWithCenteredText()
}
