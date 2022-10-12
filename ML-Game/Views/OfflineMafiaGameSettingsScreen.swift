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
        VStack(spacing: 70) {
            VStack(spacing: 90) {
                VStack(spacing: 7) {
                    Text("Настройте игру")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                    
                    Text("Выберете количество ролей")
                        .font(.system(size: 16))
                        .fontWeight(.regular)
                }
                Toggle(isOn: $isOnToggle) {
                    Text("Сбалансировать")
                        .font(.system(size: 16))
                        .fontWeight(.regular)
                }
            }
            
           VStack(spacing: 109) {
                VStack(spacing: 39) {
                    ZStack {
                        Stepper("Всего игроков",
                                value: $mafiaPlayers.playersCount,
                                in: 0...10)
                        Text("\(mafiaPlayers.playersCount)")
                    }
                    
                    ZStack {
                        Stepper("Мафия",
                                value: $mafiaPlayers.mafiasCount,
                                in: 0...2)
                        Text("\(mafiaPlayers.mafiasCount)")
                    }

                }
                
                VStack {
                    Button {
                        
                    } label: {
                        Text("Создать")
                    }
                    .frame(width: 250.0, height: 50.0)
                    .foregroundColor(colorScheme == .dark ? Color.black : Color.white)
                    .background(colorScheme == .dark ? Color.white : Color.black)
                    .clipShape(RoundedRectangle(cornerRadius: 60))
                }
            }
        }
        .padding(.horizontal, 39.0)
    }
}

