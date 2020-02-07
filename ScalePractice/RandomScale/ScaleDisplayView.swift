//
//  ScaleDisplayView.swift
//  ScalePractice
//
//  Created by Alex Burdiss on 12/21/19.
//  Copyright © 2019 Alex Burdiss. All rights reserved.
//

// TODO: Document this file!

import SwiftUI

struct ScaleDisplayView: View {
    var newScaleText: String
    var body: some View {
        Text(newScaleText)
            .padding(.all)
            .frame(width: 350, height: 60, alignment: .center)
            .background(Color(UIColor.systemGray4))
        .cornerRadius(12)
    }
}

struct ScaleDisplayView_Previews: PreviewProvider {
    static var previews: some View {
        ScaleDisplayView(newScaleText: "No Scales Selected")
    }
}
