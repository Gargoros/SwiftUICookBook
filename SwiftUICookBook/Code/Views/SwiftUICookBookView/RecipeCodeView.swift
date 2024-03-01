//
//  RecipeCodeView.swift
//  SwiftUICookBook
//
//  Created by MIKHAIL ZHACHKO on 28.02.24.
//

import SwiftUI

struct RecipeCodeView: View {
    //MARK: - Variables
    let codeText: String
    //MARK: - Views
    var body: some View {
        ScrollView {
            HStack {
                Text(codeText)
                    .font(.system(size: 16))
                Spacer()
            }
            .padding()
            .overlay{
                RoundedRectangle(cornerRadius: 20)
                    .stroke(lineWidth: 1)
                
                    
            }
            .padding()
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    RecipeCodeView(codeText: ChapterOneConstant.theStacksCode)
}
