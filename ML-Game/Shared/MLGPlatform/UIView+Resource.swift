//
//  UIView+Resource.swift
//  ML-Game
//
//  Created by Damir Yumaguzhin on 10/14/22.
//

import SwiftUI

/// Расширение, позволяющее закрывать клавиатуру при вызове метода
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
