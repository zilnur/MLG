//
//  MLGUIKitComponentsScreen.swift
//  ML-Game
//
//  Created by Dmitry Leukhin on 13.10.2022.
//

import SwiftUI

/// Экран для демонстрации существующих компонентов
struct MLGUIKitComponentsScreen: View {
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                Text("Здесь представлены все разработанные компоненты")
                    .font(Design.Fonts.h2)
                    .bold()
                    .padding(Design.Spacing.standart)
                    .multilineTextAlignment(.center)
                components
            }
        }
    }

    var components: some View {
        VStack {
            MLGPreviewComponent {
                MLGTitleSubtitle(title: "Заголовок", subtitle: "Подзаголовок")
            }
            MLGPreviewComponent {
                MLGNavigationLink {
                    
                } label: {
                    Text("Текст кнопки")
                }
            }
            // <-- Новые компоненты добавлять сюда
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
