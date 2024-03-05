//
//  PresentingAlerts.swift
//  SwiftUICookBook
//
//  Created by MIKHAIL ZHACHKO on 4.03.24.
//

import SwiftUI

struct PresentingAlerts: View {
    //MARK: - Variables
    @State private var showSubmitAlert = false
    
    //MARK: - Views
    var body: some View {
        HStack(alignment: .top){
            Spacer()
            VStack{
                Text("iOS 15")
                Spacer()
                
                Button("Show Alert") {
                    showSubmitAlert = true
                }
                .alert("Confirm Actions", isPresented: $showSubmitAlert) {
                    Button("Ok") {}
                } message: {
                    Text("Are you sure you want to proceed?")
                }
                Spacer()
            }
            Spacer()
            Divider()
            Spacer()
            VStack{
                Text("iOS 13 or 14")
                Spacer()
                OldAlerts()
                Spacer()
            }
            Spacer()
        }
    }
}

#Preview {
    PresentingAlerts()
}
