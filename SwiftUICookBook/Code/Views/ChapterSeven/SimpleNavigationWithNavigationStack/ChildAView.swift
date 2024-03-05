//
//  ChildAView.swift
//  SwiftUICookBook
//
//  Created by MIKHAIL ZHACHKO on 5.03.24.
//

import SwiftUI

struct ChildAView: View {
    //MARK: - Variables
    @State private var title = "Child A"
    
    //MARK: - Views
    var body: some View {
        VStack {
            
            Image(systemName: "a.square")
                .font(.system(size: 80))
                .foregroundStyle(.yellow)
            
            Text("This is the Child A View")
                .foregroundStyle(.primary)
                .padding()
            
            
        }
        .navigationTitle($title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        ChildAView()
    }
}
