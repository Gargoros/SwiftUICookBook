//
//  SwiftUIRecipe.swift
//  SwiftUICookBook
//
//  Created by MIKHAIL ZHACHKO on 28.02.24.
//

import SwiftUI

struct SwiftUIRecipe: Hashable {
    
    static func == (lhs: SwiftUIRecipe, rhs: SwiftUIRecipe) -> Bool {
        lhs.id == rhs.id
    }
    
        func hash(into hasher: inout Hasher) {
            hasher.combine(self.id)
        }
    
    let id = UUID().uuidString
    let recipeChapterName: String
    let recipeName: String
    let recipeHowItWorks: String
    let recipeCode: String
    
    let view: AnyView
    
    init<V: View>(recipeChapterName: String, recipeName: String, recipeHowItWorks: String, recipeCode: String, view: V) {
        self.recipeChapterName = recipeChapterName
        self.recipeName = recipeName
        self.recipeHowItWorks = recipeHowItWorks
        self.recipeCode = recipeCode
        self.view = AnyView(view)
    }
}
