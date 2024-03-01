//
//  PasteButton.swift
//  SwiftUICookBook
//
//  Created by MIKHAIL ZHACHKO on 29.02.24.
//

import SwiftUI

struct PasteButton: View {
    //MARK: - Variables
    @State var text = String()
    
    //MARK: - Views
    var body: some View {
        
        VStack {
            Text("PasteButton controls how you paste in macOS but is not available in iOS. For more information, check the \"See also\" section of this recipe")
                .padding()
        }
        .navigationTitle("PasteButton")
            
    }
}

#Preview {
    PasteButton()
}
