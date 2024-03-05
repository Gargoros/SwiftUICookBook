//
//  AlertsWithActions.swift
//  SwiftUICookBook
//
//  Created by MIKHAIL ZHACHKO on 4.03.24.
//

import SwiftUI

struct AlertsWithActions: View {
    //MARK: - Variables
    @State private var changeText = false
    @State private var displayedText = "Tap to Change Text"
    
    //MARK: - Views
    var body: some View {
        Button(displayedText) {
            changeText = true
        }
        .alert("Changing Text", isPresented: $changeText) {
            Button("Yes", role: .destructive){
                displayedText = if(displayedText == "Stay Foolish"){
                    "Stay Hungry"
                }
                else{
                    "Stay Foolish"
                }
            }
            
            Button("Do Nothing", role: .cancel) {}
        } message: {
            Text("Do you want to change the text?")
        }
    }
}

#Preview {
    AlertsWithActions()
}
