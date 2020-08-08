//
//  SettingsView.swift
//  ScalePractice
//
//  Created by Alex Burdiss on 12/27/19.
//  Copyright © 2020 Alex Burdiss. All rights reserved.

import SwiftUI

/**
 The User Interface.
 */
struct SettingsView: View {
    /**
     The user interface.
     */
    var body: some View {
        NavigationView {
            List {                
                Section(header: Text("Resources")) {
                    Button(action: {
                        let url = URL(string: "http://www.arsnovapublishing.com")!
                        UIApplication.shared.open(url)
                    }) {
                        HStack {
                            Text("Visit Ars Nova Publishing")
                            Spacer()
                            Image(systemName: "chevron.right")
                        }
                    }
                    Button(action: {
                        let url = URL(string:
                            "https://www.bandroomonline.com")!
                        UIApplication.shared.open(url)
                    }) {
                        HStack {
                            Text("Visit Band Room Online")
                            Spacer()
                            Image(systemName: "chevron.right")
                        }
                    }
                }
                Section(header: Text("About")) {
                    Text("© 2020 Alexander Burdiss")
                    Text("Special Thanks to Qian Yu")
                    Button(action: {
                    let url = URL(string: "mailto:aburdiss@gmail.com")!
                        UIApplication.shared.open(url)
                    }) {
                        HStack {
                            Text("Send Feedback")
                            Spacer()
                            Image(systemName: "chevron.right")
                        }
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("More")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
