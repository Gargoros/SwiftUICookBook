//
//  NavigationFirstView.swift
//  SwiftUICookBook
//
//  Created by MIKHAIL ZHACHKO on 5.03.24.
//

import SwiftUI

struct NavigationFirstView: View {
    var body: some View {
        VStack {
            Image(systemName: "circle")
                .font(.system(size: 80))
                .foregroundStyle(.cyan)
            Text("This is the First View")
                .foregroundStyle(.primary)
                .padding()
            VStack(spacing: 20) {
                NavigationLink("Show Child A") {
                    ChildAView()
                }
                NavigationLink("Show Child B") {
                    ChildBView()
                }
            }
        }
        .padding()
        .navigationTitle("First")
    }
}

#Preview {
    NavigationFirstView()
}
