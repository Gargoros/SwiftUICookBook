//
//  SecondView.swift
//  SwiftUICookBook
//
//  Created by MIKHAIL ZHACHKO on 3.03.24.
//

import SwiftUI

struct SecondView: View {
    //MARK: - Variables
    var someText: String
    
    //MARK: - Views
    var body: some View {
        Text(someText)
                    .navigationTitle("Second View")
                    .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    SecondView(someText: "This is the second view")
}
