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
            MLGSection(title: Localization.title) {
                Spacer()

                MLGCardView(role: viewModel.game.getRoleOfCurrentPlayer().description)
                
                Spacer()

                MLGNavigationLink {
                    if viewModel.game.canMoveToNextPlayer() {
                        OfflineMafiaCardScreen()
                    } else {
                        OfflineMafiaPlayersScreen()
                    }
                } label: {
                    if viewModel.game.canMoveToNextPlayer() {
                        Text(Localization.nextPlayer)
                    } else {
                        Text(Localization.goToLeader)
                    }
                   
                }.simultaneousGesture(
                    TapGesture().onEnded {
                        viewModel.game.nextPlayer()
                    }
                )
            }
        }
        .padding(Design.Spacing.standart)
        .navigationBarTitleDisplayMode(.automatic)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(viewModel.game.getCurrentPlayer().name)
                    .font(Design.Fonts.h3)
                    .bold()
            }
        }
        .onTapGesture {
            hideKeyboard()
        }
    }
}

// MARK: - PreviewProvider
struct OfflineMafiaCardScreen_Previews: PreviewProvider {
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

extension OfflineMafiaCardScreen {
    enum Localization {
        static let title: String = "OfflineMafiaCardScreen.button.title".localized
        static let nextPlayer: String = "OfflineMafiaCardScreen.button.nextPlayer".localized
        static let goToLeader: String = "OfflineMafiaCardScreen.button.goToLeader".localized
    }
}
