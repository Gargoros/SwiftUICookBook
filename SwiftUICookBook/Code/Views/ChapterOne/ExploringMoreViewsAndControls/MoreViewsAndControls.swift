//
//  MoreViewsAndControls.swift
//  SwiftUICookBook
//
//  Created by MIKHAIL ZHACHKO on 29.02.24.
//

import SwiftUI

struct MoreViewsAndControls: View {
    //MARK: - Variables
    @State private var progress = 0.5
    @State private var color  = Color.red
    @State private var secondColor  = Color.yellow
    @State private var someText = "Initial value"
    
    //MARK: - Views
    var body: some View {
        List {
            Section("ProgressViews") {
                ProgressView("Indeterminate progress view")
                ProgressView("Downloading", value: progress, total: 2)
                
                Button("More") {
                    if(progress < 2){
                        progress += 0.5
                    }
                }
            }
            
            Section {
                Label("Slow ", systemImage: "tortoise.fill")
                Label(
                    title: {
                        Text("Fast")
                    },
                    icon: {
                        Circle()
                            .fill(.orange)
                            .frame(width: 40, height: 40, alignment: .center)
                            .overlay {
                                Text("F")
                            }
                        
                    }
                )
            } header: {
                Text("Labels")
            }
            
            Section {
                ColorPicker(selection: $color){
                    Text("Pick my background")
                        .padding()
                        .background(color)
                }
                ColorPicker("Picker", selection: $secondColor)
            } header: {
                Text("ColorPicker")
            }
            
            Section(header: Text("Link")) {
                Link("Packt Publishing", destination: URL(string:"https://www.packtpub.com/")!)}
            
            Section {
                TextEditor(text: $someText)
                
                Text("current editor text:\n\(someText)")
            } header: {
                Text("Text Editor")
            }
            
            Section {
                Menu("Actions") {
                    Button("Set TextEditor text to 'magic'") {
                        someText = "magic"
                    }
                    Button("Turn first picker green") {
                        color = .green
                    }
                    Menu("Actions") {
                        Button("Set TextEditor text to 'real magic'") {
                            someText = "real magic"
                        }
                        Button("Turn first picker gray") {
                            color = .gray
                        }
                    }
                }
            } header: {
                Text("Menu")
            }

        }
        .listStyle(.grouped)
    }
}

#Preview {
    MoreViewsAndControls()
}
