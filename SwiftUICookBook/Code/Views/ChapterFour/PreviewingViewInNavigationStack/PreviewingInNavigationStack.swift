//
//  PreviewingInNavigationStack.swift
//  SwiftUICookBook
//
//  Created by MIKHAIL ZHACHKO on 3.03.24.
//

import SwiftUI

struct PreviewingInNavigationStack: View {
    var body: some View {
        NavigationLink {
            SecondView(someText: "Text passed from ContentView")
        } label: {
            Text("Go to second view")
                .foregroundStyle(.white)
                .padding()
                .background(.black)
                .cornerRadius(25, corners: .allCorners)
        }
        .navigationTitle("Previews")
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

#Preview {
    PreviewingInNavigationStack()
}
