//
//  Font+Ext.swift
//  DevRush
//
//  Created by Alexandr Rodionov on 11.02.24.
//

// Добавляем кастомные шрифты для удобного использования

import Foundation
import SwiftUI

enum CustomFont: String {
    case montserratBold = "Montserrat-Bold"
    case montserratRegular = "Montserrat-Regular"
}

extension Font {
    static func custom(_ font: CustomFont, size: CGFloat) -> SwiftUI.Font {
        SwiftUI.Font.custom(font.rawValue, size: size)
    }
}
