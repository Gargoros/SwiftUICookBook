//
//  BookChapterSectionNameView.swift
//  SwiftUICookBook
//
//  Created by MIKHAIL ZHACHKO on 27.02.24.
//

import SwiftUI

struct BookChapterSectionNameView: View {
    //MARK: - Variables
    let chapterName: String
    
    //MARK: - Views
    var body: some View {
        Text(chapterName)
            .font(.title3)
            .fontWeight(.bold)
    }
}

#Preview {
    BookChapterSectionNameView(chapterName: "Chapter")
}
