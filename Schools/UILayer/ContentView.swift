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
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
            List {
                Section(header: Text("Schools")) {
                    if viewModel.schoolDataLoading {
                        ProgressView().progressViewStyle(CircularProgressViewStyle(tint: .blue))
                    } else {
                        ForEach(viewModel.schools ?? [], id: \.city) { movie in
                            SchoolCardView(schools: movie)
                        }
                    }
                }
            }.onAppear{
                viewModel.getSchools()
            }.appBar(title: "NYC School") {
                
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
