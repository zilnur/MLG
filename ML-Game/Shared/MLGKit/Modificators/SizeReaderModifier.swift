//
//  SizeReaderModifier.swift
//  ML-Game (iOS)
//
//  Created by Dmitry Leukhin on 25.10.2022.
//

import SwiftUI

struct SizeReaderModifier: ViewModifier  {
    @Binding var size: CGSize
    
    func body(content: Content) -> some View {
        content.background(
            GeometryReader { geometry -> Color in
                DispatchQueue.main.async {
                    size = geometry.size
                }
                return Color.clear
            }
        )
    }
}
