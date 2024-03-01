//
//  UsingViewBuilder.swift
//  SwiftUICookBook
//
//  Created by MIKHAIL ZHACHKO on 29.02.24.
//

import SwiftUI

struct UsingViewBuilder: View {
    var body: some View {
        VStack{
            BlueCircle{
                Text("some text here")
                Rectangle()
                    .fill(.red)
                    .frame(width: 40, height: 40)
            }
            BlueCircle {
                Text("Another example")
            }
        }
    }
}

#Preview {
    UsingViewBuilder()
}
