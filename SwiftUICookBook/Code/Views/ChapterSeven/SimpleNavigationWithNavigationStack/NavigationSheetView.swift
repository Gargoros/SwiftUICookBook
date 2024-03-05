//
//  NavigationSheetView.swift
//  SwiftUICookBook
//
//  Created by MIKHAIL ZHACHKO on 5.03.24.
//

import SwiftUI

struct NavigationSheetView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color(uiColor: UIColor(red: 0, green: 0.9, blue: 1, alpha: 1))
                    .ignoresSafeArea()
                
                Text("Sheet with navigation bar")
            }
            .navigationTitle("Sheet title")
            .navigationBarTitleDisplayMode(.large)
            .toolbarBackground(.teal, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
}

#Preview {
    NavigationSheetView()
}
