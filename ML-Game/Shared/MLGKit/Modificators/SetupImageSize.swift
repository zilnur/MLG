//
//  SetupImageSize.swift
//  ML-Game (iOS)
//
//  Created by Dmitry Leukhin on 14.10.2022.
//

import SwiftUI

/// Модификатор для применения стиля к кнопке
struct SetupImageSize: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(
                width: Design.Size.standart,
                height:  Design.Size.standart
            )
            .contentShape(Rectangle())
    }
}
