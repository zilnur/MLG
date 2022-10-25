//
//  RoleAllocator.swift
//  ML-Game (iOS)
//
//  Created by Dmitry Leukhin on 18.10.2022.
//

import Foundation

/// Распределитель ролей для игроков
enum RoleAllocator {
    /// Число игроков:
    /// 3 и больше.
    /// При малом количестве игроков игра быстро заканчивается,
    /// При большом из-за общего шума и разбиения на кучки обсуждающих теряет смысл.

    /// Правило вычисления количества мафий
    /// Минимальное Mmin = N/4 - где N - общее количество игроков
    /// Максимальное Mmax = N/3 - где N - общее количество игроков
    /// Другие варианты приводят к дисбалансу игры.
    /// Рекомендуется для онлайн игр использовать >= 4 (Мафий меньше)
    /// Для оффлайн между N/4 - N/3

    /// Метод, распределяющий роли среди игроков `players`
    /// - Parameters:
    ///   - players: Массив игроков, у которых будут распределены роли в соответствии с настройками
    ///   - settings: Настройки, на основании которых будут распределятся роли
    static func assign(for players: [OfflineMafiaPlayer], by settings: OfflineMafiaGameSettings) {
        guard settings.playersCount > 1 && settings.playersCount > settings.mafiasCount else { return }
        var freeRolesIndexes: [Int] = Array(0..<settings.playersCount)

        var mafiaRolesIndexes: [Int] = []
        let commissionerIndex: Int
        let doctorIndex: Int
        let donIndex: Int
        let maniacIndex: Int

        var randomIndex: Int

        var mafiasLeft = settings.shouldBeDon ? settings.mafiasCount - 1 : settings.mafiasCount

        while mafiasLeft > 0 {
            randomIndex = Int.random(in: 0..<freeRolesIndexes.count)
            mafiaRolesIndexes.append(freeRolesIndexes.remove(at: randomIndex))
            mafiasLeft = mafiasLeft - 1
        }

        randomIndex = Int.random(in: 0..<freeRolesIndexes.count)
        commissionerIndex = freeRolesIndexes.remove(at: randomIndex)
        players[commissionerIndex].role = MafiaPlayerRole.commissioner

        mafiaRolesIndexes.forEach { index in
            players[index].role = MafiaPlayerRole.mafia
        }

        if settings.shouldBeDoctor && freeRolesIndexes.count > 0 {
            randomIndex = Int.random(in: 0..<freeRolesIndexes.count)
            doctorIndex = freeRolesIndexes.remove(at: randomIndex)
            players[doctorIndex].role = MafiaPlayerRole.doctor
        }
        
        if settings.shouldBeDon && freeRolesIndexes.count > 0 {
            randomIndex = Int.random(in: 0..<freeRolesIndexes.count)
            donIndex = freeRolesIndexes.remove(at: randomIndex)
            players[donIndex].role = MafiaPlayerRole.don
        }

        if settings.shouldBeManiac && freeRolesIndexes.count > 0 {
            randomIndex = Int.random(in: 0..<freeRolesIndexes.count)
            maniacIndex = freeRolesIndexes.remove(at: randomIndex)
            players[maniacIndex].role = MafiaPlayerRole.maniac
        }

        freeRolesIndexes.forEach { index in
            players[index].role = MafiaPlayerRole.civilian
        }
    }

    static func validate(gameSettings: OfflineMafiaGameSettings) -> String {
        guard gameSettings.playersCount > gameSettings.mafiasCount else {
            return Localization.playersCountLessThenMafiasCount
        }
        return String.empty
    }

    static var playersRange: Range<Int> {
        1..<20
    }

    static func playersRange(for gameSettings: OfflineMafiaGameSettings) -> Range<Int> {
        1..<20
    }

    static func mafiasRange(for gameSettings: OfflineMafiaGameSettings) -> Range<Int> {
        let minMafias = max(1, gameSettings.playersCount / 4)
        let maxMafias = max(1, gameSettings.playersCount / 3)
        let length = maxMafias - minMafias

        let range = NSRange(location: minMafias, length: length)
        return Range(range) ?? 1..<gameSettings.playersCount
    }
}

extension RoleAllocator {
    enum Localization {
        // TODO: Добавить новые случаи
        static let playersCountLessThenMafiasCount: String = "RoleAllocator.validation.playersCountLessThenMafiasCount".localized
    }
}
