//
//  OfflineMafiaPlayersScreen.swift
//  ML-Game (iOS)
//
//  Created by Dmitry Leukhin on 18.10.2022.
//

import SwiftUI

struct OfflineMafiaPlayersScreen: View {
    @State var gameSettings: OfflineMafiaGame = OfflineMafiaGame.shared
    
    var body: some View {
        VStack {
            MLGTitleSubtitle(
                title: "Игроки",
                subtitle: "Роли игроков"
            )
            MLGScrollViewIfNeeded {
                VStack {
                    ForEach(0..<gameSettings.settings.playersCount) { player in
                        HStack {
                            Text("\(gameSettings.players[player].name)")
                                .bold()
                            Spacer()
                            if gameSettings.players[player].role.isRedRole {
                                Text("\(gameSettings.players[player].role.description)")
                                    .foregroundColor(Design.Colors.error)
                            } else {
                                Text("\(gameSettings.players[player].role.description)")
                            }
                            
                        }
                        
                    }
                }
                .padding()
            }
        }
        .onTapGesture {
            hideKeyboard()
        }
    }
}

struct OfflineMafiaPlayersScreen_Preview: PreviewProvider {
    static var previews: some View {
        OfflineMafiaPlayersScreen()
    }
}
