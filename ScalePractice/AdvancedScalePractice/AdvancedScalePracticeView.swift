//
//  AdvancedScalePracticeView.swift
//  ScalePractice
//
//  Created by Alex Burdiss on 12/27/19.
//  Copyright © 2020 Alex Burdiss. All rights reserved.

import SwiftUI

/**
 This view allows the user to select scales from spinners, add them to a list, and choose a random scale only from the list.
 */
struct AdvancedScalePracticeView: View {
    /**
     The note names to be displayed on one of the spinners.
     */
    var noteNames = ["C", "C♯", "D♭", "D", "D♯", "E♭", "E", "F", "F♯", "G♭", "G", "G♯", "A♭", "A", "A♯", "B♭", "B"]
    
    /**
     The scale names to be displayed on one of the spinners.
     */
    var scaleNames = ["Major", "Natural Minor", "Harmonic Minor", "Melodic Minor", "Ionian", "Dorian", "Phrygian", "Lydian", "Mixolydian", "Aeolian", "Locrian", "Minor Major", "Dorian ♭2", "Lydian Augmented", "Lydian Dominant", "Mixolydian ♭6", "Locrian ♮2", "Altered Scale", "Blues", "Major Pentatonic", "Minor Pentatonic", "Whole-Half Octatonic", "Half-Whole Octatonic", "Whole Tone"]
    
    /**
     This State variable holds whichever note name is selected by the user in the spinner, to be used to add the scale to the list.
     */
    @State private var selectedNote = 0
    
    /**
     This State variable holds whichever scale name is selected by the user in the spinner, to be userd to add the scale to the list.
     */
    @State private var selectedScale = 0
    
    /**
     This State variable holds the scales that are displayed on the screen. A random scale will only be chosen from this list.
     */
    @State var possibleScales:[Scale] = []
    
    /**
     This text will be displayed if the user tries to randomize a scale when there have not been any scales added to the list.
     */
    @State var newScaleText:String = NSLocalizedString("No Scale Selected", comment: "")
    
    /**
     This counter increments constantly for each scale added to the list, to ensure that each item in the list has a unique id. This is necessary for the ForEach loop that displays them to the screen.
     */
    @State var idCount:Int = 0
    
    /**
     This State variable determines whether to show the alert if the scale has already been added to the list.
     */
    @State private var alreadyAddedAlert = false
    
    /**
     This State variable determines whether or not to show the alert if there is no scale in the list.
     */
    @State private var noScaleAlert = false
    
    /**
    The User Interface.
    */
    var body: some View {
        NavigationView {
            VStack {
                ScaleDisplayView(newScaleText: NSLocalizedString(newScaleText, comment: ""))
                    .padding(.top)
                HStack {
                    Picker(selection: $selectedNote, label:Text("Note")) {
                            ForEach(0 ..< noteNames.count) {
                               Text(self.noteNames[$0])
                        }
                    }
                    .frame(width: 75, height: 220)
                    .clipped()
                    Picker(selection: $selectedScale, label: Text("Scale")) {
                            ForEach(0 ..< scaleNames.count) {
                                Text(NSLocalizedString(self.scaleNames[$0], comment: ""))
                        }
                    }
                    .frame(width: 300, height: 220)
                    .clipped()
                }
                HStack {
                    Button(action: {
                        self.possibleScales.removeAll()
                    })  {
                        Text("Reset")
                        .foregroundColor(.red)
                        .padding()
                        .overlay(
                        RoundedRectangle(cornerRadius: 12).stroke(Color.red, lineWidth: 1))
                    }
                        .padding(.horizontal)
                    Spacer()
                    Button(action: {
                        self.addToScaleList(noteName: self.noteNames[self.selectedNote], scaleName: self.scaleNames[self.selectedScale])
                    }) {
                        Text("Add To List")
                        .foregroundColor(.green)
                        .padding()
                        .overlay(
                        RoundedRectangle(cornerRadius: 12).stroke(Color.green, lineWidth: 1))
                    }
                    .padding(.horizontal)
                }
                .padding(.horizontal)
                List {
                    ForEach(possibleScales) { scale in
                        Text(scale.name)
                    }.onDelete(perform: removeScale)
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
            }
            .alert(isPresented: $alreadyAddedAlert) {
                Alert(title: Text("Scale Already Selected"), dismissButton: .default(Text("Dismiss")))
            }
            .navigationBarTitle(Text("Advanced Scale Practice"), displayMode: .inline)
            .navigationBarItems(trailing: NavigationLink(destination: AdvancedArpeggioPracticeView()) {
                Text("Arpeggios")
                    .padding()
            })
        }
        .alert(isPresented: $noScaleAlert) {
            Alert(title: Text("No Scale Selected"), message: Text("Please select at least one scale"), dismissButton: .default(Text("Dismiss")))
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    /**
     This function adds a scale to the list.
     */
    func addToScaleList(noteName: String, scaleName: String) {
        var scaleAlreadyInList = false
        let newID = idCount
        let newScale = Scale(id: newID, name: "\(noteName) \(NSLocalizedString(scaleName, comment: ""))", construction: "", description: "")
        
        for scale in possibleScales {
            if scale.name == newScale.name {
                scaleAlreadyInList = true
            }
        }
        if !scaleAlreadyInList {
            possibleScales.insert(newScale, at: 0)
            self.idCount += 1
        } else {
            // Show the alert!
            self.alreadyAddedAlert = true
        }
        
    }
    
    /**
     This function generates a random scale from scales that have been added to the list.
     */
    func generateScales() {
        if possibleScales.count == 0 {
            self.noScaleAlert = true
        }
        var newScale = possibleScales.randomElement()
        if possibleScales.count > 1 {
            while newScale?.name == newScaleText {
                newScale = possibleScales.randomElement()
                
            }
        }
        newScaleText = newScale?.name ?? NSLocalizedString("No Arpeggio Selected", comment: "")
    }
    
    /**
     This funciton removes scales from the list, from a user pull to the left.
     */
    func removeScale(at offsets: IndexSet) {
        possibleScales.remove(atOffsets: offsets)
    }
}

struct AdvancedScalePracticeView_Previews: PreviewProvider {
    static var previews: some View {
        AdvancedScalePracticeView()
    }
}
