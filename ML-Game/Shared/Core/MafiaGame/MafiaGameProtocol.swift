//
//  MafiaGameProtocol.swift
//  ML-Game (iOS)
//
//  Created by Dmitry Leukhin on 12.10.2022.
//

import Foundation

protocol MafiaGameProtocol {
    var players: [MafiaPlayerProtocol] { get set }
    var settings: MafiaGameSettingsProtocol { get set }

    func setupPlayers()
    func nextPlayer()

    func getCurrentPlayer() -> MafiaPlayerProtocol

    func getRoleOfCurrentPlayer() -> MafiaPlayerRole
    func getRole(for playerId: PlayerId) -> MafiaPlayerRole

    func set(name: String)
    func set(name: String, for playerId: PlayerId)

    func kill(by playerId: PlayerId)
}
