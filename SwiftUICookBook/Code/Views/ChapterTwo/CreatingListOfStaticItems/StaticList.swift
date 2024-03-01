//
//  StaticList.swift
//  SwiftUICookBook
//
//  Created by MIKHAIL ZHACHKO on 29.02.24.
//

import SwiftUI

struct StaticList: View {
    //MARK: - Variables
    let weatherData = WeatherInfo.weatherData
    
    //MARK: - Views
    var body: some View {
        List{
            ForEach(weatherData) {data in
                HStack{
                    Image(systemName: data.image)
                        .frame(width: 50, alignment: .leading)
                    Text("\(data.temp)°F")
                        .frame(width: 80, alignment: .leading)
                    Text(data.city)
                }
                .font(.system(size: 25))
                .padding()
            }
        }
    }
}

#Preview {
    StaticList()
}
