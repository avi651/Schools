//
//  SchoolDetailViewModel.swift
//  Schools
//
//  Created by Avinash Kumar on 17/07/23.
//

import Foundation

class SchoolDetailsViewModel {
    private(set) var school: School
    private(set) var schoolSAT: SchoolSAT
    
    init(school: School, schoolSAT: SchoolSAT) {
        self.school = school
        self.schoolSAT = schoolSAT
    }
}

