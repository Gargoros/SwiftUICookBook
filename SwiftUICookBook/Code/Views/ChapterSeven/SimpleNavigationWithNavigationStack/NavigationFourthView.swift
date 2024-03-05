//
//  NavigationFourthView.swift
//  SwiftUICookBook
//
//  Created by MIKHAIL ZHACHKO on 5.03.24.
//

import SwiftUI

struct NavigationFourthView: View {
    //MARK: - Variables
    @State private var isSheetPresented = false
    
    //MARK: - Views
    var body: some View {
        ScrollView {
                    Image(systemName: "capsule")
                        .font(.system(size: 80))
                        .foregroundStyle(.red)
                        .padding(.vertical, 50)
                    Text("This is the Fourth View")
                        .foregroundStyle(.primary)
                        .padding()
                    Button("Show sheet") {
                        isSheetPresented = true
                    }.sheet(isPresented: $isSheetPresented) {
                        NavigationSheetView()
                            .presentationDetents([.fraction(0.75)])
                            .presentationDragIndicator(.visible)
                    }
                }
                .navigationTitle("Fourth")
                .toolbarBackground(.quaternary, for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
    }
}

#Preview {
    NavigationFourthView()
}
