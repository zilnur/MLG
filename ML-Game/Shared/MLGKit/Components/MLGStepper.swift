//
//  MLGStepper.swift
//  ML-Game
//
//  Created by Dmitry Leukhin on 13.10.2022.
//

import SwiftUI

struct MLGStepper : View {
    @State var value: Int = 0

    var body: some View {
        HStack(spacing: Design.Spacing.short) {
            Button {
                value = value - 1
                feedback()
            } label: { Image(systemName: Design.Icons.minus) }
            .padding(Design.Size.short)
            .foregroundColor(Design.Colors.primary)

            Divider()

            Text("\(value)")
                .frame(width: Design.Spacing.big)
                .font(Design.Fonts.h3)

            Divider()

            Button {
                value = value + 1
                feedback()
            } label: { Image(systemName: Design.Icons.plus) }
            .foregroundColor(Design.Colors.primary)
            .setupImageSize()
        }
        .padding(Design.Spacing.short)
        .background(Design.Colors.background)
        .clipShape(
            RoundedRectangle(
                cornerRadius: Design.Spacing.short,
                style: .continuous
            )
        )
    }

    func feedback() {
        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.impactOccurred()
    }
}

struct CustomStepper_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MLGStepper()
                .preferredColorScheme(.dark)
        }
        .previewLayout(.sizeThatFits)
        .padding(8)
    }
}

