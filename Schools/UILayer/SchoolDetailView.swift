//
//  SchoolDetailView.swift
//  Schools
//
//  Created by Avinash Kumar on 18/07/23.
//

import SwiftUI

struct SchoolDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    var schools: School
    var body: some View {
        NavigationView {
            VStack {
               Text("School Details")
                HStack() {
                    VStack(alignment: .leading) {
                        Text(schools.schoolName ?? "-").foregroundColor(.white)
                        Spacer()
                        Text(schools.city ?? "-").foregroundColor(.white)
                        Spacer()
                        Text(schools.schoolEmail ?? "-").foregroundColor(.white)
                    }.padding(EdgeInsets(top: 10, leading: 25, bottom: 10, trailing: 25)).frame(
                        minWidth: 0,
                        maxWidth: .infinity,
                        minHeight: 0,
                        maxHeight: 100,
                        alignment: .topLeading
                      )
                    Spacer()
                    
                }.background(RoundedRectangle(cornerRadius: 4, style: .circular).stroke(Color(uiColor: .tertiaryLabel), lineWidth: 1).padding(.leading, 16)
                    .padding(.trailing, 16))
                    .cornerRadius(5)
                    .shadow(color: .gray, radius: 3, x: 2, y: 2)
            }
        }.navigationBarTitle(Text(schools.schoolName ?? ""), displayMode: .inline)
            .edgesIgnoringSafeArea(.bottom)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "chevron.backward")
            })
    }
}

//struct SchoolDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        SchoolDetailView()
//    }
//}
