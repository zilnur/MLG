//
//  OfflinePlayerNameInputScreen.swift
//  ML-Game
//
//  Created by Damir Yumaguzhin on 10/13/22.
//

import SwiftUI

struct OfflinePlayerNameInputScreen: View {
    @EnvironmentObject var gameSettings: OfflineMafiaGameSettings
    @State var text = ""
    
    
    var body: some View {
        VStack {
            MLGTitleSubtitle(
                title: "Игроки",
                subtitle: "Задайте имя игрокам"
            )
            ScrollView {
                VStack {
                    ForEach(0..<gameSettings.playersCount) { player in
                        TextField("Игрок \(player + 1)", text: $text)
                            .padding(Design.Spacing.standart)
                            .frame(maxWidth: .infinity)
                            .background(Design.Colors.background)
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
        .onTapGesture {
            hideKeyboard()
        }
    }
}
