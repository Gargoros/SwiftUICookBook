//
//  ChildBView.swift
//  SwiftUICookBook
//
//  Created by MIKHAIL ZHACHKO on 5.03.24.
//

import SwiftUI

struct ChildBView: View {
    var body: some View {
        VStack {
            Image(systemName: "b.square")
                .font(.system(size: 80))
                .foregroundStyle(.brown)
            Text("This is the Child B View")
                .foregroundStyle(.primary)
            .padding()
        }
        .navigationTitle("Child B")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        ChildBView()
    }
}
