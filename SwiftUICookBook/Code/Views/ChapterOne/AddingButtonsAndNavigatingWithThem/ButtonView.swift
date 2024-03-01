//
//  ButtonView.swift
//  SwiftUICookBook
//
//  Created by MIKHAIL ZHACHKO on 29.02.24.
//

import SwiftUI

struct ButtonView: View {
    //MARK: - Variables
    @State var count: Int = 0
    
    //MARK: - Views
    var body: some View {
        VStack {
            Text("Welcome to your second view")
            Text("Current count value: \(count)")
                .padding()
            Button(
                action: {
                    count += 1
                },
                label: {
                    Text("Tap to Increment count")
                        .padding()
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .background(.blue)
                        .clipShape(Capsule())
                })
        }
        .navigationTitle("Button View")
    }
}

#Preview {
    ButtonView()
}
