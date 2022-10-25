//
//  OfflineMafiaCreateSessionScreen.swift
//  ML-Game
//
//  Created by Dmitry Leukhin on 12.10.2022.
//

import SwiftUI

/// Экран создания сессии
struct OfflineMafiaCreateSessionScreen: View {
    @State var isScreenActive: Bool = false

    var body: some View {
        MLGNavigationView {
            ZStack {
                VStack(spacing: Design.Spacing.big) {
                    MLGTitleSubtitle(
                        title: Localization.title,
                        subtitle: Localization.subTitle,
                        fontTitle: Design.Fonts.h0
                    )
                    MLGNavigationLink {
                        OfflineMafiaGameSettingsScreen()
                    } label: {
                        Text(Localization.buttonTitle)
                    }
                    .padding(Design.Spacing.big)
                }
                VStack {
                    Spacer()
                    Text(GameFactsProvider.getRandomFact())
                        .font(Design.Fonts.h4)
                        .padding(Design.Spacing.big)
                        .foregroundColor(Design.Colors.special)
                }
            }
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
            Image(systemName: Design.SystemNames.gear)
        }
    }
}

//MARK: - PreviewProvider
struct OfflineMafiaCreateSessionScreen_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            OfflineMafiaCreateSessionScreen()
        }
    }
}

//MARK: - Constant
extension OfflineMafiaCreateSessionScreen {
    enum Localization {
        static let title: String = "Application.name".localized
        static let subTitle: String = "CreateOfflineSessionScreen.description".localized
        static let buttonTitle: String = "CreateOfflineSessionScreen.button.title".localized
    }
}
