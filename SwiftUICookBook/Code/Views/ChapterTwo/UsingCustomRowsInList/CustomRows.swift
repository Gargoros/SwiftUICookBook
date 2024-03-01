//
//  CustomRows.swift
//  SwiftUICookBook
//
//  Created by MIKHAIL ZHACHKO on 29.02.24.
//

import SwiftUI

struct CustomRows: View {
    //MARK: - Variables
    var weatherData: [WeatherInfo]
    
    //MARK: - Views
    var body: some View {
        List{
            ForEach(weatherData){data in
                WeatherRow(weatherInfo: data)
            }
        }
    }
}

#Preview {
    CustomRows(weatherData: WeatherInfo.weatherDataEx)
}
