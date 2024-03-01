//
//  ListRowAdd.swift
//  SwiftUICookBook
//
//  Created by MIKHAIL ZHACHKO on 29.02.24.
//

import SwiftUI

struct ListRowAdd: View {
    
    //MARK: - Variables
    @State var numbers = [1, 2, 3, 4]
    
    private func addItemToRow(){
        self.numbers.append(Int.random(in: 5..<100))
    }
    
    //MARK: - Views
    var body: some View {
        List{
            ForEach(self.numbers, id: \.self) {number in
                    Text("\(number)")
            }
            .navigationTitle("Number List")
        }
        .toolbar{
            Button("Add") {
                addItemToRow()
            }
        }
        
    }
}

#Preview {
    ListRowAdd()
}
