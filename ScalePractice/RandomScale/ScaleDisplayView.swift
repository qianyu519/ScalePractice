//
//  ScaleDisplayView.swift
//  ScalePractice
//
//  Created by Alex Burdiss on 12/21/19.
//  Copyright © 2020 Alex Burdiss. All rights reserved.

import SwiftUI

/**
 The view that displays a scale inside a rounded rectangle with padding
 */
struct ScaleDisplayView: View {
    /**
     The text to display in the view
     */
    var newScaleText: String
    
    /**
     The Interface that shows the scale inside a rounded grey rectangle
     */
    var body: some View {
        HStack {
            Spacer()
            Text(newScaleText)
                .frame(height: 60, alignment: .center)
            Spacer()
        }
        .background(Color(UIColor.systemGray4))
        .cornerRadius(12)
        .padding(.horizontal)
    }
}

struct ScaleDisplayView_Previews: PreviewProvider {
    static var previews: some View {
        ScaleDisplayView(newScaleText: "No Scales Selected")
    }
}
