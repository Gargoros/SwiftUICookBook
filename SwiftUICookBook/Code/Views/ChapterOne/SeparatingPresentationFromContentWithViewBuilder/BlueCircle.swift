//
//  BlueCircle.swift
//  SwiftUICookBook
//
//  Created by MIKHAIL ZHACHKO on 29.02.24.
//

import SwiftUI

struct BlueCircle<Content: View>: View {
    
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
            self.content = content()
        }
    
    var body: some View {
        HStack{
            content
            Spacer()
            Circle()
                .fill(.blue)
                .frame(width: 20, height: 20)
        }
        .padding()
        
    }
}

