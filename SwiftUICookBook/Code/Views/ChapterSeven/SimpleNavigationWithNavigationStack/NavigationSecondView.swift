//
//  NavigationSecondView.swift
//  SwiftUICookBook
//
//  Created by MIKHAIL ZHACHKO on 5.03.24.
//

import SwiftUI

struct NavigationSecondView: View {
    var body: some View {
        VStack {
            Image(systemName: "square")
                .font(.system(size: 80))
                .foregroundStyle(.blue)
            Text("This is the Second View")
                .foregroundStyle(.primary)
                .padding()
            List {
                NavigationLink("Show Child A") {
                    ChildAView()
                }
                NavigationLink("Show Child B") {
                    ChildBView()
                }
            }
            .listStyle(.inset)
            .frame(height: 160)
        }
        .padding()
        .navigationTitle("Second")
    }
}

#Preview {
    NavigationSecondView()
}
