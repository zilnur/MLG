//
//  MLGScrollViewIfNeeded.swift
//  ML-Game (iOS)
//
//  Created by Dmitry Leukhin on 25.10.2022.
//

import SwiftUI

struct MLGScrollViewIfNeeded<Content: View>: View {
    @ViewBuilder let content: () -> Content

    @State private var scrollViewSize: CGSize = .zero
    @State private var contentSize: CGSize = .zero

    private var shouldScroll: Bool {
        scrollViewSize.height <= contentSize.height
    }

    var body: some View {
        ScrollView(shouldScroll ? [.vertical] : []) {
            content()
                .readSize($contentSize)
        }
        .readSize($scrollViewSize)
    }
}
