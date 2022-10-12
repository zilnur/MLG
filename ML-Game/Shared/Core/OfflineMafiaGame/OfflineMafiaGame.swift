//
//  OfflineMafiaGame.swift
//  ML-Game (iOS)
//
//  Created by Dmitry Leukhin on 12.10.2022.
//

import Foundation

final class OfflineMafiaGame: MafiaGameProtocol {
    var players: [MafiaPlayerProtocol] = []
    var settings: MafiaGameSettingsProtocol

    private var playersProvider: OfflineMafiaPlayersProvider
    private var currentPlayer: Int = 0

    init(settings: MafiaGameSettingsProtocol) {
        self.settings = settings
        self.playersProvider = OfflineMafiaPlayersProvider(settings: settings)
    }

    func setupPlayers() {
        players = playersProvider.getPlayers()
    }

    func nextPlayer() {
        currentPlayer = currentPlayer + 1 < players.count ? currentPlayer + 1 : currentPlayer
    }

    func getRoleOfCurrentPlayer() -> MafiaPlayerRole {
        getRole(for: currentPlayer)
    }

    func getCurrentPlayer() -> MafiaPlayerProtocol {
        players[currentPlayer]
    }
    func getRole(for playerId: PlayerId) -> MafiaPlayerRole {
        players[playerId].role
    }

    func set(name: String) {
        players[currentPlayer].name = name
    }
    
    func set(name: String, for playerId: PlayerId) {
        players[playerId].name = name
    }
    
    func kill(by playerId: PlayerId) {
        players[playerId].isAlive = false
    }
}
