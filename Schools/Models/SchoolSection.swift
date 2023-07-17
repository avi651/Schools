//
//  SchoolSection.swift
//  Schools
//
//  Created by Avinash Kumar on 17/07/23.
//

import Foundation

/// Model to represent school section in the collection view of schools
/// displayed to the user. The goal of the school section is to group school
struct SchoolSection {
    let city: String
    var schools: [School]
}

