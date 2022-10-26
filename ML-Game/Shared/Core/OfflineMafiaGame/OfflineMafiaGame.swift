//
//  OfflineMafiaGame.swift
//  ML-Game (iOS)
//
//  Created by Dmitry Leukhin on 12.10.2022.
//

import Foundation
import SwiftUI

///TODO:
/// - Добавить загрузку и сохранение игры
/// - Переписать логику с дефолтсами

class OfflineMafiaGame {
    /// Синглтон свойство
    static let shared: OfflineMafiaGame = OfflineMafiaGame()

    var players: [OfflineMafiaPlayer] = []
    var settings: OfflineMafiaGameSettings = OfflineMafiaGameSettings()
    
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
//        if let encoded = try? JSONEncoder().encode(settings) {
//            UserDefaults.standard.set(encoded, forKey: settingsSaveKey)
//        }
    }
    
    func savePlayers() {
        if let encoded = try? JSONEncoder().encode(players) {
            UserDefaults.standard.set(encoded, forKey: playersSaveKey)
        }
    }

    func createGame() {
        OfflineMafiaPlayersProvider.makeDefaultValueForEmptyNames(of: players)
    }

    func createPlayers() {
        players = OfflineMafiaPlayersProvider.makePlayers(by: settings)
    }

    func createPlayersIfNeeded() {
        guard
            players.isEmpty ||
            players.count != settings.playersCount
        else {
            return
        }
        createPlayers()
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
    func getRole(for index: Int) -> MafiaPlayerRole {
        players[index].role
    }
    
    func set(name: String) {
        players[currentPlayer].name = name
    }
    
    func set(name: String, for index: Int) {
        players[index].name = name
    }
    
    func kill(by index: Int) {
        players[index].isAlive = false
    }
}
