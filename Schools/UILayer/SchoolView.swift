//
//  ContentView.swift
//  Schools
//
//  Created by Avinash Kumar on 17/07/23.
//

import SwiftUI
import Combine

struct SchoolView: View {
    
    @EnvironmentObject var viewModel: SchoolViewModel
    @State private var isNavigationBarHidden = true
    
    var body: some View {
        NavigationView {
            ZStack{
                if viewModel.schoolDataLoading {
                    ProgressView().progressViewStyle(CircularProgressViewStyle(tint: .blue))
                } else {
                    List {
                        ForEach(viewModel.schools ?? [], id: \.city)  { school in
                            ZStack(alignment: .leading) {
                                NavigationLink(destination: SchoolDetailView(schools: school)) {}
                                    .opacity(0)
                                SchoolCardView(schools: school)
                            }
                        }
                    }
                }
            }.navigationBarHidden(isNavigationBarHidden)
                .navigationBarTitle("Master")
                .onAppear {
                    self.isNavigationBarHidden = true
                }
                .onDisappear {
                    self.isNavigationBarHidden = false
                }
        }.listStyle(PlainListStyle()).onAppear{
            // To remove only extra separators below the list:
            UITableView.appearance().tableFooterView = UIView()
            // To remove all separators including the actual ones:
            UITableView.appearance().separatorStyle = .none
            viewModel.getSchools()
        }

    }

}

struct SchoolView_Previews: PreviewProvider {
    static var previews: some View {
        SchoolView()
    }
}
