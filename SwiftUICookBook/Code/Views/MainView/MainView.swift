//
//  ContentView.swift
//  SwiftUICookBook
//
//  Created by MIKHAIL ZHACHKO on 27.02.24.
//

import SwiftUI

struct MainView: View {
    //MARK: - Variables
    
    let bookChapter: [Chapter] = Chapter.bookChapters
    @State private var path = NavigationPath()
    
    //MARK: - Views
    var body: some View {
        ZStack {
            NavigationStack(path: $path) {
                List{
                    ForEach(bookChapter, id: \.chapterName) {chapter in
                        NavigationLink(value: chapter) {
                            BookChapterView(
                                chapterNumber: chapter.chapterNumber,
                                chapterName: chapter.chapterName)
                        }
                    }
                }
                
                .navigationTitle(StringConstants.rootNavigationTitle)
                .navigationBarTitleDisplayMode(.inline)
                .navigationDestination(for: Chapter.self) { chapter in
                    RecipeListView(chapter: chapter)
                }
                .navigationDestination(for: SwiftUIRecipe.self) {recipe in
                    RecipeTabView(recipe: recipe)
                }
            }
            .tint(.black)
            
        }
    }
}

#Preview {
    MainView()
}
