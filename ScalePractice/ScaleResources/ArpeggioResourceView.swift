//
//  ArpeggioResourceView.swift
//  ScalePractice
//
//  Created by Alex Burdiss on 1/19/20.
//  Copyright © 2020 Alex Burdiss. All rights reserved.
//

// TODO: Document this file!

import SwiftUI

struct ArpeggioResourceView: View {
    /**
     The list of arpeggios, 
     */
    var arpeggioList = ScaleResourceModel().arpeggios
    @State var arpeggioIsPresented:Bool = false
    
    /**
     Sets show arpeggio to true, triggering the sheet to load the selected scale.
     */
    func showArpeggio() {
        arpeggioIsPresented = true
    }
    var body: some View {
        List(arpeggioList) { item in
            Button(action: self.showArpeggio) {
                Text(NSLocalizedString(item.name, comment: ""))
                    .sheet(isPresented: self.$arpeggioIsPresented) {
                        ScaleInfoView(scaleID: item.id, scaleName: NSLocalizedString(item.name, comment: ""), scaleConstruction: NSLocalizedString(item.construction, comment: ""), scaleDescription: NSLocalizedString(item.description, comment: ""), isPresented: self.$arpeggioIsPresented)
                    }
            }
        }
    .navigationBarTitle(Text("Arpeggio Resources"), displayMode: .inline)
    }
}

struct ArpeggioResourceView_Previews: PreviewProvider {
    static var previews: some View {
        ArpeggioResourceView()
    }
}
