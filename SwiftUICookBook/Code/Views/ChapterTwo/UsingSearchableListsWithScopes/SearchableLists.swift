//
//  SearchableLists.swift
//  SwiftUICookBook
//
//  Created by MIKHAIL ZHACHKO on 29.02.24.
//

import SwiftUI

struct SearchableLists: View {
    //MARK: - Variables
    @State var searchText: String = ""
    @State var scope: FruitSearchScope = .all
    
    var food: [Food] = Food.sampleFood
    
    var searchResults: [Food] {
        var food: [Food] = self.food
        if case let .food(category) = scope {
            food = food.filter { $0.category == category }
        }
        if !searchText.isEmpty {
            food = food.filter { $0.name.lowercased().contains(searchText.lowercased())}
        }
        return food
    }
    
    //MARK: - Views
    var body: some View {
        List{
            ForEach(searchResults, id: \.self){food in
                LabeledContent(food.name) {
                    Text("\(food.category.rawValue)")
                }
            }
            .searchable(text: $searchText, prompt: "Search for a food")
            .searchScopes($scope, activation: .onSearchPresentation) {
                Text("All").tag(FruitSearchScope.all)
                Text("Fruit").tag(FruitSearchScope.food(.fruit))
                Text("Meat").tag(FruitSearchScope.food(.meat))
                Text("Vegetable").tag(FruitSearchScope.food(.vegetable))
            }
            
            .navigationTitle("Food")
        }
    }
}

#Preview {
    SearchableLists()
}
