//
//  MafiaGameSettingsProtocol.swift
//  ML-Game (iOS)
//
//  Created by Dmitry Leukhin on 12.10.2022.
//

import Foundation

/// Настройки игры
protocol MafiaGameSettingsProtocol {
    var playersCount: Int { get set }
    var mafiasCount: Int { get set }
}
