//
//  Buttons.swift
//  SwiftUICookBook
//
//  Created by MIKHAIL ZHACHKO on 29.02.24.
//

import SwiftUI

struct Buttons: View {
    var body: some View {
        VStack{
            NavigationLink("Button"){
                ButtonView()
            }
            NavigationLink("Edit Button"){
                MyEditButton()
            }
            NavigationLink("Menu Button"){
                MyMenuButton()
            }
            NavigationLink("Paste Button"){
                PasteButton()
            }
            NavigationLink("Details about text"){
                DetailsAboutTextView()
                    .navigationTitle(Text("Detail"))
            }
        }
        .navigationTitle(Text("Buttons"))
    }
}

#Preview {
    Buttons()
}
