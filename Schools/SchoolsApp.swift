//
//  SchoolsApp.swift
//  Schools
//
//  Created by Avinash Kumar on 17/07/23.
//

import SwiftUI

@main
struct SchoolsApp: App {
    
    let viewModel = SchoolViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                SchoolView().environmentObject(viewModel)
            }
        }
    }
}
