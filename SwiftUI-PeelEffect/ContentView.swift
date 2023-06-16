//
//  ContentView.swift
//  SwiftUI-PeelEffect
//
//  Created by Jay on 15/06/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStack {
                Home()
                    .navigationTitle("Animals")
            }
        } else {
            // Fallback on earlier versions
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
