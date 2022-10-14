//
//  String+Resource.swift
//  ML-Game
//
//  Created by Dmitry Leukhin on 12.10.2022.
//

import Foundation

/// Расширение, посзволяющее вытащить текст из Localizable.strings
/// `Application.name.localized` - вернет `Мафия`
extension String {
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }

    /// Статическая переменная, которая вернет пустую строку
    static let empty: String = ""
}
