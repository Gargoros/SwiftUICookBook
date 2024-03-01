//
//  DetailsAboutTextView.swift
//  SwiftUICookBook
//
//  Created by MIKHAIL ZHACHKO on 29.02.24.
//

import SwiftUI

struct DetailsAboutTextView: View {
    var body: some View {
        
        Text("Very long text that should not be displayed in a single line because it is not good design")
            .padding()
    }
}

#Preview {
    DetailsAboutTextView()
}
