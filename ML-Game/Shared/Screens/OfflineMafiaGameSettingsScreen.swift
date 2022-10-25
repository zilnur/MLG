//
//  OfflineMafiaGameSettingsScreen.swift
//  ML-Game
//
//  Created by Damir Yumaguzhin on 10/12/22.
//

import SwiftUI

struct OfflineMafiaGameSettingsScreen: View {
    @ObservedObject var viewModel: ViewModel = ViewModel()

    var body: some View {
        VStack {
            MLGScrollViewIfNeeded {
                VStack {
                    MLGSection(title: Localization.rolesCount) {
                        MLGCellWithStepper(
                            title: Localization.playerCountTitle,
                            range: $viewModel.playersRange,
                            value: $viewModel.game.settings.playersCount
                        ) {
                            viewModel.playersRange = RoleAllocator.playersRange(for: viewModel.game.settings)
                            viewModel.mafiasRange = RoleAllocator.mafiasRange(for: viewModel.game.settings)
                        }

                        MLGCellWithStepper(
                            title: Localization.mafiaCountTitle,
                            range: $viewModel.mafiasRange,
                            value: $viewModel.game.settings.mafiasCount
                        ) {
                            viewModel.playersRange = RoleAllocator.playersRange(for: viewModel.game.settings)
                            viewModel.mafiasRange = RoleAllocator.mafiasRange(for: viewModel.game.settings)
                        }
                    }

                    MLGSection(title: Localization.additionalRoles) {
                        MLGCheckbox(
                            isChecked: $viewModel.game.settings.shouldBeDon,
                            title: Localization.donRoleTitle,
                            image: Design.Images.donMafia
                        )

                        MLGCheckbox(
                            isChecked: $viewModel.game.settings.shouldBeDoctor,
                            title: Localization.doctorRoleTitle,
                            image: Design.Images.doctor
                        )

                        MLGCheckbox(
                            isChecked: $viewModel.game.settings.shouldBeManiac,
                            title: Localization.maniacRoleTitle,
                            image: Design.Images.maniac
                        )
                    }
                }
            }

            MLGNavigationLink {
                OfflineMafiaPlayerNameInputScreen()
            } label: {
                Text(Localization.buttonTitle)
            }
            // TODO: Нужно ли это нам?
            .simultaneousGesture(
                TapGesture()
                    .onEnded {
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
    }
}

//MARK: - PreviewProvider
struct OfflineMafiaGameSettingsScreen_Preview: PreviewProvider {
    static var previews: some View {
        OfflineMafiaGameSettingsScreen()
    }
}

//MARK: - ViewModel
extension OfflineMafiaGameSettingsScreen {
    class ViewModel: ObservableObject {
        @Published var game: OfflineMafiaGame = OfflineMafiaGame.shared

        @Published var playersRange: Range<Int> = 1..<20
        @Published var mafiasRange: Range<Int> = 1..<3
    }
}

//MARK: - Constant
extension OfflineMafiaGameSettingsScreen {
    enum Localization {
        static let title: String = "OfflineMafiaGameSettingsScreen.title".localized
        static let rolesCount: String = "OfflineMafiaGameSettingsScreen.rolesCount".localized
        static let additionalRoles: String = "OfflineMafiaGameSettingsScreen.additionalRoles".localized
        static let balanceToggleTitle: String = "OfflineMafiaGameSettingsScreen.balance".localized
        static let playerCountTitle: String = "OfflineMafiaGameSettingsScreen.playerCount".localized
        static let mafiaCountTitle: String = "OfflineMafiaGameSettingsScreen.mafiaCount".localized
        static let buttonTitle: String = "OfflineMafiaGameSettingsScreen.button.title".localized
        static let balanced: String = "OfflineMafiaGameSettingsScreen.balanced".localized
        static let donRoleTitle: String = "Common.PlayerRole.don".localized
        static let maniacRoleTitle: String = "Common.PlayerRole.maniac".localized
        static let doctorRoleTitle: String = "Common.PlayerRole.doctor".localized
    }
}
