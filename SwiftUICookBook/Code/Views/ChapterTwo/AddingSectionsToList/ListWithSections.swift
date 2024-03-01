//
//  ListWithSections.swift
//  SwiftUICookBook
//
//  Created by MIKHAIL ZHACHKO on 29.02.24.
//

import SwiftUI

struct ListWithSections: View {

    var body: some View {
        List{
            Section {
                Text("USA")
                Text("Canada")
                Text("Mexico")
                Text("Panama")
                Text("Anguilla")
            } header: {
                Text("North America")
            }
            Section {
                Text("Nigeria")
                Text("Ghana")
                Text("Kenya")
                Text("Senegal")
            } header: {
                Text("Africa")
            }
            Section {
                Text("Spain")
                Text("France")
                Text("Sweden")
                Text("Finland")
                Text("UK")
            } header: {
                Text("Europe")
            }
        }
        .listStyle(.grouped)
        .navigationTitle("Continents and Countries")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ListWithSections()
}
