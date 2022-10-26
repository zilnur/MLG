//
//  OfflineMafiaGameSettings.swift
//  ML-Game (iOS)
//
//  Created by Dmitry Leukhin on 12.10.2022.
//

import Foundation

class OfflineMafiaGameSettings: Codable {
    var playersCount: Int = 1
    var mafiasCount: Int = 1

    //TODO: - Возможно перенести в словарь?
    var shouldBeDon: Bool = false
    var shouldBeManiac: Bool = false
    var shouldBeDoctor: Bool = false
    var shouldBeJournalist: Bool = false

    var selectedRolesCount: Int {
        var counter: Int = 0

        counter = shouldBeDon ? counter + 1 : counter
        counter = shouldBeManiac ? counter + 1 : counter
        counter = shouldBeDoctor ? counter + 1 : counter
        counter = shouldBeJournalist ? counter + 1 : counter

        return counter
    }
}

