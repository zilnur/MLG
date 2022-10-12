//
//  String+Resource.swift
//  ML-Game
//
//  Created by Dmitry Leukhin on 12.10.2022.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
}
