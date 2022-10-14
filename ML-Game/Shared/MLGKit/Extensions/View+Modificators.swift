//
//  View+ForegroundColorTheme.swift
//  ML-Game (iOS)
//
//  Created by Dmitry Leukhin on 13.10.2022.
//

import SwiftUI

// TODO: - Пока в разработке, ДОДЕЛАТЬ!
//private extension View {
//    @available(*, deprecated, message: "Не используйте это в проекте")
//    func _foregroundColorTheme(_ colorTheme: Design.ColorTheme) -> some View {
//        modifier(
//            ApplyColorTheme(colorTheme: colorTheme) { content, color in
//                content.foregroundColor(color) as! ApplyColorTheme.Content
//            }
//        )
//    }
//
//    @available(*, deprecated, message: "Не используйте это в проекте")
//    func _backgroundColorTheme(_ colorTheme: Design.ColorTheme) -> some View {
//        modifier(
//            ApplyColorTheme(colorTheme: colorTheme) { content, color in
//                content.background(color) as! ApplyColorTheme.Content
//            }
//        )
//    }
//}

extension View {
    /// Модификатор для наложения цвета элемента, с зависимостью от темы
    func foregroundColorTheme(_ colorTheme: Design.ColorTheme) -> some View {
        modifier(ForegroundColorTheme(colorTheme: colorTheme))
    }
    /// Модификатор для наложения цвета фона, с зависимостью от темы
    func backgroundColorTheme(_ colorTheme: Design.ColorTheme) -> some View {
        modifier(BackgroundColorTheme(colorTheme: colorTheme))
    }
    /// Модификатор для наложения цвета в навигации, с зависимостью от темы
    func accentColorTheme(_ colorTheme: Design.ColorTheme) -> some View {
        modifier(AccentColorTheme(colorTheme: colorTheme))
    }
    /// Модификатор для применения стиля под картинки на кнопках
    func setupImageSize() -> some View {
        modifier(SetupImageSize())
    }
}
