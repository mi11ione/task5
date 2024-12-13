//
//  ContentView.swift
//  task5
//
//  Created by mi11ion on 11/12/24.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.self) var environment
    @State private var position = CGPoint(x: 200, y: 120)
    private let colors = [Color.white, .pink, .yellow, .black]

    var body: some View {
        ZStack {
            VStack(spacing: 0) { ForEach(colors.indices, id: \.self) { index in colors[index].contrast(in: environment) } }

            VStack(spacing: 0) { ForEach(colors.indices, id: \.self) { index in colors[index] } }
                .overlay {
                    RoundedRectangle(cornerRadius: 20)
                        .blendMode(.destinationOut)
                        .frame(width: 100, height: 100)
                        .position(position)
                }
                .compositingGroup()
                .gesture(DragGesture().onChanged { position = $0.location })
        }
        .ignoresSafeArea()
    }
}

extension Color {
    func contrast(in environment: EnvironmentValues) -> Color {
        let c = resolve(in: environment)
        return 0.2126 * c.red + 0.7152 * c.green + 0.0722 * c.blue < 0.5 ? .white : .black
    }
}
