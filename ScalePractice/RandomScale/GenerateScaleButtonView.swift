//
//  GenerateScaleButtonView.swift
//  ScalePractice
//
//  Created by Alex Burdiss on 12/22/19.
//  Copyright © 2019 Alex Burdiss. All rights reserved.
//

import SwiftUI

struct GenerateScaleButtonView: View {
    var buttonText: String
    var body: some View {
        Button(action: {
            print("HeyThere")
        }) {
            HStack {
                Spacer()
                Text(buttonText)
                    .foregroundColor(.purple)
                    .font(.title)
                    .padding()
                Spacer()
            }.border(Color.purple, width: 1)
            .padding()
        }
    }
}


struct GenerateScaleButtonView_Previews: PreviewProvider {
    static var previews: some View {
        GenerateScaleButtonView(buttonText: "Go")
    }
}
