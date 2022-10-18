//
//  OfflineMafiaCadrScreen.swift
//  ML-Game
//
//  Created by Damir Yumaguzhin on 10/18/22.
//

import SwiftUI

struct OfflineMafiaCadrScreen: View {
    @ObservedObject var gameSettings = OfflineMafiaGame()
    
    var body: some View {
        VStack() {
            MLGTitleSubtitle(
                title: "Игрок 1",
                subtitle: "Ваша роль"
            )
            Spacer()
            MLGCardView()
            Spacer()
            MLGNavigationLink {
                
            } label: {
                Text("Следующий игрок")
            }
        }
        .onTapGesture {
            hideKeyboard()
        }
    }
}

struct OfflineMafiaCadrScreen_Previews: PreviewProvider {
    static var previews: some View {
        OfflineMafiaCadrScreen()
    }
}
