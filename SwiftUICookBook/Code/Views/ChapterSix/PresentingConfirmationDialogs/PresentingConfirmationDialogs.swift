//
//  PresentingConfirmationDialogs.swift
//  SwiftUICookBook
//
//  Created by MIKHAIL ZHACHKO on 4.03.24.
//

import SwiftUI

struct PresentingConfirmationDialogs: View {
    //MARK: - Variables
    @State private var showDialog = false
    private var title  = "Confirmation Dialog"
    
    //MARK: - Views
    var body: some View {
        Button("Present Confirmation Dialog") {
            showDialog = true
        }
        .confirmationDialog(title, isPresented: $showDialog) {
            Button("Save") {
                print("Save action")
            }
            Button("Print") {
                print("Print action")
            }
            Button("Update", role: .destructive) {
                print("Update action")
            }
        } message: {
            Text("Use Confirmation Dialogs to present several actions")
        }
    }
}

#Preview {
    PresentingConfirmationDialogs()
}
