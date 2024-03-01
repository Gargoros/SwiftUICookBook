//
//  LazyStacks.swift
//  SwiftUICookBook
//
//  Created by MIKHAIL ZHACHKO on 1.03.24.
//

import SwiftUI

struct MyLazyStacksView: View {
    //MARK: - Variables
    
    //MARK: - Views
    var body: some View {
        VStack{
            ScrollView(.horizontal){
                LazyHStack{
                    ForEach(0...10000, id: \.self){ item in
                        ListRow(id: item, type: "Horizontal")
                    }
                }
            }
            .frame(height: 100, alignment: .center)
            ScrollView(.vertical){
                LazyVStack{
                    ForEach(0...10000, id: \.self){ item in
                        ListRow(id: item, type: "Vertical")
                    }
                }
            }
        }
    }
}

#Preview {
    MyLazyStacksView()
}
