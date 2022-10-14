//
//  FullScreen.swift
//  ML-Game
//
//  Created by Dmitry Leukhin on 12.10.2022.
//

import SwiftUI

// TODO: - Удалить из-за отсутствия необходимости -
struct FullScreenVStack<Content> : View where Content : View {
    var content: Content
    var alignment: Alignment

    init(alignment: Alignment = .center, @ViewBuilder content: () -> Content) {
        self.content = content()
        self.alignment = alignment
    }

    var body: some View {
        VStack {
            content
        }
        .frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity,
            alignment: alignment
        )
    }
}
