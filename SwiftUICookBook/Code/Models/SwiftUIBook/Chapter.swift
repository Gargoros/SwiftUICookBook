//
//  Chapter.swift
//  SwiftUICookBook
//
//  Created by MIKHAIL ZHACHKO on 27.02.24.
//

import Foundation
import SwiftUI

struct Chapter: Hashable {
    
    let id = UUID().uuidString
    let chapterNumber: Int
    let chapterName: String
    let recipe: [SwiftUIRecipe]
    
    static func == (lhs: Chapter, rhs: Chapter) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
}


