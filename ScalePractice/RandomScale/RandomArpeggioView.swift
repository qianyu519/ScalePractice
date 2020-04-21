//
//  RandomArpeggioView.swift
//  ScalePractice
//
//  Created by Alex Burdiss on 12/27/19.
//  Copyright © 2019 Alex Burdiss. All rights reserved.
//

// TODO: Document this file!

import SwiftUI

struct RandomArpeggioView: View {
    
    @State var newScaleText = NSLocalizedString("No Arpeggio Selected", comment: "")
    
    @State var majorSwitch = true
    @State var minorSwitch = false
    @State var augmentedSwitch = false
    @State var diminishedSwitch = false
    @State var dominantSeventhSwitch = false
    @State var majorSeventhSwitch = false
    @State var minorSeventhSwitch = false
    @State var minorMajorSeventhSwitch = false
    @State var augmentedSeventhSwitch = false
    @State var halfDiminishedSeventhSwitch = false
    @State var diminishedSeventhSwitch = false
    
    @State private var noArpeggioAlert = false

    var body: some View {
            VStack {
                ScaleDisplayView(newScaleText: newScaleText)
                    .padding(.top)
                VStack {
                    Group {
                        Toggle(isOn: $majorSwitch) {
                            Text("MajorChord")
                        }
                        Toggle(isOn: $minorSwitch) {
                            Text("Minor")
                        }
                        Toggle(isOn: $augmentedSwitch) {
                            Text("Augmented")
                        }
                        Toggle(isOn: $diminishedSwitch) {
                            Text("Diminished")
                        }
                    }
                    Group {
                        Toggle(isOn: $dominantSeventhSwitch) {
                            Text("Dominant Seventh")
                        }
                        Toggle(isOn: $majorSeventhSwitch) {
                            Text("Major Seventh")
                        }
                        Toggle(isOn: $minorSeventhSwitch) {
                            Text("Minor Seventh")
                        }
                        Toggle(isOn: $minorMajorSeventhSwitch) {
                            Text("Minor Major Seventh")
                        }
                        Toggle(isOn: $augmentedSeventhSwitch) {
                            Text("Augmented Minor Seventh")
                        }
                        Toggle(isOn: $halfDiminishedSeventhSwitch) {
                            Text("Half Diminished Seventh")
                        }
                        Toggle(isOn: $diminishedSeventhSwitch) {
                            Text("Diminished Seventh")
                        }
                    }
                }
                .padding(.horizontal, 70)
                Spacer()
                Button(action: {
                    self.selectAllScales()
                }) {
                    Text("All Arpeggios")
                    .foregroundColor(.gray)
                    .padding()
                    .overlay(
                    RoundedRectangle(cornerRadius: 12).stroke(Color.gray, lineWidth: 1))
                }
                
                Button(action: {
                    self.generateScales()
                }) {
                    HStack {
                        Spacer()
                        Text("Go")
                            .foregroundColor(.purple)
                            .font(.title)
                            .padding()
                        Spacer()
                    }.overlay(
                    RoundedRectangle(cornerRadius: 12).stroke(Color.purple, lineWidth: 1))
                    .padding()
                }
                .alert(isPresented: $noArpeggioAlert) {
                    Alert(title: Text("No Arpeggio Selected"), message: Text("Please select at least one category"), dismissButton: .default(Text("Dismiss")))
                }
            }
            .navigationBarTitle(Text("Random Arpeggio Practice"), displayMode: .inline)
    }
    
