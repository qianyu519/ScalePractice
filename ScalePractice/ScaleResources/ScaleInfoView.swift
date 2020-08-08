//
//  ScaleInfoView.swift
//  ScalePractice
//
//  Created by Alex Burdiss on 1/16/20.
//  Copyright © 2020 Alex Burdiss. All rights reserved.

import SwiftUI

/**
 A view used in a sheet to show detailed informaiton about any scale or arpeggio in the app.
 */
struct ScaleInfoView: View {
    /**
     The ID of the scale or arpeggio being displayed
     */
    var scaleID: Int
    
    /**
     The Name of the scale or arpeggio being displayed
     */
    var scaleName: String
    
    /**
     The Construction of the scale or arpeggio being displayed
     */
    var scaleConstruction: String
    
    /**
     The Description of the scale or arpeggio being displayed
     */
    var scaleDescription: String
    
    /**
     Binding variable that when set to false closes the current sheet.
     */
    @Binding var isPresented:Bool
    
    /**
     The User Interface
     */
    var body: some View {
        NavigationView {
            VStack {
                Divider()
                    .background(Color.purple)
                Image("\(scaleID)")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 400, height: 100)
                Text(scaleConstruction)
                    .padding()
                Text(scaleDescription)
                    .padding()
                Spacer()
            }
            
            .navigationBarTitle(scaleName)
            .navigationBarItems(trailing:
                Button(action: {
                    self.isPresented = false
                }) {
                    Image(systemName: "chevron.down")
                })
        }
    .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ScaleInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ScaleInfoView(scaleID: 0, scaleName: "Major", scaleConstruction: "W W H W W W H", scaleDescription: "Major Scale", isPresented: .constant(true))
    }
}
