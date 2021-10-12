//
//  ContentView.swift
//  Final Grade Calculator
//
//  Created by Student on 9/22/21.
//

import SwiftUI

struct ContentView: View {
    @State private var currentGradeTextField = ""
    @State private var finalWeightTextField = ""
    @State private var desiredGrade = 0.0
    @State private var  requiredGrade = 0.0
    var body: some View {
        VStack {
       
        Text("Final Grade Calculator")
            .font(.title)
            .fontWeight(.bold)
            .padding()
        TextField("Current Semester Grade", text: $currentGradeTextField)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .multilineTextAlignment(.center)
            .frame(width: 200, height: 30, alignment: .center)
            .font(.body)
            .padding()
        TextField("Final Weight (%)", text: $finalWeightTextField)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .multilineTextAlignment(.center)
            .frame(width: 200, height: 30, alignment: .center)
            .font(.body)
            .padding()
        Picker("Desired Semester Grade", selection: $desiredGrade) {
                        Text("A").tag(90.0)
                        Text("B").tag(80.0)
                        Text("C").tag(70.0)
                        Text("D").tag(60.0)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                        .padding()
        Text("Required Grade on Final")
        Text(String(format: "%.2f",requiredGrade))
            .font(.title)
            .fontWeight(.bold)
         Spacer()
            
    
            
        
            
        }
        .onChange(of: desiredGrade, perform: { value in
                    calculateGrade()
                })
        .background(requiredGrade > 100 ? Color.red : Color.green.opacity(requiredGrade > 0 ? 1.0 : 0.0))

    }
    func calculateGrade() {
        if let currentGrade = Double(currentGradeTextField) {
            if let finalWeight = Double(finalWeightTextField) {
                if finalWeight < 100 && finalWeight > 0 {
                    let finalPercentage = finalWeight / 100.0
                    requiredGrade = max(0.0,(desiredGrade - (currentGrade * (1.0 - finalPercentage))) / finalPercentage)
                }
            }
        }
    }
                
            
        
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
