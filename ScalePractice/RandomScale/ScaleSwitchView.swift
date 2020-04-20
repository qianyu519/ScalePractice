//
//  ScaleSwitchView.swift
//  ScalePractice
//
//  Created by Alex Burdiss on 12/21/19.
//  Copyright © 2019 Alex Burdiss. All rights reserved.
//

import SwiftUI

struct ScaleSwitchView: View {
    @State var majorSwitch = true
    @State var naturalMinorSwitch = false
    @State var harmonicMinorSwitch = false
    @State var melodicMinorSwitch = false
    @State var majorModesSwitch = false
    @State var melodicMinorModesSwitch = false
    @State var bluesSwitch = false
    @State var pentatonicSwitch = false
    @State var octatonicSwitch = false
    @State var wholeToneSwitch = false
    
    var body: some View {
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
    }
}

struct ScaleSwitchView_Previews: PreviewProvider {
    static var previews: some View {
        ScaleSwitchView()
    }
}


