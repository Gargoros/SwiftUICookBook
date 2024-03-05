//
//  SimpleNavigation.swift
//  SwiftUICookBook
//
//  Created by MIKHAIL ZHACHKO on 5.03.24.
//

import SwiftUI

struct SimpleNavigation: View {
    var body: some View {
        
        List{
            NavigationLink("Show First View") {
                NavigationFirstView()
            }
            NavigationLink("Show Second View") {
                NavigationSecondView()
            }
            NavigationLink("Show Third View") {
                NavigationThirdView()
            }
            NavigationLink("Show Fourth View") {
                NavigationFourthView()
            }
        }
        .navigationTitle("Top Level")
        .tint(.teal)
        
        
    }
}

#Preview {
    SimpleNavigation()
}
