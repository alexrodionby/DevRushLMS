//
//  TabbarBottomView.swift
//  DevRushSolo
//
//  Created by Alexandr Rodionov on 4.03.24.
//

import SwiftUI

struct TabbarBottomView: View {
    
    var tabbarLabelImageRatio: Double = 25
    var tabbarLabelFontSize: CGFloat = 12
    var tabbarLabelFontWeight: Font.Weight = .regular
    
    var dividerLineColor: Color = Color.lightDarkC5
    var dividerLineHeight: CGFloat = 1
    
    @Binding var tabSelection: Int
    var geometry: CGSize
    
    let tabbarItems: [(image: String, title: LocalizedStringKey)] = [
        ("home", LocalizedStringKey("FeedTabbarName")),
        ("notebook", LocalizedStringKey("CoursesTabbarName")),
        ("widget", LocalizedStringKey("LibrariesTabbarName")),
        ("chat", LocalizedStringKey("ChatTabbarName")),
        ("settings", LocalizedStringKey("ProfileTabbarName"))
    ]
    
    var body: some View {
        VStack(spacing: 4) {
            Rectangle()
                .fill(dividerLineColor)
                .frame(height: dividerLineHeight)
            
            HStack(spacing: 0) {
                ForEach(0..<5) { item in
                    Spacer(minLength: 0)
                    VStack(alignment: .center, spacing: 4) {
                        Image(tabbarItems[item].image)
                            .resizable()
                            .frame(width: geometry.height / tabbarLabelImageRatio, height: geometry.height / tabbarLabelImageRatio)
                        
                        Text(tabbarItems[item].title)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .font(.system(size: tabbarLabelFontSize, weight: tabbarLabelFontWeight, design: .default))
                    }
                    .foregroundStyle(item + 1 == tabSelection ? Color.blue1 : Color.lightDarkC3)
                    .onTapGesture {
                        tabSelection = item + 1
                    }
                    Spacer(minLength: 0)
                }
            }
        }
    }
}

#Preview("WhiteRU") {
    TabbarBottomView(tabSelection: .constant(1), geometry: CGSize(width: 393, height: 852))
        .preferredColorScheme(.light)
        .environment(\.locale, .init(identifier: "ru"))
}

#Preview("DarkEN") {
    TabbarBottomView(tabSelection: .constant(1), geometry: CGSize(width: 393, height: 852))
        .preferredColorScheme(.dark)
        .environment(\.locale, .init(identifier: "en"))
}
