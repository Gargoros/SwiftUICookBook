//
//  MovingListRows.swift
//  SwiftUICookBook
//
//  Created by MIKHAIL ZHACHKO on 29.02.24.
//

import SwiftUI

struct MovingListRows: View {
    //MARK: - Variables
    @Environment(\.editMode) private var editMode
    
    @State private var countries = ["USA", "Canada", "Mexico", "England", "Spain", "Cameroon", "South Africa" , "Japan", "South Korea"]
    
    private func moveRow(source: IndexSet, destination: Int){
        countries.move(fromOffsets: source, toOffset: destination)
    }
    
    //MARK: - Views
    var body: some View {
        List{
            ForEach(countries, id: \.self){country in
                Text(country)
            }
            .onMove(perform: moveRow)
        }
        .navigationTitle("Countries Move List")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{
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
    }
}

#Preview {
    MovingListRows()
}
