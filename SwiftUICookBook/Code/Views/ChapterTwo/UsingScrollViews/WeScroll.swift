//
//  WeScroll.swift
//  SwiftUICookBook
//
//  Created by MIKHAIL ZHACHKO on 29.02.24.
//

import SwiftUI

struct WeScroll: View {
    //MARK: - Variables
    let letters: [String] = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p"]
    @State private var flashIndicators: Bool = false
    
    //MARK: - Views
    var body: some View {
        VStack {
            ScrollView{
                ForEach(letters, id: \.self) {letter in
                    Image(systemName: letter)
                        .font(.largeTitle)
                        .foregroundStyle(.yellow)
                        .frame(width: 50, height: 50)
                        .background(.blue)
                        .symbolVariant(.circle.fill)
                }
            }
            .frame(width: 50, height: 200)
            ScrollView(.horizontal){
                HStack{
                    ForEach(letters, id: \.self){letter in
                        Image(systemName: letter)
                            .font(.largeTitle)
                            .foregroundStyle(.yellow)
                            .frame(width: 50, height: 50)
                            .background(.blue)
                            .symbolVariant(.circle.fill)
                    }
                }
            }
            .scrollIndicatorsFlash(trigger: flashIndicators)
            .padding()
            Button("Flash") {
                flashIndicators.toggle()
            }
            .padding()
            
        }
        .scrollIndicators(.hidden, axes: .vertical)
    }
}

#Preview {
    WeScroll()
}
