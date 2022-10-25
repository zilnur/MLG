//
//  OfflineMafiaGameSettings.swift
//  ML-Game (iOS)
//
//  Created by Dmitry Leukhin on 12.10.2022.
//

import Foundation

class OfflineMafiaGameSettings: Codable {
    var playersCount: Int = 1 {
        didSet {
            recommendedPlayersRange = RoleAllocator.playersRange(for: self)
        }
    }
    var mafiasCount: Int = 1 {
        didSet {
            recommendedMafiasCount = RoleAllocator.mafiasRange(for: self)
        }
    }

    var recommendedPlayersRange: Range<Int> = 1..<20
    var recommendedMafiasCount: Range<Int> = 1..<3

    // Для теста сделал true
    var shouldBeDon: Bool = true
    var shouldBeManiac: Bool = true
    var shouldBeDoctor: Bool = true
}

