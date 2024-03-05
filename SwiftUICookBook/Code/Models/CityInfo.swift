//
//  CityInfo.swift
//  SwiftUICookBook
//
//  Created by MIKHAIL ZHACHKO on 4.03.24.
//

import Foundation

struct CityInfo: Identifiable {
    
    var name: String
    var state: String
    var population: Int
    var area: Measurement<UnitArea>
    
    var id: String{ "\(name), \(state)" }
    
    var formattedArea: String {
        let formatter = MeasurementFormatter()
        formatter.numberFormatter.minimumFractionDigits = 1
        return formatter.string(from: area)
    }
    
    var formattedPopulation: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.usesGroupingSeparator = true
        formatter.maximumFractionDigits = 0
        return formatter.string(from: NSNumber(integerLiteral: population)) ?? "n/a"
    }
}
