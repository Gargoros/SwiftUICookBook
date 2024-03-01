//
//  ExpandingLists.swift
//  SwiftUICookBook
//
//  Created by MIKHAIL ZHACHKO on 1.03.24.
//

import SwiftUI

struct ExpandingLists: View {
    //MARK: - Variables
    let bagContents = [currencies, tools]
    
    //MARK: - Views
    var body: some View {
        List(bagContents, children: \.content) { row in
            Label(row.name, systemImage: row.icon)
        }
    }
}

#Preview {
    ExpandingLists()
}
