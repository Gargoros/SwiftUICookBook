//
//  DisplayingPopovers.swift
//  SwiftUICookBook
//
//  Created by MIKHAIL ZHACHKO on 4.03.24.
//

import SwiftUI

struct DisplayingPopovers: View {
    //MARK: - Variables
    @State private var showPopover = false
    
    //MARK: - Views
    var body: some View {
        Button("Show popover"){
            showPopover = true
        }
        .font(.system(size: 40))
        .popover(isPresented: $showPopover) {
            Text("Popover content displayed here")
                .font(.system(size: 20))
                .padding()
        }
    }
}

#Preview {
    DisplayingPopovers()
}
