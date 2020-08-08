//
//  ContentView.swift
//  ScalePractice
//
//  Created by Alex Burdiss on 12/17/19.
//  Copyright © 2020 Alex Burdiss. All rights reserved.

import SwiftUI

/**
 The primary view of the app. When the "Go" button is clicked, this app will generate a random scale from the switches that are selected, and displays it in the scale display view of the app.
 */
struct ContentView: View {
    
    /**
     This state variable updates the view whenever a new scale is inputted by the function.
     */
    @State var newScaleText = NSLocalizedString("No Scale Selected", comment: "")
    
    /**
     This State variable holds the settings of the Major Switch, and allows the user to add major scales to the random array of scales they are practicing.
     */
    @State var majorSwitch = true
    
    /**
    This State variable holds the settings of the Natural Minor Switch, and allows the user to add natural minor scales to the random array of scales they are practicing.
    */
    @State var naturalMinorSwitch = false
    
    /**
    This State variable holds the settings of the Harmonic Minor Switch, and allows the user to add harmonic minor scales to the random array of scales they are practicing.
    */
    @State var harmonicMinorSwitch = false
    
    /**
    This State variable holds the settings of the Melodic Minor Switch, and allows the user to add melodic minor scales to the random array of scales they are practicing.
    */
    @State var melodicMinorSwitch = false
    
    /**
    This State variable holds the settings of the Major Modes Switch, and allows the user to add major mode scales to the random array of scales they are practicing.
    */
    @State var majorModesSwitch = false
    
    /**
    This State variable holds the settings of the Melodic Minor Modes Switch, and allows the user to add melodic minor mode scales to the random array of scales they are practicing.
    */
    @State var melodicMinorModesSwitch = false
    
    /**
    This State variable holds the settings of the Blues Switch, and allows the user to add blues scales to the random array of scales they are practicing.
    */
    @State var bluesSwitch = false
    
    /**
    This State variable holds the settings of the Pentatonic Switch, and allows the user to add pentatonic scales to the random array of scales they are practicing.
    */
    @State var pentatonicSwitch = false
    
    /**
    This State variable holds the settings of the Octatonic Switch, and allows the user to add octatonic scales to the random array of scales they are practicing.
    */
    @State var octatonicSwitch = false
    
    /**
    This State variable holds the settings of the Whole Tone Switch, and allows the user to add whole tone scales to the random array of scales they are practicing.
    */
    @State var wholeToneSwitch = false
    
    /**
     This State variable holds the boolean that determines if the "No Scale Alert" Alert shows.
     */
    @State private var noScaleAlert:Bool = false
    
