//
//  OldAlerts.swift
//  SwiftUICookBook
//
//  Created by MIKHAIL ZHACHKO on 4.03.24.
//

import SwiftUI

struct OldAlerts: View {
    //MARK: - Variables
    @State private var showSubmitAlert = false
    
    //MARK: - Views
    var body: some View {
        Button (action: {
            self.showSubmitAlert = true
        }) {
            Text("Submit")
                .padding()
                .background(Color.blue)
                .foregroundStyle(Color.white)
                .clipShape(Capsule())
        }
        .alert(isPresented: $showSubmitAlert)  {
            Alert(
                title: Text("Confirm Action"),
                message: Text("Are you sure you want to submit the form"),
                dismissButton: .default(Text("Ok")))
        }
    }
}

#Preview {
    OldAlerts()
}
