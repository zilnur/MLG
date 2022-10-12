//
//  OfflineMafiaGameCreateSession.swift
//  ML-Game
//
//  Created by Dmitry Leukhin on 12.10.2022.
//

import SwiftUI

/// Экран создания сессии
struct CreateOfflineSessionScreen: View {
    enum Constants {
        static let title: String = "Application.name".localized
        static let subTitle: String = "CreateOfflineSessionScreen.description".localized
        static let buttonTitle: String = "CreateOfflineSessionScreen.button.title".localized
    }
    var body: some View {
        NavigationView {
            VStack(spacing: Design.Spacing.long) {
                MLGTitleSubtitle(
                    title: Constants.title,
                    subtitle: Constants.subTitle
                )
                MLGNavigationLink {
                    // Переход на экран
                } label: {
                    Text(Constants.buttonTitle)
                }
            }
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
