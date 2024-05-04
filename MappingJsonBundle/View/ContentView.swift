//
//  ContentView.swift
//  MappingJsonBundle
//
//  Created by User50 on 24/04/24.
//

import SwiftUI

struct ContentView: View {
    let colorData = ColorData.loadColorData()
    var body: some View {
        NavigationStack {
            List {
                ForEach(colorData){ item in
                    ColorRows(items: item)
                }
            }
            .navigationTitle("Color")
        }
    }
}

#Preview {
    ContentView()
}

struct ColorRows: View {
    var items: ColorData
    
    var body: some View {
        HStack {
            items.uiImage
                .resizable()
                .scaledToFit()
                .frame(width: 50,height: 50)
                .padding()
                .background(items.uiColor)
            Text(items.name)
                .font(.title)
                .fontWeight(.bold)
            
        }
    }
}
