//
//  MLGNavigationView.swift
//  ML-Game
//
//  Created by Dmitry Leukhin on 13.10.2022.
//

import SwiftUI

/// Компонент, для отрисовки NavigationLink со стандартными параметрами, снутри контейнера будет отступать на значение
struct MLGNavigationView<Content> : View where Content : View {
    @Environment(\.colorScheme) var colorScheme

    var content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        NavigationView {
            content
        }
        .accentColor(Design.Colors.primary)
    }
}
