//
//  ContentView.swift
//  SwiftUI Tests
//
//  Created by John Pill on 14/01/2023.
//  Can you make the image rotate too?
//  Come up with your own ideas of how to use these UI elements.

import SwiftUI

struct ContentView: View {
    
    @State private var rotation = 0.0
    @State private var text = "Welcome to SwiftUI"
    
    @State private var colourIndex = 0
    
    var colours: [Color] = [.black, .red, .green, .blue, .indigo, .mint, .pink, .teal]
    var colornames = ["Black", "Red", "Green", "Blue", "Indigo", "Mint", "Pink", "Teal"]
    
    let url = URL(string: "https://source.unsplash.com/random/800x800/?img=1")
    
    
    var body: some View {
        
        VStack(alignment: .center) {
            
            // MARK: TITLE TEXT
            Text("\(text)")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .rotationEffect(.degrees(rotation))
                .animation(.easeInOut(duration: 2), value: rotation)
                .foregroundColor(colours[colourIndex])
                .padding()
            
            //MARK: ASYNC IMAGE WITH PROGRESS VIEW PLACEHOLDER.
            VStack {
                Text("Random Image Genorator")
                    .font(.headline)
                Text("Loading images 'Asyncronously' from the Internet ")
                    .font(.subheadline)
                
                // AsyncImage downloads images from a URL and displays them, it does this 'asyncronously'
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    ProgressView()
                }
                .frame(maxWidth: .infinity)
            }
            
            
            Spacer()
            
            Divider()
            
            // MARK: PICKER WHEEL
            Picker(selection: $colourIndex, label: Text("Color")) {
                ForEach (0 ..< colornames.count, id: \.self) { colour in
                    Text(colornames[colour])
                        .fontWeight(.heavy)
                        .foregroundColor(colours[colour])
                }
            }.pickerStyle(.wheel)
            
            // MARK: SLIDER
            Slider(value: $rotation, in: 0...720, step: 0.1)
                .padding()
            
            // MARK: TEXTFIELD
            TextField("Enter text here...", text: $text)
                .textFieldStyle(.roundedBorder)
                .padding()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
