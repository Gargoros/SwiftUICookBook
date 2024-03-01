//
//  WeatherRow.swift
//  SwiftUICookBook
//
//  Created by MIKHAIL ZHACHKO on 29.02.24.
//

import SwiftUI

struct WeatherRow: View {
    //MARK: - Variables
    var weatherInfo: WeatherInfo
    
    //MARK: - Views
    var body: some View {
        HStack{
            Image(systemName: weatherInfo.image)
                .frame(width: 50, alignment: .leading)
            Text("\(weatherInfo.temp)°F")
                .frame(width: 80, alignment: .leading)
            Text(weatherInfo.city)
            
        }
        .font(.system(size: 25))
        .padding()
    }
}

#Preview {
    WeatherRow(weatherInfo: WeatherInfo(image: "snow", temp: 12, city: "Minsk"))
}
