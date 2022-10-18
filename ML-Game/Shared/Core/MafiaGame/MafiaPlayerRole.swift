//
//  MafiaPlayerRole.swift
//  ML-Game (iOS)
//
//  Created by Dmitry Leukhin on 12.10.2022.
//

import Foundation

/// Перечисление с ролями игроков
enum MafiaPlayerRole: Codable {
    case mafia
    case civilian
    case commissioner
}
