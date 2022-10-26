//
//  MLGCardView.swift
//  ML-Game
//
//  Created by Damir Yumaguzhin on 10/18/22.
//

import SwiftUI

struct MLGCardView: View {
    //MARK: Variables
    @State var backDegree = 0.0
    @State var frontDegree = -90.0
    @State var isFlipped = false
    
    @State var role: String
    
    let durationAndDelay : CGFloat = 0.2

    //MARK: Flip Card Function
    func flipCard () {
        isFlipped = !isFlipped
        if isFlipped {
            withAnimation(.linear(duration: durationAndDelay)) {
                backDegree = 90
            }
            withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)){
                frontDegree = 0
            }
        } else {
            withAnimation(.linear(duration: durationAndDelay)) {
                frontDegree = -90
            }
            withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)){
                backDegree = 0
            }
        }
    }
    //MARK: View Body
    var body: some View {
        ZStack {
            CardFront(role: role, degree: $frontDegree)
            CardBack(degree: $backDegree)
        }.onTapGesture {
            flipCard ()
        }
    }
}

struct CardFront : View {
    @State var role: String
    @Binding var degree : Double

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(.white)
                .frame(maxWidth: .infinity)
                .aspectRatio(0.65, contentMode: .fit)
                .shadow(color: .gray, radius: 3, x: 1, y: 1)
                .padding(Design.Spacing.big)

            Text(role)
                .font(.system(size: 36))
                .foregroundColor(Color.black)

        }.rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))
    }
}

struct CardBack : View {
    @Binding var degree : Double

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(.white)
                .frame(maxWidth: .infinity)
                .aspectRatio(0.65, contentMode: .fit)
                .shadow(color: .gray, radius: 3, x: 1, y: 1)
                .padding(Design.Spacing.big)

            Text("?")
                .font(.system(size: 42))
                .foregroundColor(Color.black)
            
        }.rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))

    }
}

struct MLGCardView_Previews: PreviewProvider {
    static var previews: some View {
        MLGCardView(role: "Мирный житель")
    }
}
