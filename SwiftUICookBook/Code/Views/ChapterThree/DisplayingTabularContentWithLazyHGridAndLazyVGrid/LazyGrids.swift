//
//  LazyGrids.swift
//  SwiftUICookBook
//
//  Created by MIKHAIL ZHACHKO on 1.03.24.
//

import SwiftUI

struct LazyGrids: View {
    //MARK: - Variables
    let columnSpec = [
          GridItem(.adaptive(minimum: 100))
    ]
    
    let rowSpec = [
          GridItem(.flexible()),
          GridItem(.flexible()),
          GridItem(.flexible())
    ]
    
    let colors: [Color] = [.green, .red, .yellow, .blue]
    
    //MARK: - Views
    var body: some View {
        VStack{
            ScrollView{
                LazyVGrid(columns: columnSpec, spacing: 20) {
                    ForEach(0...999, id: \.self) { index in
                            Text("Item: \(index)")
                            .padding(EdgeInsets(top: 30, leading: 15, bottom: 30, trailing: 15))
                            .background(colors[index % colors.count])
                            .clipShape(Capsule())
                    }
                }
            }
            ScrollView(.horizontal){
                LazyHGrid(rows: rowSpec, spacing: 20){
                    ForEach(0...999, id: \.self) { index in
                            Text("Item: \(index)")
                            .padding(EdgeInsets(top: 30, leading: 15, bottom: 30, trailing: 15))
                            .background(colors[index % colors.count])
                            .clipShape(Capsule())
                    }
                }
            }
        }
    }
}

#Preview {
    LazyGrids()
}
