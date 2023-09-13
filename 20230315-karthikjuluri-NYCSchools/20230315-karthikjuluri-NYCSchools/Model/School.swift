//
//  School.swift
//  20230315-karthikjuluri-NYCSchools
//
//  Created by Karthik Juluri - Vendor on 3/15/23.
//

import Foundation

struct School: Decodable, Hashable {

    var name: String
    var city: String
    var totalStudents: String
    var dbn: String


    enum CodingKeys: String, CodingKey {
        case name = "school_name"
        case city
        case totalStudents = "total_students"
        case dbn
    }

    init(from decoder: Decoder) throws {

        let values = try decoder.container(keyedBy: CodingKeys.self)
        let name = try values.decode(String.self, forKey: .name)
        let city = try values.decode(String.self, forKey: .city)
        let totalStudents = try values.decode(String.self, forKey: .totalStudents)
        let dbn = try values.decode(String.self, forKey: .dbn)

        self.name = name
        self.city = city
        self.totalStudents = totalStudents
        self.dbn = dbn
    }
}

