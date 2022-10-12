//
//  ContentView.swift
//  Shared
//
//  Created by Damir Yumaguzhin on 10/12/22.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        NavigationView {
            VStack(spacing: 113) {
                VStack(spacing: 19) {
                    Text("Мафия")
                        .font(.system(size: 36))
                        .fontWeight(.bold)
                        .frame(width: 127.0, height: 44.0)
                    
                    Text("Начните игру прямо сейчас")
                        .font(.system(size: 16))
                        .fontWeight(.light)
                }
                VStack {
                    NavigationLink(destination: {
                        OfflineMafiaGameSettingsScreen()
                    }, label: {
                        Text("Начать игру")
                    })
                    .frame(width: 250.0, height: 50.0)
                    .foregroundColor(colorScheme == .dark ? Color.black : Color.white)
                    .background(colorScheme == .dark ? Color.white : Color.black)
                    .clipShape(RoundedRectangle(cornerRadius: 60))
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
