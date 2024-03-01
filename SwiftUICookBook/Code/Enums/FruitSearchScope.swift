//
//  FruitSearchScope.swift
//  SwiftUICookBook
//
//  Created by MIKHAIL ZHACHKO on 29.02.24.
//

import Foundation

enum FruitSearchScope: Hashable{
    case all
    case food(Food.Category)
}
