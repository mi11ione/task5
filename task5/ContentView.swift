//
//  ContentView.swift
//  task5
//
//  Created by mi11ion on 11/12/24.
//

import SwiftUI

struct ContentView: View {
    @State private var position = CGPoint(x: 200, y: 120)

    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Color.black
                Color.white
                Color.black
                Color.white
            }

            VStack(spacing: 0) {
                Color.white
                Color.pink
                Color.yellow
                Color.black
            }
            .overlay {
                RoundedRectangle(cornerRadius: 20)
                    .blendMode(.destinationOut)
                    .frame(width: 100, height: 100)
                    .position(x: position.x, y: position.y)
            }
            .compositingGroup()
            .gesture(DragGesture().onChanged { value in position = value.location })
        }
        .ignoresSafeArea()
    }
}
