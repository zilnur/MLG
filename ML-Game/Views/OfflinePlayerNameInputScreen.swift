//
//  OfflinePlayerNameInputScreen.swift
//  ML-Game
//
//  Created by Damir Yumaguzhin on 10/13/22.
//

import SwiftUI

struct OfflinePlayerNameInputScreen: View {
    @State var text = ""
    @State var gameSettings = OfflineMafiaGame()
    
    init() {
        gameSettings.getDataPlayers()
    }
    
    var body: some View {
        VStack {
            MLGTitleSubtitle(
                title: "Игроки",
                subtitle: "Задайте имя игрокам"
            )
            ScrollView {
                VStack {
                    ForEach(0..<gameSettings.settings.playersCount) { player in
                        TextField("Игрок \(player + 1)", text: $gameSettings.players[player].name)
                            .padding(Design.Spacing.standart)
                            .frame(maxWidth: .infinity)
                            .background(Design.Colors.backgroundLight)
                            .clipShape(Capsule())
                            .foregroundColor(Color.black)
                            .multilineTextAlignment(.center)
                    }
                }
                .padding()
            }
            MLGNavigationLink {
                
            } label: {
                Text("Начать игру")
            }.simultaneousGesture(TapGesture().onEnded {
                gameSettings.savePlayers()
            })
        }
        .onTapGesture {
            hideKeyboard()
        }
    }
    
}
