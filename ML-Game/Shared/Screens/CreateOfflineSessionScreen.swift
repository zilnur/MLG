//
//  OfflineMafiaGameCreateSession.swift
//  ML-Game
//
//  Created by Dmitry Leukhin on 12.10.2022.
//

import SwiftUI

/// Экран создания сессии
struct CreateOfflineSessionScreen: View {
    enum Localization {
        static let title: String = "Application.name".localized
        static let subTitle: String = "CreateOfflineSessionScreen.description".localized
        static let buttonTitle: String = "CreateOfflineSessionScreen.button.title".localized
    }

    @State var isScreenActive: Bool = false

    var body: some View {
        MLGNavigationView {
            VStack(spacing: Design.Spacing.big) {
                MLGTitleSubtitle(
                    title: Localization.title,
                    subtitle: Localization.subTitle
                )
                MLGNavigationLink {
                    // TODO: - Переход на следующий экран
                } label: {
                    Text(Localization.buttonTitle)
                }
                .padding(Design.Spacing.big)
            }
            // Настройки NavigationBar
            .background(
                NavigationLink(
                    destination: MLGUIKitComponentsScreen(),
                    isActive: $isScreenActive
                ) {
                    EmptyView()
                }.hidden()
            )
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: mlgUIKitComponentsScreenButton)
        }
    }

    // Кнопка перехода на экран MLGUIKitComponentsScreen
    var mlgUIKitComponentsScreenButton: some View {
        Button {
            isScreenActive = true
        } label: {
            Image(systemName: "gear")
        }
    }
}

struct CreateOfflineSessionScreen_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CreateOfflineSessionScreen()
        }
    }
}
