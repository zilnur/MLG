//
//  MLGCellWithStepper.swift
//  ML-Game (iOS)
//
//  Created by Dmitry Leukhin on 14.10.2022.
//

import SwiftUI

struct MLGCellWithStepper : View {
    var title: String
    @Binding var range: Range<Int>
    @Binding var value: Int
    var onUpdateValue: (()->())?

    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: Design.Spacing.short) {
                Text(title)
                    .foregroundColor(Design.Colors.primary)
                    .font(Design.Fonts.h3)
                Spacer()
                MLGStepper(range: $range, value: $value, onUpdateValue: onUpdateValue)
            }
        }
        .padding(Design.Spacing.short)
    }
}

struct MLGCellWithStepper_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MLGCellWithStepper(title: "Мафия", range: .constant(0..<10), value: .constant(0))
        }
        .previewLayout(.sizeThatFits)
        .padding(8)
    }
}
