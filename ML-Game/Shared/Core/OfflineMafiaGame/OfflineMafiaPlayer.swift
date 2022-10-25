//
//  OfflineMafiaPlayer.swift
//  ML-Game (iOS)
//
//  Created by Dmitry Leukhin on 12.10.2022.
//

import Foundation

class OfflineMafiaPlayer: MafiaPlayerProtocol, Codable {
    var id: Int
    var role: MafiaPlayerRole
    var name: String
    var isAlive: Bool = true
    
    init(id: Int, role: MafiaPlayerRole, name: String = "") {
        self.id = id
        self.role = role
        self.name = name
    }
    
}
