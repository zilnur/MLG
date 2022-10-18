//
//  OfflineMafiaGame.swift
//  ML-Game (iOS)
//
//  Created by Dmitry Leukhin on 12.10.2022.
//

import Foundation
import SwiftUI

class OfflineMafiaGame: ObservableObject {
    @Published var players: [OfflineMafiaPlayer] = []
    @Published var settings: OfflineMafiaGameSettings = OfflineMafiaGameSettings()
    
    let playersSaveKey = "SavedPlayersData"
    let settingsSaveKey = "SavedSettingsData"
    
    private var currentPlayer: Int = 0
    
    init() {
        getDataSettings()
        getDataPlayers()
    }
    
    func getDataPlayers() {
        if let data = UserDefaults.standard.data(forKey: playersSaveKey) {
            if let decoded = try? JSONDecoder().decode([OfflineMafiaPlayer].self, from: data) {
                players = decoded
            }
        }
    }
    
    func getDataSettings() {
        if let data = UserDefaults.standard.data(forKey: settingsSaveKey) {
            if let decoded = try? JSONDecoder().decode(OfflineMafiaGameSettings.self, from: data) {
                settings = decoded
            }
        }
    }
    
    func saveSettings() {
        if let encoded = try? JSONEncoder().encode(settings) {
            UserDefaults.standard.set(encoded, forKey: settingsSaveKey)
        }
    }
    
    func savePlayers() {
        if let encoded = try? JSONEncoder().encode(players) {
            UserDefaults.standard.set(encoded, forKey: playersSaveKey)
        }
    }
    
    func createPlayer() {
        getDataPlayers()
        for id in 1...settings.playersCount {
            let player = OfflineMafiaPlayer(id: id, role: .civilian)
            players.append(player)
        }
        savePlayers()
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
