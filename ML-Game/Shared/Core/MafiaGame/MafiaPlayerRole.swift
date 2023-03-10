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
    case yakuza
    // Red roles
    case commissioner
    case doctor
    case civilian
    case journalist
    case whore
    // Отсутствие роли
    case none
}
