//
//  ColorData.swift
//  MappingJsonBundle
//
//  Created by User50 on 24/04/24.
//

import Foundation
import SwiftUI

struct ColorData: Codable, Identifiable {
    var id: Int
    let name,color,image: String
    
    /// Color from hex
    ///
    var uiColor: Color {
        colorFromHexString(color)
    }
    
    /// Image menggunakan SD Symbols
    /// Image(systemName: image)
    /// Jika dari API nya berupa String yang tidak
    /// kompatibel dengan SFSymbol
    ///
    
    var uiImage: Image {
        Image(systemName: image)
    }
}

// MARK: - MOCK DATA
extension ColorData {
    static func loadColorData() -> [ColorData] {
        guard let url = Bundle.main.url(forResource: "Colors", withExtension: "json"), let data  = try? Data(contentsOf: url)
        else{
            fatalError("Failed to load JSON Data from bundle")
        }
        
        do {
            let decodedColor = try JSONDecoder().decode([ColorData].self, from: data)
            return decodedColor
        } catch {
            fatalError("Failed to decode JSON Data from bundle: \(error.localizedDescription)")
        }
    }
}
