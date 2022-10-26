//
//  MLGUIKitComponentsScreen.swift
//  ML-Game
//
//  Created by Dmitry Leukhin on 13.10.2022.
//

import SwiftUI

/// Экран для демонстрации существующих компонентов
struct MLGUIKitComponentsScreen: View {
    @State var value: Int = 0
    @State var isChecked: Bool = false

    var body: some View {
        ScrollView(.vertical) {
            VStack {
                components
            }
        }
        .navigationBarTitleDisplayMode(.automatic)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Здесь представлены все компоненты")
                    .font(Design.Fonts.h3)
                    .bold()
            }
        }
    }

    /// Поле компонентов, в него нужно добавлять новые элементы
    var components: some View {
        VStack {
            MLGPreviewComponent {
                MLGTitleSubtitle(
                    title: "Заголовок",
                    subtitle: "Подзаголовок",
                    fontTitle: Design.Fonts.h0,
                    fontSubtitle: Design.Fonts.h2
                )
            }
            MLGPreviewComponent {
                MLGTitleSubtitle(
                    title: "Заголовок",
                    subtitle: "Подзаголовок"
                )
            }
            MLGPreviewComponent {
                MLGNavigationLink {
                    
                } label: {
                    Text("Текст кнопки")
                }
            }
            MLGPreviewComponent {
                MLGStepper(range: 0..<10, value: $value)
            }
            MLGPreviewComponent {
                MLGCellWithStepper(
                    title: "Текст ячейки",
                    range: 0..<10,
                    value: $value
                )
            }
            MLGPreviewComponent {
                MLGCheckbox(isChecked: $isChecked, title: "Текст checkBox")
            }
            MLGPreviewComponent {
                MLGCardView(role: "Мирный житель")
            }
            // <-- Новые компоненты добавлять сюда (коммент не стирать)
        }
    }
}

struct MLGUIKitComponents_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MLGUIKitComponentsScreen()
        }
    }
}
