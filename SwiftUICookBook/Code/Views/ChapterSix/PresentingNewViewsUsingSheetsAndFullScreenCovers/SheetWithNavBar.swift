//
//  SheetWithNavBar.swift
//  SwiftUICookBook
//
//  Created by MIKHAIL ZHACHKO on 4.03.24.
//

import SwiftUI

struct SheetWithNavBar: View {
    //MARK: - Variables
    @Environment(\.dismiss) private var dismiss
    var text: String = "Sheet with navigation bar"
    
    //MARK: - Views
    var body: some View {
        NavigationStack{
            ZStack {
                Color(uiColor: UIColor(white: 0.9, alpha: 1.0))
                    .ignoresSafeArea()
                Text(text)
            }
            .navigationTitle(Text("Sheet title"))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button("Dismiss") {
                    dismiss()
                }
            }
            .toolbarBackground(.gray, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            
        }
        .tint(.white)
    }
}

#Preview {
    SheetWithNavBar()
}
