//
//  ContentView.swift
//  Memorize
//
//  Created by Winson Chow on 6/3/22.
//

import SwiftUI

struct ContentView: View {
    var vehicleEmojis = ["🚂", "🚀", "🚁", "🚜", "🚲", "🚗", "🚌", "🚐", "🛴", "🚝", "🛳", "🛸", "🚒", "🚙", "🏍", "🛰", "⛵️"]
    //var foodEmojis = ["🥐", "🥯", "🍞", "🥖", "🍳", "🥞", "🧇", "🥓", "🍗", "🍔"]
    //var animalEmojis = ["🐅", "🐆", "🦓", "🦍", "🦧", "🦣", "🐘", "🦛", "🦏", "🐪"]
    
    @State var emojiCount = 6
    
    var body: some View {
        VStack {
            Text("Memorize!").font(.largeTitle)
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(vehicleEmojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)
            
            Spacer()
            
            HStack {
                Spacer()
                vehicleThemeButton
                Spacer()
                //foodThemeButton
                Spacer()
                //animalThemeButton
                Spacer()
            }
            .font(.largeTitle)
            .padding(.horizontal)
            
        }
        .padding(.horizontal)
    }
    
    var vehicleThemeButton: some View {
        Button {

        } label: {
            VStack {
                Image(systemName: "car")
                Text("Vehicles").font(.body)
            }
        }
    }
    
//    var foodThemeButton: some View {
//        Button {
//
//        } label: {
//            VStack {
//                Image(systemName: "fork.knife")
//                Text("Food").font(.body)
//            }
//        }
//    }
    
//    var animalThemeButton: some View {
//        Button {
//
//        } label: {
//            VStack {
//                Image(systemName: "pawprint")
//                Text("Animals").font(.body)
//            }
//        }
//    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 25.0)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
.previewInterfaceOrientation(.portrait)
        ContentView()
            .preferredColorScheme(.dark)
    }
}
