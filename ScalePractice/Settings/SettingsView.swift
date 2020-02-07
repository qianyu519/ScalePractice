//
//  SettingsView.swift
//  ScalePractice
//
//  Created by Alex Burdiss on 12/27/19.
//  Copyright © 2019 Alex Burdiss. All rights reserved.
//  Updated 2/2/20


import SwiftUI

/**
 The User Interface.
 */
struct SettingsView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Scale Practice")
                    .font(.title)
                    .padding(.vertical)
                Text("DesignerBlurb")
                    .padding(.bottom)
                Text("ThanksQian").padding(.bottom)
                Text("BugReportingBlurb")
                    .multilineTextAlignment(.center)
                Button(action: {
                    let url = URL(string: "mailto:aburdiss@gmail.com")!
                    UIApplication.shared.open(url)
                }) {
                    Text("Send Feedback")
                       .padding()
                    .overlay(RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.purple, lineWidth: 1))
                    .padding()
                        
                }
                Spacer()
                // Advertisement that sends users to Sheet Music Plus to buy my music.
                HStack {
                    Image("ArsNovaBookCover")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 150)
                    Button(action: {
                        let url = URL(string: "https://www.sheetmusicplus.com/publishers/ars-nova-press-sheet-music/3015236")!
                        UIApplication.shared.open(url)
                    }) {
                        VStack(alignment: .leading) {
                            Text("Ars Nova Publishing")
                                .font(.headline)
                            Text("Publishing compositions and arrangements to suit all your needs.")
                                .font(.caption)
                                .italic()
                        }
                    }
                }
                .padding(.horizontal, 40)
                
                Text("CopyrightBlurb").padding(.bottom)
            }.padding(.horizontal)
        .navigationBarTitle(Text("Settings"), displayMode: .inline)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
