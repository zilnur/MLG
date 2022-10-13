//
//  OfflinePlayerNameInputScreen.swift
//  ML-Game
//
//  Created by Damir Yumaguzhin on 10/13/22.
//

import SwiftUI

struct OfflinePlayerNameInputScreen: View {
    @State var players: [OfflineMafiaPlayer] = OfflineMafiaPlayersProvider(settings: OfflineMafiaGameSettings.init(playersCount: 10, mafiasCount: 2)).getPlayers()
    
    var body: some View {
        VStack {
            MLGTitleSubtitle(title: "Игроки", subtitle: "Задайте имя игрокам")
            ScrollView {
                VStack {
                    ForEach(0..<players.count) { player in
                        TextField("Игрок \(player + 1)", text: $players[player].name)
                            .padding(Design.Spacing.standart)
                            .frame(maxWidth: .infinity)
                            .background(Design.Colors.lightGray)
                            .clipShape(Capsule())
                            .foregroundColor(Design.Colors.primary)
                            .multilineTextAlignment(.center)
                    }
                }
                .padding()
            }
            MLGNavigationLink {
                
            } label: {
                Text("Начать игру")
            }
        }
    }
}

struct OfflineGameSettingsScreen_Preview: PreviewProvider {
    static var previews: some View {
        OfflinePlayerNameInputScreen()
    }
}
