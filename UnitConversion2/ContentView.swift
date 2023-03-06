//
//  ContentView.swift
//  UnitConversion2
//
//  Created by Hossein Sharifi on 06/03/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var inputTemp: Double = 0.0
    @State var outputTemp: Double = 0.0
    @State var unitSelected: String = "C"
    @State var secondUnitSelected: String = "C"
    
    let temperatureUnits = ["C", "F", "K"]
    
    var tempCalculated: Double {
        var finalTemp = 0.0
        if unitSelected == "C" && secondUnitSelected == "F" {
            finalTemp = Double((inputTemp * 1.8) + 32)
        } else if unitSelected == "C" && secondUnitSelected == "K" {
            finalTemp = Double(inputTemp + 273.15)
        } else if unitSelected == "F" && secondUnitSelected == "C" {
            finalTemp = Double((inputTemp - 32) * 0.5556)
        } else if unitSelected == "K" && secondUnitSelected == "C" {
            finalTemp = inputTemp - 237.15
        } else if unitSelected == "K" && secondUnitSelected == "F" {
            finalTemp = Double(1.8*(inputTemp - 273.15) + 32)
        } else {
            finalTemp = inputTemp
        }
    
        return finalTemp
    }
    
    
    var body: some View {
        Form {
            Section(header: Text("Enter degrees")) {
                TextField("Input temperature", value: $inputTemp, formatter: NumberFormatter())
            }
            
            Section(header: Text("From")) {
                Picker("Units", selection: $unitSelected) {
                    ForEach(temperatureUnits, id: \.self) {
                        Text($0)
                    }
                }.pickerStyle(.segmented)
            }
            
            Section(header: Text("To")) {
                Picker("Units", selection: $secondUnitSelected) {
                    ForEach(temperatureUnits, id: \.self) {
                        Text($0)
                    }
                }.pickerStyle(.segmented)
            }
            
            Section(header: Text("Converted temperature")) {
                Text("\(tempCalculated, specifier: "%.2f") \(secondUnitSelected)")
            }
        
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
