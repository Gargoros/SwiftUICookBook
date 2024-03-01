//
//  RunLabelView.swift
//  SwiftUICookBook
//
//  Created by MIKHAIL ZHACHKO on 1.03.24.
//

import SwiftUI

struct RunLabelView: View {
    var body: some View {
        HStack{
            Image(systemName: "play")
            Text("Run View")
        }
        .foregroundStyle(.white)
        .padding()
        .background(.red)
        .cornerRadius(10, corners: .allCorners)
    }
}

#Preview {
    RunLabelView()
}
