//
//  SchoolDetailsViewModel.swift
//  20230315-karthikjuluri-NYCSchools
//
//  Created by Karthik Juluri - Vendor on 3/16/23.
//

import UIKit

class SchoolDetailsViewModel: NSObject {

    var readingAverage = Int()
    var mathAverage = Int()
    var writingAverage = Int()


    func getSchoolDetails(dbn: String, completionHandler: @escaping (SchoolDetails) -> Void) {
        NetWorkManager.sharedInstance.fetchSchoolDetails { schooldetails in
            for i in schooldetails {
                if i.dbn == dbn && i.mathScore != "" && i.readingScore != "" && i.writingScore != "" {
                    completionHandler(i)
                }
            }
        }
    }

    /// This function will determine if a school is above, at or below average for scores passed in
    func returnAverage(ofCurrentSchool a: String, againstOverallAverage overallAverage: Int, typeOfScore type: String) -> String {

        guard let schoolAverage = Int(a) else { return String() }

        if schoolAverage < overallAverage {
            return "\(type): \(a) is below the average of \(overallAverage)"
        } else if schoolAverage > overallAverage {
            return "\(type): \(a) is above the average of \(overallAverage)"
        } else if schoolAverage == overallAverage {
            return "\(type): \(a) is equal to the average of \(overallAverage)"
        } else {
            return "Insufficient Data"
        }
    }

    /// This function calculates the average reading, writing and math SAT scores.
    func calculateAverageScores(schooldetails: [SchoolDetails]) {

        var totalReading = 0
        var totalWriting = 0
        var totalMath = 0
        let numberOfSchools = schooldetails.count

        for i in schooldetails {
            totalReading += Int(i.readingScore ?? "0") ?? 0
            totalWriting += Int(i.writingScore ?? "0") ?? 0
            totalMath += Int(i.mathScore ?? "0") ?? 0
        }

        self.readingAverage = totalReading/numberOfSchools
        self.writingAverage = totalWriting/numberOfSchools
        self.mathAverage = totalMath/numberOfSchools
    }
}
