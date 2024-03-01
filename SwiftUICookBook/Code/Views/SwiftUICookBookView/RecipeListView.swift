//
//  RecipeListView.swift
//  SwiftUICookBook
//
//  Created by MIKHAIL ZHACHKO on 27.02.24.
//

import SwiftUI

struct RecipeListView: View {
    //MARK: - Variables
    let chapter: Chapter

    //MARK: - Views
    var body: some View {
        ZStack{
            List {
                Section{
                    ForEach(chapter.recipe, id: \.recipeChapterName) {recipe in
                        NavigationLink(value: recipe) {
                            Text(recipe.recipeChapterName)
                                .foregroundStyle(.black)
                                .font(.headline)
                                .fontWeight(.bold)
                        }
                    }
                } header: {
                    BookChapterSectionNameView(
                        chapterName: chapter.chapterName)
                }
            }
        }
    }
}

#Preview {
    RecipeListView(chapter: Chapter.bookChapters[0])
}
