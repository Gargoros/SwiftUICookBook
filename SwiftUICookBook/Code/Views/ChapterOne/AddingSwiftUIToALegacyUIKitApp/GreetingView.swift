//
//  GreetingView.swift
//  SwiftUICookBook
//
//  Created by MIKHAIL ZHACHKO on 29.02.24.
//

import SwiftUI

struct GreetingView: View {
    var textFromUIKit: String
        var body: some View {
            Text(textFromUIKit)
        }
}

#Preview {
    GreetingView(textFromUIKit: "Hello, World!")
}
