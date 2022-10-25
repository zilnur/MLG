//
//  OfflinePlayerNameInputScreen.swift
//  ML-Game
//
//  Created by Damir Yumaguzhin on 10/13/22.
//

import SwiftUI

struct OfflineMafiaPlayerNameInputScreen: View {
    @ObservedObject var viewModel: ViewModel = ViewModel()

    var body: some View {
        VStack {
            MLGSection(title: Localization.sectionTitle) {
                MLGScrollViewIfNeeded {
                    VStack {
                        ForEach(0..<viewModel.game.settings.playersCount) { index in
                            MLGTextField(
                                placeholder: viewModel.defaultName(for: index),
                                text: $viewModel.game.players[index].name
                            )
                        }
                    }
                }
            }

            MLGNavigationLink {
                OfflineMafiaPlayersScreen()
            } label: {
                Text(Localization.buttonTitle)
            }.simultaneousGesture(
                TapGesture().onEnded {
                    viewModel.game.createGame()
                }
            )
        }
        .padding(Design.Spacing.standart)
        .navigationBarTitleDisplayMode(.automatic)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(Localization.title)
                    .font(Design.Fonts.h3)
                    .bold()
            }
        }
        .onTapGesture {
            hideKeyboard()
        }
    }
}

//MARK: - PreviewProvider
struct OfflineMafiaPlayerNameInputScreen_Preview: PreviewProvider {
    static var previews: some View {
        OfflineMafiaPlayerNameInputScreen()
    }
}

// MARK: - ViewModel
extension OfflineMafiaPlayerNameInputScreen {
    class ViewModel: ObservableObject {
        @Published var game: OfflineMafiaGame = OfflineMafiaGame.shared

        init() {
            game.createPlayers()
        }

        func defaultName(for index: Int) -> String {
            "\(Localization.playerName) \(game.players[index].id)"
        }
    }
}

// MARK: - Localization
extension OfflineMafiaPlayerNameInputScreen {
    enum Localization {
        static let title: String = "OfflinePlayerNameInputScreen.title".localized
        static let sectionTitle: String = "OfflinePlayerNameInputScreen.setPlayersName".localized
        static let buttonTitle: String = "OfflinePlayerNameInputScreen.startGame".localized
        static let playerName: String = "OfflinePlayerNameInputScreen.playerName".localized
    }
}

