//
//  RootTabView.swift
//  ScalePractice
//
//  Created by Alex Burdiss on 12/27/19.
//  Copyright © 2019 Alex Burdiss. All rights reserved.
//  Updated 2/2/20

import SwiftUI

/**
 The main view for the app. This view is always running, and other views run inside it.
 */
struct RootTabView: View {
    /**
     The Main User Interface.
     */
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Image(systemName: "cube")
                    Text("Random")
            }
            ScaleResourceView()
                .tabItem {
                    Image(systemName: "book")
                    Text("Resources")
            }
            AdvancedScalePracticeView()
                .tabItem {
                    Image(systemName: "pencil")
                    Text("Advanced")
            }
            SettingsView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
            }
        }
        .environmentObject(ScaleResourceModel())
        .accentColor(Color.purple)
    }
}

struct RootTabView_Previews: PreviewProvider {
    static var previews: some View {
        RootTabView()
    }
}
