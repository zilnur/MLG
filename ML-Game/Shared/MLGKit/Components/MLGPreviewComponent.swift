//
//  MLGPreviewComponent.swift
//  ML-Game
//
//  Created by Dmitry Leukhin on 13.10.2022.
//

import SwiftUI

/// Компонент для описания элементов, находящихся внутри него
struct MLGPreviewComponent<Content> : View where Content : View {
    var content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        VStack {
            Text(String(describing: type(of: content)))
                .foregroundColor(Design.Colors.primary)
                .padding(Design.Spacing.standart)
            content
                .frame(maxWidth: .infinity)
                .background(Design.Colors.tech2)
                .padding(Design.Spacing.standart)
                
        }
        .frame(maxWidth: .infinity)
        .background(Design.Colors.tech3)
    }
}
