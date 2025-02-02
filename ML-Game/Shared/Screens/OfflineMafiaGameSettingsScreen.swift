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
            MLGSection(title: Localization.rolesCount) {
                MLGCellWithStepper(
                    title: Localization.playerCountTitle,
                    range: viewModel.playersRange,
                    value: $viewModel.game.settings.playersCount
                )

                MLGCellWithStepper(
                    title: Localization.mafiaCountTitle,
                    range: viewModel.mafiasRange,
                    value: $viewModel.game.settings.mafiasCount
                )
            }

            MLGSection(title: Localization.additionalRoles) {
                MLGScrollViewIfNeeded {
                    ForEach(0..<$viewModel.game.settings.shouldBeRole.count) { index in
                        let role = viewModel.game.settings.shouldBeRole[index].role

                        MLGCheckbox(
                            isChecked: $viewModel.game.settings.shouldBeRole[index].isActive,
                            title: RoleInfoProvider.getName(by: role),
                            image: RoleInfoProvider.getImage(by: role),
                            isEnabled: viewModel.isAddingRoleEnabled
                        )
                    }
                }
            }

            MLGSection {
                MLGNavigationLink {
                    OfflineMafiaPlayerNameInputScreen()
                } label: {
                    Text(Localization.buttonTitle)
                }
            }
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

        var playersRange: Range<Int> {
            RoleAllocator.playersRange(for: game.settings)
        }

        var mafiasRange: Range<Int>{
            RoleAllocator.mafiasRange(for: game.settings)
        }

        /// Возможность добавления новой роли в игре (количество ограниченно)
        var isAddingRoleEnabled: Bool {
            game.settings.selectedRolesCount < game.settings.playersCount - game.settings.mafiasCount - 1
        }
    }
}

//MARK: - Localization
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
        static let journalistRoleTitle: String = "Common.PlayerRole.journalist".localized
    }
}
