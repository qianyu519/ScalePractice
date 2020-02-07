//
//  ScaleResourceView.swift
//  ScalePractice
//
//  Created by Alex Burdiss on 12/27/19.
//  Copyright © 2019 Alex Burdiss. All rights reserved.
//

// TODO: Document this file!


import SwiftUI

struct ScaleResourceView: View {
    var scaleResourceModel:ScaleResourceModel
    var scaleList = ScaleResourceModel().scales
    @State var scaleIsPresented: Bool = false
    
    func showScale(){
        scaleIsPresented = true
    }
    
    var body: some View {
        NavigationView {
            List(scaleList) { item in
                Button(action: self.showScale){
                    Text(NSLocalizedString(item.name, comment: ""))
                        .sheet(isPresented: self.$scaleIsPresented){
                            ScaleInfoView(scaleID: item.id, scaleName: NSLocalizedString(item.name, comment: ""), scaleConstruction: NSLocalizedString(item.construction, comment: ""), scaleDescription: NSLocalizedString(item.description, comment: ""), isPresented: self.$scaleIsPresented)
                        }
                    }
                }
            .navigationBarTitle(Text("Scale Resources"), displayMode: .inline)
                .navigationBarItems(trailing: NavigationLink(destination: ArpeggioResourceView(scaleResourceModel: scaleResourceModel)) {
                Text("Arpeggios")
                .padding()
            })
            
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ScaleResourceView_Previews: PreviewProvider {
    static var previews: some View {
        ScaleResourceView(scaleResourceModel:ScaleResourceModel())
    }
}
