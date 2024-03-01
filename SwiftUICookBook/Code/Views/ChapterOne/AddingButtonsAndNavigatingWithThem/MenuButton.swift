//
//  MenuButton.swift
//  SwiftUICookBook
//
//  Created by MIKHAIL ZHACHKO on 29.02.24.
//

import SwiftUI

struct MyMenuButton: View {
    var body: some View {
        Menu(
            "Choose a country") {
                
                Button("Canada") {
                    print("Selected Canada")
                }
                Button("Mexico") {
                    print("Selected Mexico")
                }
                Button("USA") {
                    print("Selected USA")
                }
            }
            .navigationTitle("MenuButtons")
    }
}

#Preview {
    MyMenuButton()
}
