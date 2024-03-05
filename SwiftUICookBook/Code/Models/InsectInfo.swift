//
//  InsectInfo.swift
//  SwiftUICookBook
//
//  Created by MIKHAIL ZHACHKO on 3.03.24.
//

import Foundation

struct InsectInfo: Decodable, Identifiable {
    var id: Int
    var imageName: String
    var name: String
    var habitat: String
    var description: String
}
