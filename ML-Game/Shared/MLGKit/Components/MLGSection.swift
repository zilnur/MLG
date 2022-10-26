//
//  MLGSection.swift
//  ML-Game (iOS)
//
//  Created by Dmitry Leukhin on 25.10.2022.
//

import SwiftUI

struct MLGSection<Content> : View where Content : View {
    var title: String = String.empty
    var spacing: CGFloat = Design.Spacing.standart
    @ViewBuilder var content: Content

    var body: some View {
        VStack(spacing: spacing) {
            if !title.isEmpty {
                Text(title)
                    .font(Design.Fonts.h3)
                    .bold()
            }
            VStack {
                content
            }
        }
        .frame(maxWidth: .infinity)
        .padding(Design.Spacing.short)
    }
}

struct MLGSection_Previews: PreviewProvider {
    @State static var isChecked: Bool = false
    static var previews: some View {
        Group {
            MLGSection(title: "Заголовок") {
                Text("Тестовый элемент 1")
                Text("Тестовый элемент 2")
            }
        }
        .previewLayout(.sizeThatFits)
    }
}
