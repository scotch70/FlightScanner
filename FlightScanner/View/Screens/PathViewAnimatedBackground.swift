//
//  PathViewAnimatedBackground.swift
//  FlightScanner
//
//  Created by Ian Donker on 18/11/2021.
//

import SwiftUI

struct PathViewAnimatedBackground: View {
    @State var isAnimating = false
    var itemsPerRow = 5
    var body: some View {
        ZStack {
            ZStack(alignment: .topTrailing) {
                Image(systemName: "sun.max.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.yellow)
                    .padding()
                
                VStack(spacing: 5) {
                    ForEach(0..<4) { _ in
                        HStack(spacing: 8) {
                            ForEach(0..<self.itemsPerRow) { _ in
                                Image(systemName: "cloud.fill")
                                    .foregroundColor(.white)
                                    .frame(width: UIScreen.main.bounds.width/CGFloat(self.itemsPerRow), height: UIScreen.main.bounds.width/CGFloat(self.itemsPerRow))
                                    .opacity(self.isAnimating ? 1 : 0)
                                    .animation(
                                        Animation
                                            .linear(duration: Double.random( in: 1.0...20.0))
                                            .delay(Double.random(in: 0...20.0))
                                            .repeatForever(autoreverses: false)
                                    )
                            }
                        }
                    }
                }
                .onAppear() {
                    self.isAnimating = true
                }
            }
        }
        .background(Color.blue)
    }
    
    func numberOfRows() -> Int {
        let heightPerItem =
        UIScreen.main.bounds.width/CGFloat(self.itemsPerRow)
        return Int(UIScreen.main.bounds.height/heightPerItem)
    }
}

struct PathViewAnimatedBackground_Previews: PreviewProvider {
    static var previews: some View {
        PathViewAnimatedBackground()
    }
}
