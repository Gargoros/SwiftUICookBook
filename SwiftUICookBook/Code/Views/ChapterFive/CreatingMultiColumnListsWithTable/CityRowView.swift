//
//  CityRowView.swift
//  SwiftUICookBook
//
//  Created by MIKHAIL ZHACHKO on 4.03.24.
//

import SwiftUI

struct CityRowView: View {
    //MARK: - Variables
    let city: CityInfo
    
    //MARK: - Views
    var body: some View {
        VStack(alignment: .leading) {
            LabeledContent {
                Text(city.state)
            } label: {
                Text(city.name)
                    .font(.title)
            }
            LabeledContent("Population"){
                Text(city.formattedPopulation)
                    .font(.body.monospacedDigit())
            }
            LabeledContent("Area") {
                Text(city.formattedArea)
                    .font(.body.monospacedDigit())
            }
            
        }
    }
}

#Preview {
    CityRowView(city: .top20USCities.first!)
        .padding()
}
