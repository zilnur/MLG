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
                    ForEach(0..<gameSettings.settings.playersCount) { index in
                        let player = gameSettings.players[index]
                        HStack {
                            Text("\(player.name)")
                                .bold()
                            Spacer()
                            if RoleInfoProvider.isRed(role: player.role) {
                                Text("\(RoleInfoProvider.getName(by: player.role))")
                                    .foregroundColor(Design.Colors.error)
                            } else {
                                Text("\(RoleInfoProvider.getName(by: player.role))")
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
