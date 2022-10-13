//
//  OfflineMafiaGameSettings.swift
//  ML-Game (iOS)
//
//  Created by Dmitry Leukhin on 12.10.2022.
//

import Foundation

class OfflineMafiaGameSettings: MafiaGameSettingsProtocol, ObservableObject {
    @Published var playersCount: Int = 1
    @Published var mafiasCount: Int = 1
}

