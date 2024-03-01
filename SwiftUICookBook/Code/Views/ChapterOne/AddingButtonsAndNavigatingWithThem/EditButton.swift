//
//  EditButton.swift
//  SwiftUICookBook
//
//  Created by MIKHAIL ZHACHKO on 29.02.24.
//

import SwiftUI

struct MyEditButton: View {
    //MARK: - Variables
    @State private var animals: [String] = ["Cats", "Dogs", "Goats"]
    
    //MARK: - Views
    var body: some View {
        List{
            ForEach(animals, id: \.self){ animal in
                Text(animal)
            }
            .onDelete(perform: removeAnimal)
        }
        .toolbar {
            EditButton()
        }
        .navigationTitle("EditButtonView")
    }
    func removeAnimal(at offsets: IndexSet){
        animals.remove(atOffsets: offsets)
    }
}

#Preview {
    MyEditButton()
}
