//
//  MafiaPlayerProtocol.swift
//  ML-Game (iOS)
//
//  Created by Dmitry Leukhin on 12.10.2022.
//

import Foundation

protocol MafiaPlayerProtocol {
    var id: Int { get set }
    var role: MafiaPlayerRole { get set }
    var name: String { get set }
    var isAlive: Bool { get set }
}
