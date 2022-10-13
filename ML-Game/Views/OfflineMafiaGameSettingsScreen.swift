//
//  OfflineMafiaGameSettingsScreen.swift
//  ML-Game
//
//  Created by Damir Yumaguzhin on 10/12/22.
//

import SwiftUI

struct OfflineMafiaGameSettingsScreen: View {
    @State var isOnToggle = false
    @State var mafiaPlayers: OfflineMafiaGameSettings = OfflineMafiaGameSettings(playersCount: 0, mafiasCount: 0)
    @Environment(\.colorScheme) var colorScheme
    
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
                        Stepper(Localization.playerCountTitle,
                                value: $mafiaPlayers.playersCount,
                                in: 0...10)
                        Text("\(mafiaPlayers.playersCount)")
                    }
                    ZStack {
                        Stepper(Localization.mafiaCountTitle,
                                value: $mafiaPlayers.mafiasCount,
                                in: 0...2)
                        Text("\(mafiaPlayers.mafiasCount)")
                    }
                }
                VStack {
                    MLGNavigationLink {
                        // TODO: - Переход на следующий экран
                        OfflinePlayerNameInputScreen()
                    } label: {
                        Text(Localization.buttonTitle)
                    }
                }
            }
        }
        .padding(.horizontal, 39.0)
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
