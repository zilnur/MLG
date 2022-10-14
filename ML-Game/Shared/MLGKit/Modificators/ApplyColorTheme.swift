//
//  ApplyColorTheme.swift
//  ML-Game (iOS)
//
//  Created by Dmitry Leukhin on 13.10.2022.
//

import SwiftUI

// TODO: - Пока в разработке, ДОДЕЛАТЬ!
private struct ApplyColorTheme: ViewModifier {
    @Environment(\.colorScheme) var colorScheme

    let colorTheme: Design.ColorTheme
    let modifier: (Content, Color) -> Content

    func body(content: Content) -> some View {
        modifier(content, getColor())
    }

    func getColor() -> Color {
        colorScheme == .dark ? colorTheme.dark : colorTheme.light
    }
}

/// Модификатор для наложения цвета элемента, с зависимостью от темы
struct ForegroundColorTheme: ViewModifier {
    @Environment(\.colorScheme) var colorScheme

    let colorTheme: Design.ColorTheme

    func body(content: Content) -> some View {
        let color: Color = colorScheme == .dark ? colorTheme.dark : colorTheme.light

        return content
            .foregroundColor(color)
    }
}

/// Модификатор для наложения цвета фона, с зависимостью от темы
struct BackgroundColorTheme: ViewModifier {
    @Environment(\.colorScheme) var colorScheme

    let colorTheme: Design.ColorTheme

    func body(content: Content) -> some View {
        let color: Color = colorScheme == .dark ? colorTheme.dark : colorTheme.light

        return content
            .background(color)
    }
}

/// Модификатор для наложения цвета в навигации, с зависимостью от темы
struct AccentColorTheme: ViewModifier {
    @Environment(\.colorScheme) var colorScheme

    let colorTheme: Design.ColorTheme

    func body(content: Content) -> some View {
        let color: Color = colorScheme == .dark ? colorTheme.dark : colorTheme.light

        return content
            .accentColor(color)
    }
}