    /**
     The User Interface.
     */
    var body: some View {
        NavigationView {
            VStack {
                ScaleDisplayView(newScaleText: newScaleText)
                    .padding(.top)
                VStack {
                    Toggle(isOn: $majorSwitch) {
                        Text("Major")
                    }
                    Toggle(isOn: $naturalMinorSwitch) {
                        Text("Natural Minor")
                    }
                    Toggle(isOn: $harmonicMinorSwitch) {
                        Text("Harmonic Minor")
                    }
                    Toggle(isOn: $melodicMinorSwitch) {
                        Text("Melodic Minor")
                    }
                    Toggle(isOn: $majorModesSwitch) {
                        Text("Major Modes")
                    }
                    Toggle(isOn: $melodicMinorModesSwitch) {
                        Text("Melodic Minor Modes")
                    }
                    Toggle(isOn: $bluesSwitch) {
                        Text("Blues")
                    }
                    Toggle(isOn: $pentatonicSwitch) {
                        Text("Pentatonic")
                    }
                    Toggle(isOn: $octatonicSwitch) {
                        Text("Octatonic")
                    }
                    Toggle(isOn: $wholeToneSwitch) {
                        Text("Whole Tone")
                    }
                }
                .padding(.horizontal, 70)
                Spacer()
                Button(action: {
                    self.selectAllScales()
                }) {
                    Text("All Scales")
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
                        RoundedRectangle(cornerRadius: 12).stroke(Color.purple, lineWidth: 1)
                    )
                    .padding()
                }
                .accessibility(value: Text("\(newScaleText)"))
                .alert(isPresented: $noScaleAlert) {
                    Alert(title: Text("No Scale Selected"), message: Text("Please select at least one category"), dismissButton: .default(Text("Dismiss")))
                }
            }
            .navigationBarTitle(Text("Random Scale Practice"), displayMode: .inline)
            .navigationBarItems(trailing: NavigationLink(destination: RandomArpeggioView()) {
                Text("Arpeggios")
                .padding()
            })
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    /**
     This function turns all of the scale toggles on.
     
     Note: If all scale toggles are already on, it will turn all of them off except "Major".
     */
    func selectAllScales () {
        var allOn = true
        if !majorSwitch {
            allOn = false
            majorSwitch.toggle()
        }
        if !naturalMinorSwitch {
            allOn = false
            naturalMinorSwitch.toggle()
        }
        if !harmonicMinorSwitch {
            allOn = false
            harmonicMinorSwitch.toggle()
        }
        if !melodicMinorSwitch {
            allOn = false
            melodicMinorSwitch.toggle()
        }
        if !majorModesSwitch {
            allOn = false
            majorModesSwitch.toggle()
        }
        if !melodicMinorModesSwitch {
            allOn = false
            melodicMinorModesSwitch.toggle()
        }
        if !bluesSwitch {
            allOn = false
            bluesSwitch.toggle()
        }
        if !pentatonicSwitch {
            allOn = false
            pentatonicSwitch.toggle()
        }
        if !octatonicSwitch {
            allOn = false
            octatonicSwitch.toggle()
        }
        if !wholeToneSwitch {
            allOn = false
            wholeToneSwitch.toggle()
        }
        
        if allOn {
            naturalMinorSwitch.toggle()
            harmonicMinorSwitch.toggle()
            melodicMinorSwitch.toggle()
            majorModesSwitch.toggle()
            melodicMinorModesSwitch.toggle()
            bluesSwitch.toggle()
            pentatonicSwitch.toggle()
            octatonicSwitch.toggle()
            wholeToneSwitch.toggle()
        }
    }
    
    /**
     This function generates a random scale from the switches that are turned on. It protects the scale and ensures that it will be different from the scale before.
     */
    func generateScales () {
        let majorLetterNames = ["C", "D♭", "D", "E♭", "E", "F", "F♯", "G♭", "G", "A♭", "A", "B♭", "B"]
        let minorLetterNames = ["C", "C♯", "D", "D♯", "E♭", "E", "F", "F♯", "G", "G♯", "A", "B♭", "B"]
        let indeterminantLetterNames = ["C", "C♯", "D", "E♭", "E", "F", "F♯", "G", "A♭", "A", "B♭", "B"]
        let pentatonicScaleNames = ["Major Pentatonic", "Minor Pentatonic"]
        let majorModeNames = ["Ionian", "Dorian", "Phrygian", "Lydian", "Mixolydian", "Aeolian", "Locrian"]
        let melodicMinorModeNames = ["Minor Major", "Dorian ♭2", "Lydian Augmented", "Lydian Dominant", "Mixolydian ♭6", "Locrian ♮2", "Altered Scale"]
        
        let octatonicScaleNames = ["Whole-Half Octatonic", "Half-Whole Octatonic"]
        
        var possibleScales: [String] = []
        
        if majorSwitch {
            possibleScales += createScaleArrayFromParts(letterNames: majorLetterNames, scaleNames: ["Major"])
        }
        if naturalMinorSwitch {
            possibleScales += createScaleArrayFromParts(letterNames: minorLetterNames, scaleNames: ["Natural Minor"])
        }
        if harmonicMinorSwitch {
            possibleScales += createScaleArrayFromParts(letterNames: minorLetterNames, scaleNames: ["Harmonic Minor"])
        }
        if melodicMinorSwitch {
            possibleScales += createScaleArrayFromParts(letterNames: minorLetterNames, scaleNames: ["Melodic Minor"])
        }
        if majorModesSwitch {
            possibleScales += createScaleArrayFromParts(letterNames: majorLetterNames, scaleNames: majorModeNames)
        }
        if melodicMinorModesSwitch {
            possibleScales += createScaleArrayFromParts(letterNames: minorLetterNames, scaleNames: melodicMinorModeNames)
        }
        if bluesSwitch {
            possibleScales += createScaleArrayFromParts(letterNames: indeterminantLetterNames, scaleNames: ["Blues"])
        }
        if pentatonicSwitch {
            possibleScales += createScaleArrayFromParts(letterNames: indeterminantLetterNames, scaleNames: pentatonicScaleNames)
        }
        if octatonicSwitch {
            possibleScales += createScaleArrayFromParts(letterNames: indeterminantLetterNames, scaleNames: octatonicScaleNames)
        }
        if wholeToneSwitch {
            possibleScales += createScaleArrayFromParts(letterNames: indeterminantLetterNames, scaleNames: ["Whole Tone"])
        }
        
        // Ensuring that the new scale is different from the old one.
        if possibleScales.count == 0 {
            self.noScaleAlert = true
        } else {
            var newScale = possibleScales.randomElement()
            while newScale == newScaleText {
                newScale = possibleScales.randomElement()
            }
            newScaleText = newScale ?? NSLocalizedString("No Scale Selected", comment: "")
        }
    }
    
    /**
     Constructs the scale name and scale note together to form one string to display on the screen.
     */
    func createScaleArrayFromParts ( letterNames : [String], scaleNames: [String] ) -> [String] {
        var allLetterNamesOfScale: [String] = []
        for letter in letterNames {
            for scaleName in scaleNames {
                allLetterNamesOfScale.append("\(letter) \(NSLocalizedString(scaleName, comment: ""))")
            }
        }
        return allLetterNamesOfScale
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
