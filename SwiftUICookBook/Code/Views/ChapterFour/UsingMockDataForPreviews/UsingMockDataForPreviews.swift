//
//  UsingMockDataForPreviews.swift
//  SwiftUICookBook
//
//  Created by MIKHAIL ZHACHKO on 3.03.24.
//

import SwiftUI

struct UsingMockDataForPreviews: View {
    //MARK: - Variables
    //var insects: [InsectInfo] = []
    
    let insects: [InsectInfo] = {
        guard let url = Bundle.main.url(forResource: "insectData", withExtension: "json"),
              let data = try? Data(contentsOf: url)
        else {
            return []
        }
        let decoder  = JSONDecoder()
        let array = try?decoder.decode([InsectInfo].self, from: data)
        return array ??  []
    }()
    
    //MARK: - Views
    var body: some View {
        List{
            ForEach(insects) {insect in
                Image(insect.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Rectangle())
                    .frame(width: 100, height: 100)
                VStack(alignment: .leading){
                    Text(insect.name).font(.title)
                    Text(insect.habitat)
                }
                .navigationTitle("Insects")
            }
        }
    }
}

#Preview {
//    let testInsect = InsectInfo(id: 1, imageName: "grasshopper", name: "grass", habitat: "rocks", description: "none")
//    let testInsects: [InsectInfo] = {
//        guard let url = Bundle.main.url(forResource: "insectData", withExtension: "json"),
//              let data = try? Data(contentsOf: url)
//        else {
//            return []
//        }
//        let decoder  = JSONDecoder()
//        let array = try?decoder.decode([InsectInfo].self, from: data)
//        return array ??  [testInsect]
//    }()
    return UsingMockDataForPreviews(/*insects: testInsects*/)
}
