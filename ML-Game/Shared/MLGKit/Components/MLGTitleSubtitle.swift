//
//  MLGTitleSubtitle.swift
//  ML-Game
//
//  Created by Dmitry Leukhin on 13.10.2022.
//

import SwiftUI

struct MLGTitleSubtitle: View {
    var title: String
    var subtitle: String

    init(title: String, subtitle: String) {
        self.title = title
        self.subtitle = subtitle
    }

    var body: some View {
        VStack {
            Text(title)
                .font(Design.Fonts.h0)
                .fontWeight(Font.Weight.bold)
            Text(subtitle)
                .font(Design.Fonts.h3)
        }
    }
}
