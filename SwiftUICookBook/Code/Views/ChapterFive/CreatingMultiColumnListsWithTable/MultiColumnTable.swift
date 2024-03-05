//
//  MultiColumnTable.swift
//  SwiftUICookBook
//
//  Created by MIKHAIL ZHACHKO on 4.03.24.
//

import SwiftUI

struct MultiColumnTable: View {
    //MARK: - Variables
    static let populationComparator = KeyPathComparator(\CityInfo.population, order: .reverse)
    @State private var cities: [CityInfo] = CityInfo.top20USCities.sorted(using: populationComparator)
    @State private var sortOrder = [
        populationComparator,
        KeyPathComparator(\CityInfo.state),
        KeyPathComparator(\CityInfo.name),
        KeyPathComparator(\CityInfo.area)
    ]
    
    @State private var selection = Set<CityInfo.ID>()
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    private var isCompact: Bool {
        return horizontalSizeClass == .compact
    }
    
    
    //MARK: - Views
    var body: some View {
        Table(cities, selection: $selection, sortOrder: $sortOrder) {
            TableColumn("Name", value: \.name) {city in
                if isCompact {
                    CityRowView(city: city)
                }
                else{
                    Text(city.name)
                }
            }
            TableColumn("State", value: \.state)
            
            TableColumn("Population", value: \.population){ city in
                Text(city.formattedPopulation)
                    .font(.body.monospacedDigit())
                    .frame(minWidth: 100, alignment: .trailing)
            }
            .width(max: 150)
            TableColumn("Area", value: \.area){ city in
                Text(city.formattedArea)
                    .font(.body.monospacedDigit())
                    .frame(minWidth: 100, alignment: .trailing)
            }
            .width(max: 150)
        }
        .navigationTitle("Top 20 US cities")
        .onChange(of: sortOrder) { _, newOrder in
            cities.sort(using: newOrder)
        }
        .onChange(of: selection) {
            print("Selected = { \(Array(selection).sorted().joined(separator: " | ")) }")
        }
    }
}

#Preview {
    MultiColumnTable()
}
