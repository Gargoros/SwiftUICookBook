//
//  BookChapterView.swift
//  SwiftUICookBook
//
//  Created by MIKHAIL ZHACHKO on 27.02.24.
//

import SwiftUI

struct BookChapterView: View {
    //MARK: - Variables
    let chapterNumber: Int
    let chapterName: String
    
    //MARK: - Views
    var body: some View {
        Text("\(chapterNumber): \(chapterName)")
            .font(.headline)
    }
}

#Preview {
    BookChapterView(chapterNumber: 1, chapterName: "Chapter 1")
}