    func selectAllScales () {
        var allOn = true
        if !majorSwitch {
            allOn = false
            majorSwitch.toggle()
        }
        if !minorSwitch {
            allOn = false
            minorSwitch.toggle()
        }
        if !augmentedSwitch {
            allOn = false
            augmentedSwitch.toggle()
        }
        if !diminishedSwitch {
            allOn = false
            diminishedSwitch.toggle()
        }
        if !dominantSeventhSwitch {
            allOn = false
            dominantSeventhSwitch.toggle()
        }
        if !majorSeventhSwitch {
            allOn = false
            majorSeventhSwitch.toggle()
        }
        if !minorSeventhSwitch {
            allOn = false
            minorSeventhSwitch.toggle()
        }
        if !minorMajorSeventhSwitch {
            allOn = false
            minorMajorSeventhSwitch.toggle()
        }
        if !augmentedSeventhSwitch {
            allOn = false
            augmentedSeventhSwitch.toggle()
        }
        if !halfDiminishedSeventhSwitch {
            allOn = false
            halfDiminishedSeventhSwitch.toggle()
        }
        if !diminishedSeventhSwitch {
            allOn = false
            diminishedSeventhSwitch.toggle()
        }
        
        
        if allOn {
            majorSwitch.toggle()
            minorSwitch.toggle()
            augmentedSwitch.toggle()
            diminishedSwitch.toggle()
            dominantSeventhSwitch.toggle()
            majorSeventhSwitch.toggle()
            minorSeventhSwitch.toggle()
            minorMajorSeventhSwitch.toggle()
            augmentedSeventhSwitch.toggle()
            halfDiminishedSeventhSwitch.toggle()
            diminishedSeventhSwitch.toggle()
        }
        
    }
    
    func generateScales () {        
        let indeterminantLetterNames = ["C", "C♯", "D", "E♭", "E", "F", "F♯", "G", "A♭", "A", "B♭", "B"]
        
        var possibleArpeggios: [String] = []
        
        if majorSwitch {
            possibleArpeggios += createArpeggioArrayFromParts(letterNames: indeterminantLetterNames, scaleNames: ["MajorChord"])
        }
        if minorSwitch {
            possibleArpeggios += createArpeggioArrayFromParts(letterNames: indeterminantLetterNames, scaleNames: ["Minor"])
        }
        if augmentedSwitch {
            possibleArpeggios += createArpeggioArrayFromParts(letterNames: indeterminantLetterNames, scaleNames: ["Augmented"])
        }
        if diminishedSwitch {
            possibleArpeggios += createArpeggioArrayFromParts(letterNames: indeterminantLetterNames, scaleNames: ["Diminished"])
        }
        if dominantSeventhSwitch {
            possibleArpeggios += createArpeggioArrayFromParts(letterNames: indeterminantLetterNames, scaleNames: ["Dominant Seventh"])
        }
        if majorSeventhSwitch {
            possibleArpeggios += createArpeggioArrayFromParts(letterNames: indeterminantLetterNames, scaleNames: ["Major Seventh"])
        }
        if minorSeventhSwitch {
            possibleArpeggios += createArpeggioArrayFromParts(letterNames: indeterminantLetterNames, scaleNames: ["Minor Seventh"])
        }
        if minorMajorSeventhSwitch {
            possibleArpeggios += createArpeggioArrayFromParts(letterNames: indeterminantLetterNames, scaleNames: ["Minor Major Seventh"])
        }
        if augmentedSeventhSwitch {
            possibleArpeggios += createArpeggioArrayFromParts(letterNames: indeterminantLetterNames, scaleNames: ["Augmented Minor Seventh"])
        }
        if halfDiminishedSeventhSwitch {
            possibleArpeggios += createArpeggioArrayFromParts(letterNames: indeterminantLetterNames, scaleNames: ["Half Diminished Seventh"])
        }
        if diminishedSeventhSwitch {
            possibleArpeggios += createArpeggioArrayFromParts(letterNames: indeterminantLetterNames, scaleNames: ["Diminished Seventh"])
        }
        
        if possibleArpeggios.count == 0 {
            self.noArpeggioAlert = true
        } else {
            var newScale = possibleArpeggios.randomElement()
            while newScale == newScaleText { newScale = possibleArpeggios.randomElement() }
            newScaleText = newScale ?? NSLocalizedString("No Arpeggio Selected", comment: "")
        }
    }
    
    func createArpeggioArrayFromParts ( letterNames : [String], scaleNames: [String] ) -> [String] {
        var allLetterNamesOfScale: [String] = []
        for letter in letterNames {
            for scaleName in scaleNames {
                allLetterNamesOfScale.append("\(letter) \(NSLocalizedString(scaleName, comment: ""))")
            }
        }
        return allLetterNamesOfScale
    }
}

struct RandomArpeggioView_Previews: PreviewProvider {
    static var previews: some View {
        RandomArpeggioView()
    }
}
