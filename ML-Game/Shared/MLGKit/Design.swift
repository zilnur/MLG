//
//  Design.swift
//  ML-Game
//
//  Created by Dmitry Leukhin on 12.10.2022.
//

import SwiftUI

///  Дизайн, основные константы приложения
enum Design {
    /// Цвета
    enum Colors {
        static let primary: Color = Color.black
        static let secondary: Color = Color.white
        static let lightGray: Color = Color(red: 0.87, green: 0.87, blue: 0.87)
        
        @available(*, deprecated, message: "Не используйте этот цвет в проекте")
        static let tech1: Color = Color(white: 0.95)
        @available(*, deprecated, message: "Не используйте этот цвета в проекте")
        static let tech2: Color = Color(white: 0.80)
        @available(*, deprecated, message: "Не используйте этот цвета в проекте")
        static let tech3: Color = Color(white: 0.70)
    }

    /// Шрифты с размерами
    enum Fonts {
        static let h0: Font = Font.system(size: 36)
        static let h1: Font = Font.system(size: 24)
        static let h2: Font = Font.system(size: 20)
        static let h3: Font = Font.system(size: 16)
        static let h4: Font = Font.system(size: 14)
    }

    /// Отступы
    enum Spacing {
        static let long: CGFloat = 128
        static let big: CGFloat = 32
        static let standart: CGFloat = 16
        static let short: CGFloat = 8
    }
}
