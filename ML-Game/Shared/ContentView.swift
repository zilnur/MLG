//
//  ContentView.swift
//  Shared
//
//  Created by Damir Yumaguzhin on 10/12/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button {
                
            } label: {
                Text("Нажми на меня")
            }
            ZStack {
                RoundedRectangle(cornerRadius: 20).fill(Color.blue).offset(y: 30).shadow(radius: /*@START_MENU_TOKEN@*/5/*@END_MENU_TOKEN@*/)
                Text("Никита пидр")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
