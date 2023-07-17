//
//  SchoolsViewModel.swift
//  Schools
//
//  Created by Avinash Kumar on 17/07/23.
//

import Foundation
import Network
import Combine

class SchoolViewModel: ObservableObject {
    
    private var networkConnectivity = NWPathMonitor()
    @Published private(set) var schools: [School]?
    @Published var schoolSATs: [SchoolSAT]?
    @Published private(set) var error: DataError? = nil
    
    private(set) var schoolSectionsList: [SchoolSection]?
    private(set) var schoolSATDictionary: [String: SchoolSAT] = [:]
    
    private let apiService: SchoolAPIProtocol
    
    init(apiService: SchoolAPIProtocol = SchoolAPI()) {
        self.apiService = apiService
        networkConnectivity.start(queue: DispatchQueue.global(qos: .userInitiated))
    }
    
    
    func getSchools() {
        switch networkConnectivity.currentPath.status {
        case .satisfied:
            apiService.getSchools { [weak self] result in
                switch result {
                case .success(let schools): self?.schools = schools ?? []
                    if schools?.isEmpty == false {
                        self?.prepareSchoolSections()
                    }
                case .failure(let error):
                    self?.error = error
                }
            }
        default:
            print("No Internet Connection")
        }
    }
    
    private func prepareSchoolSections() {
        var listOfSections = [SchoolSection]()
        var schoolDictionary = [String: SchoolSection]()
        
        guard let schools = schools else {
            return
        }
        
        for school in schools {
            if let city = school.city {
                if schoolDictionary[city] != nil {
                    schoolDictionary[city]?.schools.append(school)
                } else {
                    var newSection = SchoolSection(city: city,
                                                   schools: [])
                    newSection.schools.append(school)
                    schoolDictionary[city] = newSection
                }
            }
        }
        
        listOfSections = Array(schoolDictionary.values)
        listOfSections.sort {
            return $0.city < $1.city
        }
        schoolSectionsList = listOfSections
    }
    
}
