//
//  ContentView.swift
//  Shared
//
//  Created by Sam Kissee on 1/22/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var alertIsVisible: Bool = false
    @State private var sliderValue: Double = 50.0
    @State private var game: Game = Game()
    
    
    var body: some View {
        VStack {
            // Header Text
            Text("🎯🎯🎯 \nPUT THE BULLSEYE AS CLOSE AS YOU CAN TO")
                .bold()
                .kerning(2.0)
                .multilineTextAlignment(.center)
                .lineSpacing(4.0)
                .font(.footnote)
            // Target Value
            Text(String(game.targetValue))
                .font(.largeTitle)
                .kerning(-1.0)
                .fontWeight(.black)
            // Slider
            HStack {
                Text("1")
                    .bold()
                Slider(value: self.$sliderValue, in: 1.0...100.0)
                Text("100")
                    .bold()
            }
            // Button 1
            Button(action: {
                self.alertIsVisible = true
            }) {
                Text("Hit Me")
            }
            .alert(isPresented: $alertIsVisible, content: {
                let sliderInt: Int = Int(self.sliderValue.rounded())
                let points: Int = self.game.points(sliderValue: sliderInt)
                return Alert(title: Text("Hello There"), message: Text("The slider's value is \(sliderInt). \n" + "You scored \(points) points this round"), dismissButton: .default(Text("Awesome!")))
            })
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
//        ContentView()
        ContentView()
            .previewLayout(
                .fixed(width: 568, height: 320)
            )
    }
}
