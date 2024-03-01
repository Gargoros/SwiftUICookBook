//
//  ScrollViewReaders.swift
//  SwiftUICookBook
//
//  Created by MIKHAIL ZHACHKO on 1.03.24.
//

import SwiftUI

struct ScrollViewReaders: View {
    //MARK: - Variables
    @State private var scrolledID: CharacterInfo.ID?
    
    //MARK: - Views
    var body: some View {
        HStack{
            VStack{
                Text("iOS 17")
                    .modifier(TitleBookModifier())
                
                ScrollView{
                    // scrolling content will go here
                    Button("Go to letter Q") {
                        withAnimation(){
                            scrolledID = 16
                        }
                    }
                    .padding()
                    .background(.blue)
                    .tint(.black)
                    
                    LazyVStack{
                        ForEach(CharacterInfo.charArray) { image in
                            Image(systemName: image.name)
                                .font(.largeTitle)
                                .foregroundStyle(.blue)
                                .frame(width: 90, height: 90)
                                .background(.yellow)
                                .padding()
                        }
                    }
                    
                    Button("Go to letter G") {
                        withAnimation(){
                            scrolledID = 6
                        }
                    }
                    .padding()
                    .background(.blue)
                    .tint(.black)
                    
                }
                .scrollIndicators(.hidden)
                .scrollPosition(id: $scrolledID)
            }
            Divider()
                .frame(width: 2)
                .overlay(.red)
                .padding()
            VStack{
                Text("iOS 14+")
                    .modifier(TitleBookModifier())
                
                ScrollView{
                    // legacy code will go here
                    ScrollViewReader(content: { proxy in
                        Button("Go to letter Q") {
                            withAnimation(){
                                proxy.scrollTo(16)
                            }
                        }
                        .padding()
                        .background(.yellow)
                        .tint(.black)
                        
                        ForEach(CharacterInfo.charArray) { image in
                            Image(systemName: image.name)
                                .font(.largeTitle)
                                .foregroundStyle(.yellow)
                                .frame(width: 90, height: 90)
                                .background(.blue)
                                .padding()
                        }
                        
                        Button("Go to letter G") {
                            withAnimation(){
                                proxy.scrollTo(6)
                            }
                        }
                        .padding()
                        .background(.yellow)
                        .tint(.black)
                    })
                }
                .scrollIndicators(.hidden)
            }
        }
        .padding()
    }
}

#Preview {
    ScrollViewReaders()
}
