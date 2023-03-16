//
//  SchoolDetails.swift
//  20230315-karthikjuluri-NYCSchools
//
//  Created by Karthik Juluri - Vendor on 3/15/23.
//

import Foundation

struct SchoolDetails: Decodable {

    let name: String?
    let numberOfTestTakers: String?
    let readingScore: String?
    let mathScore: String?
    let writingScore: String?
    let dbn: String?

    enum CodingKeys: String, CodingKey {
        case name = "school_name"
        case numberOfTestTakers = "num_of_sat_test_takers"
        case readingScore = "sat_critical_reading_avg_score"
        case mathScore = "sat_math_avg_score"
        case writingScore = "sat_writing_avg_score"
        case dbn
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let name = try values.decode(String.self, forKey: .name)
        let numberOfTestTakers = try values.decode(String.self, forKey: .numberOfTestTakers)
        let readingScore = try values.decode(String.self, forKey: .readingScore)
        let writingScore = try values.decode(String.self, forKey: .writingScore)
        let mathScore = try values.decode(String.self, forKey: .mathScore)
        let dbn = try values.decode(String.self, forKey: .dbn)

        self.name = name
        self.numberOfTestTakers = numberOfTestTakers
        self.readingScore = readingScore
        self.mathScore = mathScore
        self.writingScore = writingScore
        self.dbn = dbn
    }
}

