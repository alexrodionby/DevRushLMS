//
//  TabBottomView.swift
//  DevRush
//
//  Created by Alexandr Rodionov on 13.02.24.
//

import SwiftUI

struct TabBottomView: View {
    
    var tabLabelImageRatio: Double = 25
    var tabLabelFontSize: CGFloat = 12
    var tabLabelFontWeight: Font.Weight = .regular
    
    let tabBarItems: [(image: String, title: LocalizedStringKey)] = [
        ("home", LocalizedStringKey("Feed")),
        ("notebook", LocalizedStringKey("Courses")),
        ("widget", LocalizedStringKey("Libraries")),
        ("chat", LocalizedStringKey("Chat"))
    ]
    
    var dividerLineColor: Color = Color.custom.lightDarkC5
    var dividerLineHeight: CGFloat = 1
 
    @Binding var tabSelection: Int
    var geometry: CGSize
    
    var body: some View {
        VStack(spacing: 4) {
            Rectangle()
                .fill(dividerLineColor)
                .frame(height: dividerLineHeight)
            
            HStack(spacing: 0) {
                ForEach(0..<4) { item in
                    Spacer(minLength: 0)
                    VStack(alignment: .center, spacing: 4) {
                        Image(tabBarItems[item].image)
                            .resizable()
                            .frame(width: geometry.height / tabLabelImageRatio, height: geometry.height / tabLabelImageRatio)
                            
                        Text(tabBarItems[item].title)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .font(.system(size: tabLabelFontSize, weight: tabLabelFontWeight))

                    }
                    .foregroundColor(item + 1 == tabSelection ? Color.custom.basePink1 : Color.custom.lightDarkC3)
                    .onTapGesture {
                        tabSelection = item + 1
                    }
                    Spacer(minLength: 0)
                }
            }
        }
    }
}

#Preview {
    TabBottomView(tabSelection: .constant(1), geometry: CGSize(width: 350, height: 800))
}
