//
//  DisplayingContextMenus.swift
//  SwiftUICookBook
//
//  Created by MIKHAIL ZHACHKO on 4.03.24.
//

import SwiftUI

struct DisplayingContextMenus: View {
    //MARK: - Variables
    @State private var bulbColor = Color.red
    
    //MARK: - Views
    var body: some View {
        Image(systemName: "lightbulb.fill")
            .font(.system(size: 60))
            .foregroundStyle(bulbColor)
            .contextMenu{
                
                Button("Yellow Bulb") {
                    bulbColor = .yellow
                }
                
                Button("Blue Bulb") {
                    bulbColor = .blue
                }
                
                Button("Green Bulb") {
                    bulbColor = .green
                }
            }
    }
}

#Preview {
    DisplayingContextMenus()
}
