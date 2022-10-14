//
//  MLGPreviewComponent.swift
//  ML-Game
//
//  Created by Dmitry Leukhin on 13.10.2022.
//

import SwiftUI

/// Компонент для описания элементов, находящихся внутри него
struct MLGPreviewComponent<Content> : View where Content : View {
    @Environment(\.colorScheme) var colorScheme

    var content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        VStack {
            Text(String(describing: type(of: content)))
                .backgroundColorTheme(Design.ColorThemes.secondary)
                .padding(Design.Spacing.standart)
            content
                .frame(maxWidth: .infinity)
                .backgroundColorTheme(Design.ColorThemes.secondary)
                .padding(Design.Spacing.standart)
        }
        .frame(maxWidth: .infinity)
        .backgroundColorTheme(Design.ColorThemes.primary)
        .clipShape(RoundedRectangle(cornerRadius: Design.Spacing.standart))
        .padding(Design.Spacing.standart)
    }
}
