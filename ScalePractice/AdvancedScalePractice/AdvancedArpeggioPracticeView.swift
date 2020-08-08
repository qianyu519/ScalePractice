//
//  AdvancedArpeggioPracticeView.swift
//  ScalePractice
//
//  Created by Alex Burdiss on 1/19/20.
//  Copyright © 2020 Alex Burdiss. All rights reserved.

import SwiftUI

/**
 This view allows the user to select arpeggios from spinners, add them to a list, and choose a random scale only from the list.
 */
struct AdvancedArpeggioPracticeView: View {
    /**
     The note names to be displayed on one of the spinners
     */
    var noteNames = ["C", "C♯", "D♭", "D", "D♯", "E♭", "E", "F", "F♯", "G♭", "G", "G♯", "A♭", "A", "A♯", "B♭", "B"]
    
    /**
     The arpeggio names to be displayed on one of the spinners
     */
    var arpeggioNames = ["MajorChord", "Minor", "Augmented", "Diminished", "Dominant Seventh", "Major Seventh", "Minor Seventh", "Minor Major Seventh", "Augmented Minor Seventh", "Half Diminished Seventh", "Diminished Seventh"]
    
    /**
    This State variable holds whichever note name is selected by the user in the spinner, to be used to add the arpeggio to the list.
    */
    @State private var selectedNote = 0
    
    /**
    This State variable holds whichever arpeggio name is selected by the user in the spinner, to be userd to add the arpeggio to the list.
    */
    @State private var selectedArpeggio = 0
    
    /**
    This State variable holds the arpeggios that are displayed on the screen. A random arpeggio will only be chosen from this list.
    */
    @State var possibleArpeggios:[Arpeggio] = []
    
    /**
    This text will be displayed if the user tries to randomize an arpeggio when there have not been any arpeggios added to the list.
    */
    @State var newArpeggioText:String = NSLocalizedString("No Arpeggio Selected", comment: "")
    
    /**
    This counter increments constantly for each arpeggio added to the list, to ensure that each item in the list has a unique id. This is necessary for the ForEach loop that displays them to the screen.
    */
    @State var idCount:Int = 0
    
    /**
    This State variable determines whether to show the alert if the arpeggio has already been added to the list.
    */
    @State private var alreadyAddedAlert = false
    
    /**
    This State variable determines whether or not to show the alert if there is no scale in the list.
    */
    @State private var noArpeggioAlert = false
    
    /**
     The User Interface
     */
    var body: some View {
        VStack {
            ScaleDisplayView(newScaleText: NSLocalizedString(newArpeggioText, comment: ""))
                .padding(.top)
            HStack {
                Picker(selection: $selectedNote, label: Text("Note")) {
                    ForEach(0 ..< noteNames.count) {
                        Text(self.noteNames[$0])
                    }
                }.frame(width: 75, height: 220)
                Picker(selection: $selectedArpeggio, label: Text("Arpeggio")) {
                    ForEach(0 ..< arpeggioNames.count) {
                        Text(NSLocalizedString(self.arpeggioNames[$0], comment: ""))
                    }
                }.frame(width: 300, height: 220)
            }
            HStack {
                Button(action: {
                    self.possibleArpeggios.removeAll()
                }) {
                    Text("Reset")
                    .foregroundColor(.red)
                    .padding()
                    .overlay(
                    RoundedRectangle(cornerRadius: 12).stroke(Color.red, lineWidth: 1))
                }
                .padding(.horizontal)
                Spacer()
                Button(action: {
                    self.addToArpeggioList(noteName: self.noteNames[self.selectedNote], arpeggioName: self.arpeggioNames[self.selectedArpeggio])
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
                ForEach(possibleArpeggios) { scale in
                    Text(scale.name)
                }.onDelete(perform: removeArpeggio)
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
        }
        .alert(isPresented: $alreadyAddedAlert) {
            Alert(title: Text("Arpeggio Already Selected"), dismissButton: .default(Text("Dismiss")))
        }
        .navigationBarTitle(Text("Advanced Arpeggio Practice"), displayMode: .inline)
        .alert(isPresented: $noArpeggioAlert) {
            Alert(title: Text("No Arpeggio Selected"), message: Text("Please select at least one arpeggio"), dismissButton: .default(Text("Dismiss")))
        }
    }
    
    /**
     This function adds an arpeggio to the list
     */
    func addToArpeggioList(noteName: String, arpeggioName: String) {
        var arpeggioAlreadyInList = false
        let newID = idCount
        let newArpeggio = Arpeggio(id: newID, name: "\(noteName) \(NSLocalizedString(arpeggioName, comment: ""))", construction: "", description: "")
        
        for arpeggio in possibleArpeggios {
            if arpeggio.name == newArpeggio.name {
                arpeggioAlreadyInList = true
            }
        }
        if !arpeggioAlreadyInList {
            possibleArpeggios.insert(newArpeggio, at: 0)
            self.idCount += 1
        } else {
            // Show the alert!
            self.alreadyAddedAlert = true
        }
    }
    
    /**
     This function generates a random arpeggio from scales that have been added to the list.
     */
    func generateArpeggios() {
        if possibleArpeggios.count == 0 {
            self.noArpeggioAlert = true
        }
        var newArpeggio = possibleArpeggios.randomElement()
        if possibleArpeggios.count > 1 {
            while newArpeggio?.name == newArpeggioText {
                newArpeggio = possibleArpeggios.randomElement()
            }
        }
        newArpeggioText = newArpeggio?.name ?? NSLocalizedString("No Arpeggio Selected", comment: "")
    }
    
    /**
    This funciton removes arpeggios from the list, from a user pull to the left.
    */
    func removeArpeggio(at offsets: IndexSet) {
        possibleArpeggios.remove(atOffsets: offsets)
    }
}

struct AdvancedArpeggioPracticeView_Previews: PreviewProvider {
    static var previews: some View {
        AdvancedArpeggioPracticeView()
    }
}
