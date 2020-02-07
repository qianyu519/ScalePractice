//
//  AdvancedArpeggioPracticeView.swift
//  ScalePractice
//
//  Created by Alex Burdiss on 1/19/20.
//  Copyright © 2020 Alex Burdiss. All rights reserved.
//

// TODO: Document this file!


import SwiftUI

struct AdvancedArpeggioPracticeView: View {
    var noteNames = ["C", "C♯", "D♭", "D", "D♯", "E♭", "E", "F", "F♯", "G♭", "G", "G♯", "A♭", "A", "A♯", "B♭", "B"]
    var arpeggioNames = ["MajorChord", "Minor", "Augmented", "Diminished", "Dominant Seventh", "Major Seventh", "Minor Seventh", "Minor Major Seventh", "Augmented Minor Seventh", "Half Diminished Seventh", "Diminished Seventh"]
    @State private var selectedNote = 0
    @State private var selectedArpeggio = 0
    @State var possibleArpeggios:[Arpeggio] = []
    @State var newArpeggioText:String = NSLocalizedString("No Arpeggio Selected", comment: "")
    @State var idCount:Int = 0
    @State private var alreadyAddedAlert = false
    @State private var noArpeggioAlert = false
    
    var body: some View {
        NavigationView {
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
                    RoundedRectangle(cornerRadius: 12).stroke(Color.purple, lineWidth: 1))
                    .padding()
                }
            }
                .alert(isPresented: $alreadyAddedAlert) {
                    Alert(title: Text("Arpeggio Already Selected"), dismissButton: .default(Text("Dismiss")))
                }
            .navigationBarTitle(Text("Advanced Arpeggio Practice"), displayMode: .inline)
        }
            .alert(isPresented: $noArpeggioAlert) {
                           Alert(title: Text("No Arpeggio Selected"), message: Text("Please select at least one arpeggio"), dismissButton: .default(Text("Dismiss")))
                       }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
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
    
    func removeArpeggio(at offsets: IndexSet) {
        possibleArpeggios.remove(atOffsets: offsets)
    }
    
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
}

struct AdvancedArpeggioPracticeView_Previews: PreviewProvider {
    static var previews: some View {
        AdvancedArpeggioPracticeView()
    }
}
