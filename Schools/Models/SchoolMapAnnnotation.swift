//
//  SchoolMapAnnnotation.swift
//  Schools
//
//  Created by Avinash Kumar on 17/07/23.
//

import Foundation
import MapKit

class SchoolMapAnnotation: NSObject, MKAnnotation {
    var title: String?
    var coordinate: CLLocationCoordinate2D
    var subtitle: String?

    init(title: String,
         coordinate: CLLocationCoordinate2D,
         subtitle: String) {
        self.title = title
        self.coordinate = coordinate
        self.subtitle = subtitle
    }
}
