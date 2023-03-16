//
//  SchoolDetailsViewModelMock.swift
//  20230315-karthikjuluri-NYCSchoolsTests
//
//  Created by Karthik Juluri - Vendor on 3/16/23.
//

import UIKit
@testable import _0230315_karthikjuluri_NYCSchools

class SchoolDetailsViewModelMock: SchoolDetailsViewModel {

    override func getSchoolDetails(dbn: String, completionHandler: @escaping (SchoolDetails) -> Void) {
        completionHandler(SchoolDetails(name: "test", numberOfTestTakers: "testdata", readingScore: "32", mathScore: "43", writingScore: "43", dbn: "er"))
    }
    
}
