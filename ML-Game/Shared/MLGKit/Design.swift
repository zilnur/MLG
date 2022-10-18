//
//  Design.swift
//  ML-Game
//
//  Created by Dmitry Leukhin on 12.10.2022.
//

import SwiftUI
import UIKit

///  Дизайн, основные константы приложения
enum Design {
    struct ColorTheme {
        let light: Color
        let dark: Color
    }

    /// Цвета с поддержкой темы
//    enum ColorThemes {
//        static let primary: ColorTheme = ColorTheme(light: Colors.primary, dark: Colors.secondary)
//        static let secondary: ColorTheme = ColorTheme(light: Colors.secondary, dark: Colors.primary)
//        static let background: ColorTheme = ColorTheme(light: Colors.backgroundLight, dark: Colors.backgroundDark)
//        static let error: ColorTheme = ColorTheme(light: Colors.errorLight, dark: Colors.errorDark)
//    }

    /// Цвета
    enum Colors {
        static let primary: Color = Color("Primary")
        static let secondary: Color = Color("Secondary")
        static let background: Color = Color("Background")
        static let error: Color = Color("Error")

        @available(*, deprecated, message: "Используйте это только для тестирования")
        static let green: Color = Color(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1))
        
        @available(*, deprecated, message: "Используйте это только для тестирования")
        static let red: Color = Color(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1))
        
        @available(*, deprecated, message: "Используйте это только для тестирования")
        static let blue: Color = Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1))
    }

    /// Шрифты с размерами
    enum Fonts {
        static let h0: Font = Font.system(size: 36)
        static let h1: Font = Font.system(size: 24)
        static let h2: Font = Font.system(size: 20)
        static let h3: Font = Font.system(size: 16)
        static let h4: Font = Font.system(size: 14)
    }

    enum Size {
        static let normal: CGFloat = 40
        static let standart: CGFloat = 28
        static let short: CGFloat = 14
        
    }

    /// Отступы
    enum Spacing {
        static let long: CGFloat = 128
        static let big: CGFloat = 32
        static let standart: CGFloat = 16
        static let short: CGFloat = 8
    }

    /// Иконки
    enum Icons {
        static let minus: String = "minus"
        static let plus: String = "plus"
        static let gear: String = "gear"
    }
}
