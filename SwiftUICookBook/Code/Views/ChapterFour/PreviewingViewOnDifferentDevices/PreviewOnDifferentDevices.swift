//
//  PreviewOnDifferentDevices.swift
//  SwiftUICookBook
//
//  Created by MIKHAIL ZHACHKO on 3.03.24.
//

import SwiftUI

struct PreviewOnDifferentDevices: View {
    var body: some View {
        VStack {
            Image(.friendship)
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text("Importance of Friendship")
                .font(.title)
            Text("Friends helps us deal with stress and make better life choices")
                .multilineTextAlignment(.center)
                .padding()
        }
    }
}

#Preview {
    PreviewOnDifferentDevices()
}
