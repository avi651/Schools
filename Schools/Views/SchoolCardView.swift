//
//  SchoolCardView.swift
//  Schools
//
//  Created by Avinash Kumar on 17/07/23.
//

import SwiftUI

struct SchoolCardView: View {
    var schools: School
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(schools.schoolName ?? "-").foregroundColor(.white)
                Spacer()
                Text(schools.city ?? "-").foregroundColor(.white)
                Spacer()
                Text(schools.schoolEmail ?? "-").foregroundColor(.white)
            }
            Spacer()
            
        }.padding()
            .background(RoundedRectangle(cornerRadius: 4, style: .circular).stroke(Color(uiColor: .tertiaryLabel), lineWidth: 1))
            .cornerRadius(5)
            .shadow(color: .gray, radius: 3, x: 2, y: 2)
    }
}



//Text(schools.city ?? "").foregroundColor(.white)
//Text(schools.city ?? "").foregroundColor(.white)

//struct SchoolCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        SchoolCardView(schools: <#School#>)
//    }
//}
