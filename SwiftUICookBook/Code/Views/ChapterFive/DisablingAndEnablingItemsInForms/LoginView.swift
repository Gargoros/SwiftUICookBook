//
//  LoginView.swift
//  SwiftUICookBook
//
//  Created by MIKHAIL ZHACHKO on 4.03.24.
//

import SwiftUI

struct LoginView: View {
    //MARK: - Variables
    @State private var username: String = ""
    @State private var password: String = ""
    
    //MARK: - Views
    var body: some View {
        VStack {
            Text("Dungeons and Wagons")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.blue)
                .padding(.bottom, 30)
            
            Image(systemName: "person.circle")
                .font(.system(size: 150))
                .foregroundStyle(.gray)
                .padding(.bottom, 40)
            
            Group{
                TextField("User Name", text: $username)
                SecureField("Password", text: $password)
            }
            .padding()
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black, lineWidth: 2)
            }
            
            Button(action: {
                print("Login tapped")
            }, label: {
                Text("Login")
            })
            .padding()
            .background(
                (username.isEmpty || password.isEmpty) ? .gray : .blue
            )
            .foregroundStyle(.white)
            .clipShape(Capsule())
            .disabled(username.isEmpty || password.isEmpty)
        }
        .padding()
    }
}

#Preview {
    LoginView()
}
