//
//  ContentView.swift
//  ConversionWrapper
//
//  Created by CHOIJUNHYUK on 5/9/24.
//

import SwiftUI

struct ContentView: View {
    @State private var inputUnit = "Temps"
    @State private var inputValue = "0"
    @State private var inputDetailUnit = ""
    @State private var outputDetailUnit = ""
    @State private var tempSignUnit = "Positive"
    @FocusState private var inputValueFocused: Bool
    
    let inputUnits = ["Temps", "Length", "Time", "Volume"]
    let tempUnits = ["Celsius", "Fahreheit", "Kelvin"]
    let lengthUnits = ["Meters", "Kilometers", "Feet", "Yards", "Miles"]
    let timeUnits = ["Seconds", "Minutes", "Hours", "Days"]
    let volumeUnits = ["Milliliters", "Liters", "Cups", "Pints", "Gallons"]
    let tempSignUnits = ["Positive", "Negative"]
    
    private var outputValue: Double {
        // let heightFeet = Measurement(value: 6, unit: UnitLength.feet)
        // let heightInches = heightFeet.converted(to: UnitLength.inches)
        
        switch inputUnit {
        case "Length":
            return calculateLength(value: inputValue, from: inputDetailUnit, to: outputDetailUnit)
        case "Time":
            return calculateTime(value: inputValue, from: inputDetailUnit, to: outputDetailUnit)
        case "Volume":
            return calculateVolume(value: inputValue, from: inputDetailUnit, to: outputDetailUnit)
        default:
            return calculateTemps(value: inputValue, from: inputDetailUnit, to: outputDetailUnit, sign: tempSignUnit)
        }
    }
    
    private var detailUnits: [String] {
        switch inputUnit {
        case "Length":
            return lengthUnits
        case "Time":
            return timeUnits
        case "Volume":
            return volumeUnits
        default:
            return tempUnits
        }
    }
    
    private func setDetailUnit(label: String) {
        switch label {
        case "Length":
            if !lengthUnits.contains(inputDetailUnit) {
                inputDetailUnit = lengthUnits[0]
                outputDetailUnit = lengthUnits[1]
            }
        case "Time":
            if !timeUnits.contains(inputDetailUnit) {
                inputDetailUnit = timeUnits[0]
                outputDetailUnit = timeUnits[1]
            }
        case "Volume":
            if !volumeUnits.contains(inputDetailUnit) {
                inputDetailUnit = volumeUnits[0]
                outputDetailUnit = volumeUnits[1]
            }
        default:
            if !tempUnits.contains(inputDetailUnit) {
                inputDetailUnit = tempUnits[0]
                outputDetailUnit = tempUnits[1]
            }
        }
    }
    
    private func tempColor() -> Color {
        if inputUnit == "Temps" {
            if tempSignUnit == "Positive" { return .red }
            else { return .blue }
        } else {
            return .black
        }
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Picker("Input Units", selection: $inputUnit) {
                        ForEach(inputUnits, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    .onReceive(inputUnit.publisher.collect(), perform: { label in
                        setDetailUnit(label: String(label))
                    })
                }
                
                if inputUnit == "Temps" {
                    Section {
                        Picker("Temps Sign Select", selection: $tempSignUnit) {
                            ForEach(tempSignUnits, id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(.segmented)
                    }
                }
                
                Section {
                    VStack {
                        VStack(alignment: .center, content: {
                            TextField("", text: $inputValue)
                                .padding()
                                .multilineTextAlignment(.center)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8) // 둥근 사각형으로 경계선을 그림
                                        .stroke(tempColor(), lineWidth: 1) // 검은색 테두리를 적용
                                )
                                .onReceive(inputValue.publisher.collect()) {
                                    // 10자까지만 입력 허용
                                    inputValue = String($0.prefix(10))
                                }
                                .keyboardType(.numberPad)
                                .focused($inputValueFocused)
                                .tint(tempColor())
                            
                            Picker("Input Unit", selection: $inputDetailUnit) {
                                ForEach(detailUnits, id: \.self) {
                                    Text($0)
                                }
                            }
                        }).padding()
                        
                        Image(systemName: "arrowshape.down")
                            .padding()
                        
                        VStack(alignment: .center, content: {
                            Text(outputValue, format: .number)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .multilineTextAlignment(.center)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8) // 둥근 사각형으로 경계선을 그림
                                        .stroke(Color.black, lineWidth: 1) // 검은색 테두리를 적용
                                )
                            
                            Picker("Output Unit", selection: $outputDetailUnit) {
                                ForEach(detailUnits, id: \.self) {
                                    Text($0)
                                }
                            }
                        }).padding()
                    }
                }
                
                Section {
                    Button("Clear") {
                        inputValue = "0"
                    }
                }
            }
            .navigationTitle("Unit Conversion")
            .toolbar {
                if inputValueFocused {
                    Button("Done") {
                        inputValueFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
