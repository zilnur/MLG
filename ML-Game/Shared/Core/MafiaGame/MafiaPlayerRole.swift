//
//  MafiaPlayerRole.swift
//  ML-Game (iOS)
//
//  Created by Dmitry Leukhin on 12.10.2022.
//

import Foundation

/// Роли игроков
enum MafiaPlayerRole: Codable {
    // Black roles
    case mafia
    case don
    case maniac
    // Red roles
    case commissioner
    case doctor
    case civilian
    case journalist
    // Отсутствие роли
    case none

    var description: String {
        switch self {
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
        }
    }

    var isBlackRole: Bool {
        switch self {
        case .mafia, .don, .maniac:
            return true
        case .commissioner, .doctor, .civilian, .journalist:
            return false
        case .none:
            return false
        }
    }

    var isRedRole: Bool {
        !isBlackRole
    }
}
