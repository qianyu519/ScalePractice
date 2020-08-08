//
//  ScaleResourceModel.swift
//  ScalePractice
//
//  Created by Alex Burdiss on 1/15/20.
//  Copyright © 2020 Alex Burdiss. All rights reserved.

import Foundation

/**
 An object that holds information about one scale
 */
struct Scale:Identifiable {
    var id:Int
    var name:String
    var construction:String
    var description:String
}

/**
 An object that holds information about one arpeggio
 */
struct Arpeggio:Identifiable {
    var id:Int
    var name:String
    var construction:String
    var description:String
}

/**
 The data collection for the app, defining and aggregating all of the scales and arpeggios for the resource view.
 */
class ScaleResourceModel:ObservableObject {
    /**
     An aggregation of all of the scales used in the app.
     */
    var scales:[Scale] = [
        Scale(id: 0, name: "Major", construction: "W W H W W W H", description: "MajorScaleDescription"),
        Scale(id: 1, name: "Natural Minor", construction: "W H W W H W W", description: "NaturalMinorScaleDescription"),
        Scale(id: 2, name: "Harmonic Minor", construction: "W H W W H W+H H", description: "HarmonicMinorScaleDescription"),
        Scale(id: 3, name: "Melodic Minor", construction: "MelodicMinorScaleConstruction", description: "MelodicMinorScaleDescription"),
        Scale(id: 4, name: "Ionian", construction: "W W H W W W H", description: "IonianScaleDescription"),
        Scale(id: 5, name: "Dorian", construction: "W H W W W H W", description: "DorianScaleDescription"),
        Scale(id: 6, name: "Phrygian", construction: "H W W W H W W", description: "PhrygianScaleDescription"),
        Scale(id: 7, name: "Lydian", construction: "W W W H W W H", description: "LydianScaleDescription"),
        Scale(id: 8, name: "Mixolydian", construction: "W W H W W H W", description: "MixolydianScaleDescription"),
        Scale(id: 9, name: "Aeolian", construction: "W H W W H W W", description: "AeolianScaleDescription"),
        Scale(id: 10, name: "Locrian", construction: "H W W H W W W", description: "LocrianScaleDescription"),
        Scale(id: 11, name: "Minor Major", construction: "W H W W W W H", description: "MinorMajorScaleDescription"),
        Scale(id: 12, name: "Dorian ♭2", construction: "H W W W W H W", description: "DorianFlat2ScaleDescription"),
        Scale(id: 13, name: "Lydian Augmented", construction: "W W W W H W H", description: "LydianAugmentedScaleDescription"),
        Scale(id: 14, name: "Lydian Dominant", construction: "W W W H W H W", description: "LydianDominantScaleDescription"),
        Scale(id: 15, name: "Mixolydian ♭6", construction: "W W H W H W W", description: "MixolydianFlatSixScaleDescription"),
        Scale(id: 16, name: "Locrian ♮2", construction: "W H W H W W W", description: "LocrianNaturalTwoScaleDescription"),
        Scale(id: 17, name: "Altered Scale", construction: "H W H W W W W", description: "AlteredScaleDescription"),
        Scale(id: 18, name: "Blues", construction: "W+H W H H W+H W", description: "BluesScaleDescription"),
        Scale(id: 19, name: "Major Pentatonic", construction: "W W W+H W W+H", description: "MajorPentatonicScaleDescription"),
        Scale(id: 20, name: "Minor Pentatonic", construction: "W+H W W W+H W", description: "MinorPentatonicScaleDescription"),
        Scale(id: 21, name: "Whole-Half Octatonic", construction: "W H W H W H W H", description: "WholeHalfOctatonicScaleDescription"),
        Scale(id: 22, name: "Half-Whole Octatonic", construction: "H W H W H W H W", description: "HalfWholeOctatonicScaleDescription"),
        Scale(id: 23, name: "Whole Tone", construction: "W W W W W W", description: "WholeToneScaleDescription")
    ]
    
    /**
     An aggregation of all of the arpeggios used in the app.
     */
    var arpeggios:[Arpeggio] = [
        Arpeggio(id: 24, name: "MajorChord", construction: "M3 m3", description: "MajorArpeggioDescription"),
        Arpeggio(id: 25, name: "Minor", construction: "m3 M3", description: "MinorArpeggioDescription"),
        Arpeggio(id: 26, name: "Augmented", construction: "M3 M3", description: "AugmentedArpeggioDescription"),
        Arpeggio(id: 27, name: "Diminished", construction: "m3 m3", description: "DiminishedArpeggioDescription"),
        Arpeggio(id: 28, name: "Dominant Seventh", construction: "M3 m3 m3", description: "DominantSeventhArpeggioDescription"),
        Arpeggio(id: 29, name: "Major Seventh", construction: "M3 m3 M3", description: "MajorSeventhArpeggioDescription"),
        Arpeggio(id: 30, name: "Minor Seventh", construction: "m3 M3 m3", description: "MinorSeventhArpeggioDescription"),
        Arpeggio(id: 31, name: "Minor Major Seventh", construction: "m3 M3 M3", description: "MinorMajorSeventhArpeggioDescription"),
        Arpeggio(id: 32, name: "Augmented Minor Seventh", construction: "M3 M3 d3", description: "AugmentedSeventhArpeggioDescription"),
        Arpeggio(id: 33, name: "Half Diminished Seventh", construction: "m3 m3 M3", description: "HalfDiminishedSeventhArpeggioDescription"),
        Arpeggio(id: 34, name: "Diminished Seventh", construction: "m3 m3 m3", description: "DiminishedSeventhArpeggioDescription")
    ]
}
