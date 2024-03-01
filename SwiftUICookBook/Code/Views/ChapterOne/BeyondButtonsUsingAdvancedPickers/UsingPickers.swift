//
//  UsingPickers.swift
//  SwiftUICookBook
//
//  Created by MIKHAIL ZHACHKO on 29.02.24.
//

import SwiftUI

struct UsingPickers: View {
    //MARK: - Variables
    @State private var choice = 0
    @State private var showText = false
    @State private var transitModes = ["Bike", "Car", "Bus"]
    @State private var sliderVal: Float = 0
    @State private var stepVal = 0
    @State private var gameTime = Date()
    
    //MARK: - Views
    var body: some View {
        Form{
            
            //MARK: - Picker
            Section{
                Picker("Transit Modes", selection: $choice){
                    ForEach(0..<transitModes.count, id: \.self){ index in
                        Text(transitModes[index])
                    }
                }
                .pickerStyle(.segmented)
                Text("Current choice: \(transitModes[choice])")
            }
            
            //MARK: - Toggle
            Section{
                Toggle(
                    isOn: $showText,
                    label: {
                        Text("Show Text")
                    })
                if showText {
                    Text("The Text toggle is on")
                }
            }
            
            //MARK: - Slider
            Section{
                Slider(value: $sliderVal, in: 0...10, step: 0.001)
                Text("Slider current value \(sliderVal, specifier: "%.1f")")
            }
            
            //MARK: - Stepper
            Section{
                Stepper("Stepper", value: $stepVal, in: 0...5)
                Text("Stepper current value \(stepVal)")
                
            }
            
            //MARK: - DatePicker
            Section{
                DatePicker("Please select a date", selection: $gameTime)
            }
            Section{
                DatePicker("Please select a date", selection: $gameTime, in: Date()...)
            }
        }
    }
}

#Preview {
    UsingPickers()
}
