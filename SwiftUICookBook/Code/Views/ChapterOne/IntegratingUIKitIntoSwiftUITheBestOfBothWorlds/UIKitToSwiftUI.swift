//
//  UIKitToSwiftUI.swift
//  SwiftUICookBook
//
//  Created by MIKHAIL ZHACHKO on 29.02.24.
//

import SwiftUI

struct UIKitToSwiftUI: View {
    //MARK: - Variables
    @State private var animation: Bool = true
    
    //MARK: - Views
    var body: some View {
        VStack{
            ActivityIndicator(animation: animation)
            HStack{
                Toggle("Toggle Activity", isOn: $animation)
            }
            .padding()
        }
    }
}

#Preview {
    UIKitToSwiftUI()
}
