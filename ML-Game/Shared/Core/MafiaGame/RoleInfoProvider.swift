//
//  RoleInfoProvider.swift
//  ML-Game (iOS)
//
//  Created by Dmitry Leukhin on 13.11.2022.
//

import SwiftUI

enum RoleInfoProvider {

    /// Возвращает имя, соответствующее роли
    static func getName(by role: MafiaPlayerRole) -> String {
        switch role {
        case .mafia:
            return "Common.PlayerRole.mafia".localized
        case .don:
            return "Common.PlayerRole.don".localized
        case .maniac:
            return "Common.PlayerRole.maniac".localized
        case .commissioner:
            return "Common.PlayerRole.commissioner".localized
        case .doctor:
            return "Common.PlayerRole.doctor".localized
        case .civilian:
            return "Common.PlayerRole.civilian".localized
        case .journalist:
            return "Common.PlayerRole.journalist".localized
        case .none:
            return "Common.PlayerRole.none".localized
        case .yakuza:
            return "Common.PlayerRole.yakuza".localized
        case .whore:
            return "Common.PlayerRole.whore".localized
        }
    }

    /// Возвращает картинку, соответствующую роли
    static func getImage(by role: MafiaPlayerRole) -> Image {
        switch role {
        case .don:
            return Design.Images.Roles.donMafia
        case .maniac:
            return Design.Images.Roles.maniac
        case .doctor:
            return Design.Images.Roles.doctor
        case .journalist:
            return Design.Images.Roles.journalist
        case .whore:
            return Design.Images.Roles.whore
        case .yakuza:
            return Design.Images.Roles.yakuza
        default:
            return Design.Images.questionMark
        }
    }

    /// Проверка, является ли роль черной
    static func isBlack(role: MafiaPlayerRole) -> Bool {
        switch role {
        case .mafia, .don, .maniac:
            return true
        case .commissioner, .doctor, .civilian, .journalist, .yakuza, .whore:
            return false
        case .none:
            return false
        }
    }

    /// Проверка, является ли роль красной
    static func isRed(role: MafiaPlayerRole) -> Bool {
        guard role == .none else { return false }
        return !isBlack(role: role)
    }
}
