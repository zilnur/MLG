//
//  MLGStepper.swift
//  ML-Game
//
//  Created by Dmitry Leukhin on 13.10.2022.
//

import SwiftUI

struct MLGStepper : View {
    var range: Range<Int>

    @Binding var value: Int {
        didSet {
            onUpdateValue?()
        }
    }

    var onUpdateValue: (()->())?

    private var canDecrease: Bool {
        value - 1 >= range.lowerBound
    }
    private var canIncrease: Bool {
        value + 1 <= range.upperBound
    }

    var body: some View {
        HStack(spacing: Design.Spacing.short) {
            makeButton(
                iconName: Design.SystemNames.minus,
                isActive: canDecrease
            ) {
                    value = value - 1
            }

            Divider()
                .padding([.top, .bottom], Design.Spacing.short)

            Text("\(value)")
                .frame(width: Design.Spacing.big)
                .font(Design.Fonts.h3)
                .onChange(of: range) { range in
                    updateValue(range: range)
                }

            Divider()
                .padding([.top, .bottom], Design.Spacing.short)

            makeButton(
                iconName: Design.SystemNames.plus,
                isActive: canIncrease
            ) {
                value = value + 1
            }
        }
        .frame(height: Design.Size.normal)
        .padding(Design.Spacing.short)
        .background(Design.Colors.background)
        .clipShape(
            Capsule()
        )
    }

    private func updateValue(range: Range<Int>) {
        guard !range.contains(value) else { return }

        value = value < range.upperBound ?
            range.lowerBound :
            range.upperBound
    }

    private func makeButton(iconName: String, isActive: Bool, onTapGesture: @escaping () -> ()) -> some View {
        Image(systemName: iconName)
            .resizable()
            .scaledToFit()
            .padding(Design.Spacing.short)
            .frame(
                width: Design.Size.normal,
                height: Design.Size.normal
            )
            .foregroundColor(
                isActive ?
                    Design.Colors.primary :
                    Design.Colors.special
            )
            .contentShape(Rectangle())
            .onTapGesture {
                if isActive {
                    onTapGesture()
                    Feedback.pull()
                } else {
                    
                }
            }
    }
}

struct CustomStepper_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MLGStepper(range: 0..<10, value: .constant(0))
                .preferredColorScheme(.dark)
        }
        .previewLayout(.sizeThatFits)
        .padding(8)
    }
}

