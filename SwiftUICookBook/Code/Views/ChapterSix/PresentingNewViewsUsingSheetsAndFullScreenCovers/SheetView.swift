//
//  SheetView.swift
//  SwiftUICookBook
//
//  Created by MIKHAIL ZHACHKO on 4.03.24.
//

import SwiftUI

struct SheetView: View {
    //MARK: - Variables
    
    //MARK: - Views
    var body: some View {
        ZStack {
            Color.cyan
                .ignoresSafeArea()
            Text("This is the sheet we want to display")
        }
    }
}

#Preview {
    SheetView()
}
