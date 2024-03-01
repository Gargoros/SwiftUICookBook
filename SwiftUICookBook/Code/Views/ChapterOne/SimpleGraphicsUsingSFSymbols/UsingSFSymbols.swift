//
//  UsingSFSymbols.swift
//  SwiftUICookBook
//
//  Created by MIKHAIL ZHACHKO on 29.02.24.
//

import SwiftUI

struct UsingSFSymbols: View {
    //MARK: - Variables
    @State var wifiSelection: Int = 0
    
    //MARK: - Views
    var body: some View {
        VStack {
            HStack{
                Image(systemName: "c")
                Image(systemName: "o")
                Image(systemName: "o")
                Image(systemName: "k")
            }
            .symbolVariant(.fill.circle)
            .foregroundStyle(.yellow, .blue)
            .font(.title)
            
            HStack{
                Image(systemName: "b.circle.fill")
                Image(systemName: "o.circle.fill")
                    .foregroundStyle(.red)
                Image(systemName: "o.circle.fill")
                    .imageScale(.large)
                Image(systemName: "o.circle.fill")
                    .accessibility(identifier: "Letter K")
            }
            .foregroundStyle(.blue)
            .font(.title)
            .padding()
            
            HStack{
                Image(systemName: "allergens")
                Image(systemName: "ladybug")
            }
            .font(.largeTitle)
            .symbolVariant(.fill)
            .symbolRenderingMode(.multicolor)
            
            HStack{
                Picker("Pick One", selection: $wifiSelection){
                    Text("No Wifi").tag(0)
                    Text("Searching").tag(1)
                    Text("Wifi On").tag(2)
                }
                .pickerStyle(.segmented)
                .frame(width: 240)
                .padding(.horizontal)
                
                Group{
                    switch wifiSelection{
                    case 0:
                         Image(systemName: "wifi")
                            .symbolVariant(.slash)
                    case 1:
                        Image(systemName: "wifi")
                            .symbolEffect(.variableColor.iterative.reversing)
                    default:
                        Image(systemName: "wifi")
                            .foregroundStyle(.blue)
                    }
                }
                .foregroundStyle(.secondary)
                .font(.title)
            }
        }
        .padding()
    }
}

#Preview {
    UsingSFSymbols()
}
