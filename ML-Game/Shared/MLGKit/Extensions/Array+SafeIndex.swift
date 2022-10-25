//
//  Array+SafeIndex.swift
//  ML-Game (iOS)
//
//  Created by Dmitry Leukhin on 18.10.2022.
//

import Foundation

extension Collection {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
