//
//  OfflineMafiaPlayer.swift
//  ML-Game (iOS)
//
//  Created by Dmitry Leukhin on 12.10.2022.
//

import Foundation

struct OfflineMafiaPlayer: MafiaPlayerProtocol {
    var id: PlayerId
    var role: MafiaPlayerRole
    var name: String
    var isAlive: Bool = true
}
