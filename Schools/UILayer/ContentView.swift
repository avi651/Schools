//
//  ContentView.swift
//  Schools
//
//  Created by Avinash Kumar on 17/07/23.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @EnvironmentObject var viewModel: SchoolViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Hello, world!")
            }
            .padding()
        }.onAppear {
            viewModel.getSchools()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
