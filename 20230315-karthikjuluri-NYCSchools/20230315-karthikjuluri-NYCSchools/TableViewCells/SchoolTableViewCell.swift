//
//  SchoolTableViewCell.swift
//  20230315-karthikjuluri-NYCSchools
//
//  Created by Karthik Juluri - Vendor on 3/15/23.
//

import UIKit

class SchoolTableViewCell: UITableViewCell {

    var school: School? {
        didSet {
            DispatchQueue.main.async {
                self.updateCell()
            }
        }
    }

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var totalStudentsLabel: UILabel!

    func updateCell() {

        guard let school = school else { return }

        nameLabel.text = school.name
        cityLabel.text = school.city
        totalStudentsLabel.text = "Total Number Students: \(school.totalStudents)"
    }
}
