//
//  ScaleInfoView.swift
//  ScalePractice
//
//  Created by Alex Burdiss on 1/16/20.
//  Copyright © 2020 Alex Burdiss. All rights reserved.
/*  Updated 2/2/20 - Fixed The iPhone X bug. Made the horizontal margin better. Implemented a navigation bar title to make the app better show on more devices */

// TODO: Document this file!


import SwiftUI

struct ScaleInfoView: View {
    var scaleID: Int
    var scaleName: String
    var scaleConstruction: String
    var scaleDescription: String
    @Binding var isPresented:Bool
    
    
    
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
    }
}

struct ScaleInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ScaleInfoView(scaleID: 0, scaleName: "Major", scaleConstruction: "W W H W W W H", scaleDescription: "Major Scale", isPresented: .constant(true))
    }
}
