//
//  ListRowEdit.swift
//  SwiftUICookBook
//
//  Created by MIKHAIL ZHACHKO on 29.02.24.
//

import SwiftUI

struct ListRowEdit: View {
    //MARK: - Variables
    @Environment(\.editMode) private var editMode
    
    @State private var countries = ["USA", "Canada", "Mexico", "England", "Spain", "Cameroon", "South Africa", "Japan", "South Korea"]
    
    private func deleteItem(at indexSet: IndexSet) {
        countries.remove(atOffsets: indexSet)
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
        .toolbar {
            if self.editMode?.wrappedValue == .active {
                Button("Done") {
                    self.editMode?.wrappedValue = .inactive
                }
            } else {
                Button("Edit") {
                    self.editMode?.wrappedValue = .active
                }
            }
        }
        .navigationViewStyle(.stack)
    }
}

#Preview {
    ListRowEdit()
}
