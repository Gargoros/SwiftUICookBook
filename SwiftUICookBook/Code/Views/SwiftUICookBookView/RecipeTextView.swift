//
//  RecipeTextView.swift
//  SwiftUICookBook
//
//  Created by MIKHAIL ZHACHKO on 28.02.24.
//

import SwiftUI

struct RecipeTextView: View {
    //MARK: - Variables
    let howItWorksText: String
    //MARK: - Views
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20){
                
                Text(StringConstants.howItWorks)
                    .modifier(TitleBookModifier())
                
                Text(howItWorksText)
                    .modifier(TextBookModifier())
            }
            .padding()
        }
    }
}

#Preview {
    RecipeTextView(howItWorksText: "sdaasdadsasdasdasdasda")
}
