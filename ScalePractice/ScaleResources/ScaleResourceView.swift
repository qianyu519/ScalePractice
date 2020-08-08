//
//  ScaleResourceView.swift
//  ScalePractice
//
//  Created by Alex Burdiss on 12/27/19.
//  Copyright © 2020 Alex Burdiss. All rights reserved.

import SwiftUI

/**
 List view that shows all of the possible scale types. Functionality for opening and closing the details sheet for each scale is also contained in this view. 
 */
struct ScaleResourceView: View {
    /**
     Scales model, containing all of the data about the scales.
     */
    @EnvironmentObject var scalesModel: ScaleResourceModel

    /**
     Boolean variable that determines whether the scale sheet should be shown.
     */
    @State var scaleIsPresented: Bool = false
    
    /**
     The user interface for this portion of the app. 
     */
    var body: some View {
        NavigationView {
            List(scalesModel.scales) { item in
                Button(action: {
                    self.scaleIsPresented.toggle()
                }) {
                    Text(NSLocalizedString(item.name, comment: ""))
                        .sheet(isPresented: self.$scaleIsPresented){
                            ScaleInfoView(scaleID: item.id, scaleName: NSLocalizedString(item.name, comment: ""), scaleConstruction: NSLocalizedString(item.construction, comment: ""), scaleDescription: NSLocalizedString(item.description, comment: ""), isPresented: self.$scaleIsPresented)
                        }
                    }
                }
            .navigationBarTitle(Text("Scale Resources"), displayMode: .inline)
                .navigationBarItems(trailing: NavigationLink(destination: ArpeggioResourceView()) {
                Text("Arpeggios")
                .padding()
            })
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ScaleResourceView_Previews: PreviewProvider {
    static var previews: some View {
        ScaleResourceView().environmentObject(ScaleResourceModel())
    }
}
