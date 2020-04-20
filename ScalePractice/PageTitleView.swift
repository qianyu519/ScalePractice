//
//  PageTitleView.swift
//  ScalePractice
//
//  Created by Alex Burdiss on 12/21/19.
//  Copyright © 2019 Alex Burdiss. All rights reserved.
//

import SwiftUI

struct PageTitleView: View {
    var title: String
    var body: some View {
        Text(title)
            .font(.largeTitle)
            .padding()
            .background(Color.purple)
            .clipShape(Capsule())
            .padding()
    }
    
}

struct PageTitleView_Previews: PreviewProvider {
    static var previews: some View {
        PageTitleView(title: "Random Scale Practice")
    }
}
