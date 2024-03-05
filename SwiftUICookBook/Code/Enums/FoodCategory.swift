//
//  ProductsCategoryEnum.swift
//  SwiftUICookBook
//
//  Created by MIKHAIL ZHACHKO on 5.03.24.
//

import Foundation

enum FoodCategory: Int, Identifiable, CaseIterable, Hashable {
    
    case meat
    case vegetable
    case fruit
    
    var id: Int {
        return rawValue
    }
    
    var name: String {
        switch self {
        case .meat:
            return "Meat"
        case .vegetable:
            return "Vegetable"
        case .fruit:
            return "Fruit"
        }
    }
    
}
