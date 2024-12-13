//
//  ContentView.swift
//  task5
//
//  Created by mi11ion on 11/12/24.
//

import SwiftUI

struct ContentView: View {
    @State private var position = CGPoint(x: 200, y: 120)

    private let rectColors = [Color.black, .white, .black, .white]
    private let backColors = [Color.white, .pink, .yellow, .black]

    var body: some View {
        ZStack {
            VStack(spacing: 0) { ForEach(rectColors, id: \.self) { $0 } }

            VStack(spacing: 0) { ForEach(backColors, id: \.self) { $0 } }
                .overlay {
                    RoundedRectangle(cornerRadius: 20)
                        .blendMode(.destinationOut)
                        .frame(width: 100, height: 100)
                        .position(position)
                }
                .compositingGroup()
                .gesture(
                    DragGesture()
                        .onChanged { position = $0.location }
                )
        }
        .ignoresSafeArea()
    }
}
