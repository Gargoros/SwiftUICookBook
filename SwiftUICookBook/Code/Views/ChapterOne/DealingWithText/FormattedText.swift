//
//  FormattedText.swift
//  SwiftUICookBook
//
//  Created by MIKHAIL ZHACHKO on 29.02.24.
//

import SwiftUI

struct FormattedText: View {
    //MARK: - Variables
    @State private var password = "1234"
    @State private var someText = "initial text"
    
    //MARK: - Views
    var body: some View {
        
        ScrollView {
            VStack {
                
                SecureField("Enter a password", text: $password)
                    .padding()
                    .overlay{
                        Capsule().stroke()
                    }
                    .padding()
                Text("password entered: \(password)")
                    .italic()
                    .fontWeight(.medium)
                TextField("Enter some text", text: $someText)
                    .padding()
                    .overlay{
                        Capsule().stroke()
                    }
                    .padding()
                Text(someText)
                   .font(.largeTitle)
                   .underline()
                
                Text("Changing text color and make it bold")
                    .foregroundStyle(.blue)
                    .fontWeight(.bold)
                Text("Use kerning to change space between characters in the text")
                    .kerning(7)
                Text("Changing baseline offset")
                    .baselineOffset(100)
                Text("Strikethrough")
                    .strikethrough()
                Text("This is a multiline text implemented in SwiftUI. The trailing modifier was added to the text. This text also implements multiple modifiers")
                    .background(.yellow)
                    .multilineTextAlignment(.trailing)
                    .lineSpacing(10.0)
            }
        }
        
    }
}

#Preview {
    FormattedText()
}
