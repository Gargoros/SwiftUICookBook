//
//  Food.swift
//  SwiftUICookBook
//
//  Created by MIKHAIL ZHACHKO on 29.02.24.
//

import Foundation

struct Food: Hashable{
    
    var name: String
    var category: Category
    
    enum Category: String {
        case fruit
        case meat
        case vegetable
    }
}
