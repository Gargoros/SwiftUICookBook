//
//  PostView.swift
//  SwiftUICookBook
//
//  Created by MIKHAIL ZHACHKO on 3.03.24.
//

import SwiftUI

struct PostView: View {
    //MARK: - Variables
    var title: String
    var text: String
    var imageName: String
    
    //MARK: - Views
    var body: some View {
        GeometryReader { geometry in
            ScrollView{
                // View for portrait orientation
                if geometry.size.height > geometry.size.width {
                    VStack{
                        Image(systemName: imageName)
                            .symbolRenderingMode(.multicolor)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geometry.size.width * 0.75)
                        VStack (alignment: .leading){
                            Text(text)
                                .font(.title2)
                                .padding(.top)
                            Text(text)
                                .padding(.top)
                        }
                        
                    }
                    .padding()
                }
                else {
                    HStack (alignment: .top, spacing: 20) {
                        Image(systemName: imageName)
                            .symbolRenderingMode(.multicolor)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: geometry.size.height * 0.55)
                        VStack (alignment: .leading){
                            Text(text)
                                .font(.title2)
                                .padding(.top)
                            Text(text)
                                .padding(.top)
                        }
                    }
                    .padding()
                }
            }
        }
    }
}

#Preview {
    PostView(
        title: "Weather forecast",
        text: "Scattered thunderstorms. Potential for heavy rainfall. Low 68F. Winds light and variable. Chance of rain 60%",
        imageName: "cloud.bolt.rain")
}
