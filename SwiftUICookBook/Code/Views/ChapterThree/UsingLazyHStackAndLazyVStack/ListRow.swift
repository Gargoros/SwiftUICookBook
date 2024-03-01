//
//  ListRow.swift
//  SwiftUICookBook
//
//  Created by MIKHAIL ZHACHKO on 1.03.24.
//

import SwiftUI

struct ListRow: View {
    //MARK: - Variables
    let id: Int
    let type: String
    
    init(id: Int, type: String) {
        self.id = id
        self.type = type
    }
    
    //MARK: - Views
    var body: some View {
        Text("\(type) \(id)")
            .padding()
    }
}

#Preview {
    ListRow(id: 1, type: "Type")
}
