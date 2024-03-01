//
//  ListRowDelete.swift
//  SwiftUICookBook
//
//  Created by MIKHAIL ZHACHKO on 29.02.24.
//

import SwiftUI

struct ListRowDelete: View {
    //MARK: - Variables
    @State private var countries = ["USA", "Canada", "Mexico", "England",
    "Spain", "Cameroon", "South Africa", "Japan", "South Korea"]
    
    private func deleteItem(at offsets: IndexSet){
        countries.remove(atOffsets: offsets)
    }
    
    //MARK: - Views
    var body: some View {
        List{
            ForEach(countries, id: \.self) {country in
                    Text(country)
            }
            .onDelete(perform: deleteItem)
        }
        .navigationTitle("Countries List")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ListRowDelete()
}
