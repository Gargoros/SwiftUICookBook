//
//  TextModifier.swift
//  SwiftUICookBook
//
//  Created by MIKHAIL ZHACHKO on 28.02.24.
//

import SwiftUI

struct TitleBookModifier: ViewModifier{
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: 24))
            .fontWeight(.bold)
    }
}

struct TextBookModifier: ViewModifier{
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: 16))
            .multilineTextAlignment(.leading)
    }
}

struct TextFieldModifier: ViewModifier{
    
    func body(content: Content) -> some View {
        content
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .font(.title2)
            .tint(.black)
    }
}
