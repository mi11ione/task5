//
//  ContentView.swift
//  task5
//
//  Created by mi11ion on 11/12/24.
//

import SwiftUI

struct ContentView: View {
    @State private var position = CGPoint(x: 200, y: 120)
    let colors: [Color] = [.white, .pink, .yellow, .black]

    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                ForEach(colors.indices, id: \.self) { id in
                    Rectangle()
                        .fill(colors[id])
                        .frame(maxHeight: .infinity)
                }
            }

            RoundedRectangle(cornerRadius: 20)
                .fill(.white)
                .blendMode(.difference)
                .frame(width: 100, height: 100)
                .position(x: position.x, y: position.y)
                .gesture(DragGesture().onChanged { value in position = value.location })
        }
        .ignoresSafeArea()
    }
}
