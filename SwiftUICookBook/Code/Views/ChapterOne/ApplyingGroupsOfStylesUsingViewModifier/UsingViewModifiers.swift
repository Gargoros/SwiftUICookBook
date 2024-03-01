//
//  UsingViewModifiers.swift
//  SwiftUICookBook
//
//  Created by MIKHAIL ZHACHKO on 29.02.24.
//

import SwiftUI

struct UsingViewModifiers: View {
    var body: some View {
        VStack {
            Text("Perfect Text with modifier")
                .modifier(BackgroundStyle(bgColor: .blue))
            
            Text("Perfect text with extension")
                .backgroundStyle(color: .gray)
        }
        
        
    }
}

#Preview {
    UsingViewModifiers()
}
