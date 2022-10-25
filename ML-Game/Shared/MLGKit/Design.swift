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
    /// Цвета
    enum Colors {
        /// Прозрачая view
        static let clear: Color = Color.clear
        /// Основной цвет (Светлая тема: - Черный | Темная тема: - Белый)
        static let primary: Color = Color("Primary")
        /// Основной цвет (Светлая тема: - Белый | Темная тема: - Черный)
        static let secondary: Color = Color("Secondary")
        /// Основной цвет (Светлая тема: - Светло серый | Темная тема: - Темно серы)
        static let background: Color = Color("Background")
        /// Основной цвет (Светлая тема: - Серый | Темная тема: - Серый)
        static let special: Color = Color("Special")
        /// Основной цвет (Светлая тема: - Красный | Темная тема: - Красный)
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
        /// Шрифт, размером в 36 поинтов
        static let h0: Font = Font.system(size: 36)
        /// Шрифт, размером в 24 поинтов
        static let h1: Font = Font.system(size: 24)
        /// Шрифт, размером в 20 поинтов
        static let h2: Font = Font.system(size: 20)
        /// Шрифт, размером в 16 поинтов
        static let h3: Font = Font.system(size: 16)
        /// Шрифт, размером в 14 поинтов
        static let h4: Font = Font.system(size: 14)
        /// Шрифт, размеров в 6 поинтов
        static let h5: Font = Font.system(size: 6)
    }

    /// Размеры
    enum Size {
        /// Размер 54 поинта
        static let big: CGFloat = 54
        /// Размер 40 поинтов
        static let normal: CGFloat = 32
        /// Размер 28 поинтов
        static let standart: CGFloat = 28
        /// Размер 14 поинтов
        static let short: CGFloat = 14
    }

    /// Отступы
    enum Spacing {
        /// Отступ в 128 поинтов
        static let long: CGFloat = 128
        /// Отступ в 40 поинтов
        static let big: CGFloat = 40
        /// Отступ в 32 поинта
        static let normal: CGFloat = 32
        /// Отступ в 16 поинтов
        static let standart: CGFloat = 16
        /// Отступ в 12 поинтов
        static let small: CGFloat = 12
        /// Отступ в 8 поинтов
        static let short: CGFloat = 8
    }

    /// Ширина (обычно используется для обводки)
    enum Width {
        /// Ширина 2 поинта
        static let standart: CGFloat = 2
        /// Ширина 1 поинт
        static let short: CGFloat = 1
    }

    /// Иконки
    enum SystemNames {
        /// Иконка минуса
        static let minus: String = "minus"
        /// Иконка плюса
        static let plus: String = "plus"
        /// Иконка шестерни
        static let gear: String = "gear"
    }

    enum Images {
        /// Иконка дона мафии
        static let donMafia: Image = Image("donMafia")
        /// Иконка маньяка
        static let maniac: Image = Image("maniac")
        /// Иконка доктора
        static let doctor: Image = Image("doctor")
    }
}
