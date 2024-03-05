//
//  NavigationThirdView.swift
//  SwiftUICookBook
//
//  Created by MIKHAIL ZHACHKO on 5.03.24.
//

import SwiftUI

struct NavigationThirdView: View {
    //MARK: - Variables
    @Environment(\.dismiss) private var dismiss
    
    //MARK: - Views
    var body: some View {
        ScrollView {
            Image(systemName: "triangle")
                .font(.system(size: 80))
                .foregroundStyle(.teal)
                .padding(.vertical, 50)
            Text("This is the Third View")
                .foregroundStyle(.primary)
                .padding()
        }
        .padding()
        .navigationTitle("Third")
        .navigationBarBackButtonHidden()
        .toolbar {
            Button("Dismiss") {
                dismiss()
            }
        }
        .toolbarBackground(.quaternary, for: .navigationBar)
    }
}

#Preview {
    NavigationThirdView()
}
