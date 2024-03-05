//
//  FocusAndSubmit.swift
//  SwiftUICookBook
//
//  Created by MIKHAIL ZHACHKO on 4.03.24.
//

import SwiftUI

struct FocusAndSubmit: View {
    //MARK: - Variables
    @State private var streetName = ""
    @State private var city = ""
    @State private var state = ""
    @State private var zipCode = ""
    
    @FocusState private var currentFocus: AddressField?
    
    //MARK: - Views
    var body: some View {
        VStack{
            
            TextField("Address", text: $streetName)
                .focused($currentFocus, equals: .streetName)
                .submitLabel(.next)
                .modifier(TextFieldModifier())
            
            
            TextField("City", text: $city)
                .focused($currentFocus, equals: .city)
                .submitLabel(.next)
                .modifier(TextFieldModifier())
            
            TextField("State", text: $state)
                .focused($currentFocus, equals: .state)
                .submitLabel(.next)
                .modifier(TextFieldModifier())
            
            TextField("Zip Code", text: $zipCode)
                .focused($currentFocus, equals: .zipCode)
                .submitLabel(.done)
                .modifier(TextFieldModifier())
        }
        .padding()
        .onSubmit {
            switch currentFocus {
            case .streetName:
                currentFocus = .city
            case .city:
                currentFocus = .state
            case .state:
                currentFocus = .zipCode
            default:
                print("Thanks for providing your address")
            }
        }
    }
}

#Preview {
    FocusAndSubmit()
}
