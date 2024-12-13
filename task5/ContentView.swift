//
//  ContentView.swift
//  task5
//
//  Created by mi11ion on 11/12/24.
//

import SwiftUI

struct ContentView: View {
    @State private var position = CGPoint(x: 200, y: 120)

    private let colors = [Color.white, .pink, .yellow, .black]
    private var rectColors: [Color] {
        colors.map { color in
            let (r, g, b) = color.rgb
            let luminance = 0.2126 * r + 0.7152 * g + 0.0722 * b
            return luminance < 0.8 ? .white : .black
        }
    }

    var body: some View {
        ZStack {
            VStack(spacing: 0) { ForEach(rectColors, id: \.self) { $0 } }

            VStack(spacing: 0) { ForEach(colors, id: \.self) { $0 } }
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
    var rgb: (red: Double, green: Double, blue: Double) {
        let uiColor = UIColor(self)
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        uiColor.getRed(&red, green: &green, blue: &blue, alpha: nil)
        return (Double(red), Double(green), Double(blue))
    }
}
