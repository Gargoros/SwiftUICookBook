//
//  TheStacksView.swift
//  SwiftUICookBook
//
//  Created by MIKHAIL ZHACHKO on 28.02.24.
//

import SwiftUI

struct TheStacksView: View {
    
    var body: some View {
        VStack {
            Text("VStack, 1!")
            Text("VStack, 2!")
            Spacer()
            Divider()
                .background(.black)
            Text("VStack, 3!")
            HStack{
                Text("HStack Item 1")
                Divider()
                    .background(.black)
                Text("HStack Item 2")
                Divider()
                    .background(.black)
                Spacer()
                Text("HStack Item 3")
            }
            .background(.red)
            ZStack{
                Text("ZStack Item 3")
                    .padding()
                    .background(.green)
                    .opacity(0.8)
                Text("ZStack Item 3")
                    .padding()
                    .background(.green)
                    .opacity(0.8)
                    .offset(x: 80, y: -300)
            }
            
            
        }
        .background(.blue)
    }
}

#Preview {
    TheStacksView()
}
