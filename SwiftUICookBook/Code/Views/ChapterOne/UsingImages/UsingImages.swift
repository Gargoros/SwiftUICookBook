//
//  UsingImages.swift
//  SwiftUICookBook
//
//  Created by MIKHAIL ZHACHKO on 29.02.24.
//

import SwiftUI

struct UsingImages: View {
    var body: some View {
        ScrollView {
            VStack{
                Image("dogs1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Image("dog-and-nature")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:300, height:200)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.blue, lineWidth: 6))
                    .shadow(radius: 10)
                
                Image(uiImage: UIImage(resource: .dog2))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
            }
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    UsingImages()
}
