//
//  OfflineMafiaPlayersProvider.swift.swift
//  ML-Game (iOS)
//
//  Created by Dmitry Leukhin on 12.10.2022.
//

import Foundation

final class OfflineMafiaPlayersProvider {
    private var playersCount: Int
    private var mafiasCount: Int

    private var mafiasInGame: Int = 0
    private var commissionerInGame: Int = 0

    private var players: [MafiaPlayerProtocol] = []

    init(settings: MafiaGameSettingsProtocol) {
        playersCount = settings.playersCount
        mafiasCount = settings.mafiasCount
    }

    func getPlayers() -> [MafiaPlayerProtocol] {
        for index in 0..<playersCount {
            players.append(makePlayer(by: index))
        }
        return players
    }

    func makePlayer(by index: Int) -> MafiaPlayerProtocol {
        OfflineMafiaPlayer(
            id: index,
            role: .civilian,
            name: playerName(by: index)
        )
    }

    func playerName(by index: Int) -> String {
        "Игрок \(index)"
    }
}
