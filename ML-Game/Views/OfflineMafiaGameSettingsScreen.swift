//
//  OfflineMafiaGameSettingsScreen.swift
//  ML-Game
//
//  Created by Damir Yumaguzhin on 10/12/22.
//

import SwiftUI

struct OfflineMafiaGameSettingsScreen: View {
    @State var isOnToggle = false
    @State var gameSettings = OfflineMafiaGame()
    @State private var playerCount: Int = 1
    @State private var mafiaCount: Int = 1
    
    init() {
        playerCount = gameSettings.settings.playersCount
        mafiaCount = gameSettings.settings.mafiasCount
    }

    var body: some View {
        VStack(spacing: Design.Spacing.big) {
            VStack(spacing: Design.Spacing.long) {
                MLGTitleSubtitle(title: Localization.title, subtitle: Localization.subTitle)
                
                Toggle(isOn: $isOnToggle) {
                    Text(Localization.balanceToggleTitle)
                        .font(.system(size: 16))
                        .fontWeight(.regular)
                }
            }
            VStack(spacing: Design.Spacing.long) {
                VStack(spacing: Design.Spacing.standart) {
                    ZStack {
                        Stepper(
                            Localization.playerCountTitle,
                            value: $playerCount,
                            in: 1...10
                        )
                        Text("\(playerCount)")
                    }
                    ZStack {
                        Stepper(
                            Localization.mafiaCountTitle,
                            value: $mafiaCount,
                            in: 1...2
                        )
                        Text("\(mafiaCount)")
                    }
                }
                VStack {
                    MLGNavigationLink {
                        // TODO: - Переход на следующий экран
                        OfflinePlayerNameInputScreen()
                    } label: {
                        Text(Localization.buttonTitle)
                    }.simultaneousGesture(TapGesture().onEnded {
                        gameSettings.settings.playersCount = playerCount
                        gameSettings.settings.mafiasCount = mafiaCount
                        gameSettings.saveSettings()
                        gameSettings.createPlayer()
                    })
                }
            }
        }
        .padding(Design.Spacing.standart)
    }
}

//MARK: - PreviewProvider
struct OfflineMafiaGameSettingsScreen_Preview: PreviewProvider {
    static var previews: some View {
        OfflineMafiaGameSettingsScreen()
    }
}

//MARK: - Constant
extension OfflineMafiaGameSettingsScreen {
    enum Localization {
        static let title: String = "OfflineMafiaGameSettingsScreen.title".localized
        static let subTitle: String = "OfflineMafiaGameSettingsScreen.subtitle".localized
        static let balanceToggleTitle: String = "OfflineMafiaGameSettingsScreen.balance".localized
        static let playerCountTitle: String = "OfflineMafiaGameSettingsScreen.playerCount".localized
        static let mafiaCountTitle: String = "OfflineMafiaGameSettingsScreen.mafiaCount".localized
        static let buttonTitle: String = "OfflineMafiaGameSettingsScreen.button.title".localized
    }
}
