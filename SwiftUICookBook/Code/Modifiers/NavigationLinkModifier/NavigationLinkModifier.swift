//
//  NavigationLinkModifier.swift
//  SwiftUICookBook
//
//  Created by MIKHAIL ZHACHKO on 27.02.24.
//

import SwiftUI

//MARK: - Modifier for navigation link
struct NavigationLinkModifier: ViewModifier{
    
    func body(content: Content) -> some View {
        content
            .padding()
            .background(.gray.gradient)
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

