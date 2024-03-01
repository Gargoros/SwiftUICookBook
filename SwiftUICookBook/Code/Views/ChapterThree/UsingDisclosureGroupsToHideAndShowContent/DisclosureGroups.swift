//
//  DisclosureGroups.swift
//  SwiftUICookBook
//
//  Created by MIKHAIL ZHACHKO on 1.03.24.
//

import SwiftUI

struct DisclosureGroups: View {
    //MARK: - Variables
    @State private var showPlanets = true
    
    //MARK: - Views
    var body: some View {
        VStack{
            DisclosureGroup(isExpanded: $showPlanets){
                Text("Mercury")
                Text("Venus")
                
                DisclosureGroup("Earth"){
                    Text("North America")
                    Text("South America")
                    Text("Europe")
                    Text("Africa")
                    Text("Asia")
                    Text("Antarctica")
                    Text("Oceania")
                }
            } label: {
                Text("Planets")
            }
            
            DisclosureGroup(
                content: { Text("Surprise! This is an alternative way of using DisclosureGroup") },
                label: {
                    Label("Tap to reveal", systemImage: "cube.box")
                        .font(.system(size: 25, design: .rounded))
                        .foregroundStyle(.blue)
                }
            )
        }
        .padding()
    }
}

#Preview {
    DisclosureGroups()
}
