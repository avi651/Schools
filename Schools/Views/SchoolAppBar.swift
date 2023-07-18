//
//  SchoolAppBar.swift
//  Schools
//
//  Created by Avinash Kumar on 17/07/23.
//

import SwiftUI

extension View {
    /// CommonAppBar
    public func appBar(title: String, backButtonAction: @escaping() -> Void) -> some View {

        self
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: Button(action: {
                backButtonAction()
            }) {
                Image("ic-back") // set backbutton image here
                    .renderingMode(.template)
                    .foregroundColor(Color.gray)
            })
    }
}

struct HiddenNavigationBar: ViewModifier {
    func body(content: Content) -> some View {
        content
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(true)
    }
}

extension View {
    func hiddenNavigationBarStyle() -> some View {
        modifier( HiddenNavigationBar() )
    }
}
