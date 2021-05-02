//
//  ContentView.swift
//  TemperatureConverter
//
//  Created by Andrew Chen on 2021-05-02.
//

import SwiftUI

struct ContentView: View {
    @State private var initialTemp = "0";
    @State private var initialSelectedUnit = 0
    @State private var finalSelectedUnit = 0;
    let units = ["°C", "°F", "K"]
    
    var finalTemperature: Double  {
        let unit1 = units[initialSelectedUnit]
        let unit2 = units[finalSelectedUnit]
        let toBeConv = Double(initialTemp) ?? 0.0
        
        if (unit1 == unit2){
            return toBeConv
        }
        else if (initialSelectedUnit == 0 && finalSelectedUnit == 1){
            return toBeConv * 9 / 5 + 32
        }
        else if (initialSelectedUnit == 0 && finalSelectedUnit == 2){
            return toBeConv + 273
        }
        else if initialSelectedUnit == 1 && finalSelectedUnit == 2{
            return (toBeConv - 32) * 5 / 9 + 273
        }
        else if (initialSelectedUnit == 1 && finalSelectedUnit == 0){
            return (toBeConv - 32) * 5 / 9
        }
        else if (initialSelectedUnit == 2 && finalSelectedUnit == 0){
            return toBeConv - 273
        }
        else if (initialSelectedUnit == 2 && finalSelectedUnit == 1){
            return (toBeConv-273) * 9 / 5 + 32
        }
        return -1.0
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section {
                    TextField("Temperature", text:$initialTemp)
                    Picker("Unit", selection:
                            $initialSelectedUnit){
                        ForEach (0..<units.count){
                            Text("\(self.units[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section {
                    Text("\(finalTemperature, specifier: "%.2f")")
                    Picker("Unit", selection:
                            $finalSelectedUnit){
                        ForEach(0..<units.count){
                            Text("\(self.units[$0])")
                        }
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            .navigationTitle("Temperature")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
