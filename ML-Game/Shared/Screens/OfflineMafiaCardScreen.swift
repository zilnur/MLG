//
//  OfflineMafiaCadrScreen.swift
//  ML-Game
//
//  Created by Damir Yumaguzhin on 10/18/22.
//

import SwiftUI

struct OfflineMafiaCardScreen: View {
    @ObservedObject var viewModel: ViewModel = ViewModel()
    
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

// MARK: - PreviewProvider
struct OfflineMafiaCadrScreen_Previews: PreviewProvider {
    static var previews: some View {
        OfflineMafiaCardScreen()
    }
}

// MARK: - ViewModel
extension OfflineMafiaCardScreen {
    class ViewModel: ObservableObject {
        @Published var game: OfflineMafiaGame = OfflineMafiaGame.shared
    }
}
