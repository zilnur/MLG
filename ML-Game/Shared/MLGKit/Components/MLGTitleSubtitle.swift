//
//  MLGTitleSubtitle.swift
//  ML-Game
//
//  Created by Dmitry Leukhin on 13.10.2022.
//

import SwiftUI

/// Компонент, для отрисовки Заголовка и Подзаголовка
struct MLGTitleSubtitle: View {
    var title: String
    var subtitle: String
    var fontTitle: Font
    var fontSubtitle: Font

    init(
        title: String,
        subtitle: String,
        fontTitle: Font = Design.Fonts.h2,
        fontSubtitle: Font = Design.Fonts.h3
    ) {
        self.title = title
        self.subtitle = subtitle
        self.fontTitle = fontTitle
        self.fontSubtitle = fontSubtitle
    }

    var body: some View {
        VStack(spacing: Design.Spacing.short) {
            Text(title)
                .font(fontTitle)
                .fontWeight(Font.Weight.bold)
            Text(subtitle)
                .font(fontSubtitle)
        }
        .padding(Design.Spacing.standart)
    }
}

struct MLGTitleSubtitle_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MLGTitleSubtitle(
                title: "Заголовок",
                subtitle: "Подзаголовок"
            )
        }
    }
}
