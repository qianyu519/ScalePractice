//
//  RandomArpeggioView.swift
//  ScalePractice
//
//  Created by Alex Burdiss on 12/27/19.
//  Copyright © 2020 Alex Burdiss. All rights reserved.

import SwiftUI

/**
 A mirror of the primary view of the app, but used for arpeggios. When the "Go" button is clicked, this app will generate a random scale from the switches that are selected, and displays it in the scale display view of the app.
 */
struct RandomArpeggioView: View {
    
    /**
     This state variabel updates the veiw whenever a new arpeggio is inputted by the function.
     */
    @State var newArpeggioText = NSLocalizedString("No Arpeggio Selected", comment: "")
    
    /**
     This state variable holds the settings of the Major Switch, and allows the user to add major arpeggios to the random array of arpeggios they are practicing.
     */
    @State var majorSwitch = true
    
    /**
     This State variable holds the settings of the minor switch, and allows the user to add minor arpeggios to the random array of arpeggios they are practicing.
     */
    @State var minorSwitch = false
    
    /**
     This State variable holds the settings of the augmented switch, and allows the user to add augmented arpeggios to the random array of arpeggios they are practicing.
     */
    @State var augmentedSwitch = false
    
    /**
     This State variable holds the settings of the diminished switch, and allows the user to add diminished arpeggios to the random array of arpeggios they are practicing
     */
    @State var diminishedSwitch = false
    
    /**
     This State variable holds the settings of the dominant seventh switch, and allows the user to add dominant seventh arpeggios to the random array of arpeggios they are practicing.
     */
    @State var dominantSeventhSwitch = false
    
    /**
     This State variable holds the settings of the major seventh switch, and allows the user to add major seventh arpeggios to the random array of arpeggios they are practicing.
     */
    @State var majorSeventhSwitch = false
    
    /**
     This State variable holds the settings for the minor seventh switch, and allows the user to add minor seventh arpeggios to the random array of arpeggios they are practicing
     */
    @State var minorSeventhSwitch = false
    
    /**
     This State variable holds the settings for the minor major seventh switch and allows the user to add minor major seventh arpeggios to the random array of arpeggios they are practicing.
     */
    @State var minorMajorSeventhSwitch = false
    
    /**
     This State variable holds the settings for the augmented seventh switch and allows the user to add augmented seventh arpeggios to the random array of arpeggios they are practicing.
     */
    @State var augmentedSeventhSwitch = false
    
    /**
     This State variable holds the settings for the half-diminished seventh switch, and allows the user to add half-diminished seventh arpeggios to the random array of arpeggios they are practicing.
     */
    @State var halfDiminishedSeventhSwitch = false
    
    /**
     This State variable holds the settings for the diminished seventh switch, and allows the user to add diminished arpeggios to the random array of arpeggios they are practicing.
     */
    @State var diminishedSeventhSwitch = false
    
    /**
     This State variable holds the boolean that determines if the "No Arpeggio Alert" Alert shows.
     */
    @State private var noArpeggioAlert = false

    /**
     The User Interface.
     */
    var body: some View {
        VStack {
            ScaleDisplayView(newScaleText: newArpeggioText)
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
                self.selectAllArpeggios()
            }) {
                Text("All Arpeggios")
                .foregroundColor(.gray)
                .padding()
                .overlay(
                RoundedRectangle(cornerRadius: 12).stroke(Color.gray, lineWidth: 1))
            }
            
            Button(action: {
                self.generateArpeggios()
            }) {
                HStack {
                    Spacer()
                    Text("Go")
                        .foregroundColor(.purple)
                        .font(.title)
                        .padding()
                    Spacer()
                }.overlay(
                    RoundedRectangle(cornerRadius: 12).stroke(Color.purple, lineWidth: 1)
                )
                .padding()
            }
            .accessibility(value: Text("\(newArpeggioText)"))
            .alert(isPresented: $noArpeggioAlert) {
                Alert(title: Text("No Arpeggio Selected"), message: Text("Please select at least one category"), dismissButton: .default(Text("Dismiss")))
            }
        }
        .navigationBarTitle(Text("Random Arpeggio Practice"), displayMode: .inline)
    }
    
    /**
     This function turns all of the Arpeggio toggles on.
     
     Note: If all of the arpeggio toggles are already on, it will turn all of them off except "Major".
     */
    func selectAllArpeggios () {
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
    
    /**
     This function generates a random arpeggio from the switches that are turned on. It ensures that the arpeggio will be different from the previous one.
     */
    func generateArpeggios () {
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
        
        // Ensuring the new arpeggio is different from the old one.
        if possibleArpeggios.count == 0 {
            self.noArpeggioAlert = true
        } else {
            var newScale = possibleArpeggios.randomElement()
            while newScale == newArpeggioText { 
                newScale = possibleArpeggios.randomElement()
            }
            newArpeggioText = newScale ?? NSLocalizedString("No Arpeggio Selected", comment: "")
        }
    }
    
    /**
     Constructs the arpeggio name and note together to form one string to display on the screen.
     */
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
