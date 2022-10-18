//
//  MLGCellWithStepper.swift
//  ML-Game (iOS)
//
//  Created by Dmitry Leukhin on 14.10.2022.
//

import SwiftUI

struct MLGCellWithStepper : View {
    @State var value: Int = 0

    var body: some View {
        VStack(alignment: .leading) {
            Spacer()

            HStack(spacing: Design.Spacing.short) {
                Text("Мафия")
                    .foregroundColor(Design.Colors.primary)
                    .font(Design.Fonts.h3)

                Spacer()

                MLGStepper(value: 1)
            }
            .lineLimit(1)

            Text("Слишком большое значение")
                .foregroundColor(Design.Colors.error)
                .font(Design.Fonts.h3)
        }
    }

    func feedback() {
        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.impactOccurred()
    }
}

struct MLGCellWithStepper_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MLGCellWithStepper()
                .preferredColorScheme(.dark)
        }
        .previewLayout(.sizeThatFits)
        .padding(8)
    }
}

