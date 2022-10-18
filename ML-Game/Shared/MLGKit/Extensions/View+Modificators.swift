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
    /// Модификатор для применения стиля под картинки на кнопках
    func setupImageSize() -> some View {
        modifier(SetupImageSize())
    }
}
