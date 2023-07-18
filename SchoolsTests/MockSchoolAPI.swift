//
//  MockSchoolAPI.swift
//  SchoolsTests
//
//  Created by Avinash Kumar on 18/07/23.
//

import XCTest
import Foundation
@testable import Schools

final class MockSchoolAPI: XCTestCase, SchoolAPIProtocol {
    
    var loadState: SchoolListLoadState = .empty
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func getSchoolSATResults(completion: @escaping (Schools.SchoolsSATAPIResponse)) {
        switch loadState {
          case .error:
            completion(.failure(.networkingError("Could not fetch SAT schools")))
          case .loaded:
            let mockSchool = SchoolSAT(dbn: "02M260",
                                    schoolName: "Clinton School Writers & Artists, M.S. 260",
                                       numberOfSATTestTakers: "Students who are prepared for college must have an education that encourages them to take...",
                                       criticalReadingAVGScore: "admissions@theclintonschool.net",
                                       mathAVGScore: "Free college courses at neighboring universities",
                                       writingAVGScore: "International Travel, Special Arts Programs, Music, Internships, College Mentoring English Language Learner Programs: English as a New Language"
                                   )
            completion(.success([mockSchool]))
          case .empty:
            completion(.success([]))
        }
    }
 
    func getSchools(completion: @escaping (Schools.SchoolListAPIResponse)) {
        switch loadState {
        case .error:
            completion(.failure(.networkingError("Could not fetch schools")))
        case .loaded:
            let mockSchool = School(dbn: "02M260",
                                    schoolName: "Clinton School Writers & Artists, M.S. 260",
                                    overviewParagraph: "Students who are prepared for college must have an education that encourages them to take...",
                                    schoolEmail: "admissions@theclintonschool.net",
                                    academicOpportunities1: "Free college courses at neighboring universities",
                                    academicOpportunities2: "International Travel, Special Arts Programs, Music, Internships, College Mentoring English Language Learner Programs: English as a New Language",
                                    neighborhood: "Chelsea-Union Sq",
                                    phoneNumber: "212-524-4360",
                                    website: "www.theclintonschool.net",
                                    finalGrades: "6-12",
                                    totalStudents: "376",
                                    schoolSports: "Cross Country, Track and Field, Soccer, Flag Football, Basketball",
                                    primaryAddressLine: "10 East 15th Street",
                                    city: "Manhattan",
                                    zip: "10003",
                                    latitude: "40.73653",
                                    longitude: "-73.9927")
            completion(.success([mockSchool]))
        case .empty:
            completion(.success([]))
        }
    }
}
