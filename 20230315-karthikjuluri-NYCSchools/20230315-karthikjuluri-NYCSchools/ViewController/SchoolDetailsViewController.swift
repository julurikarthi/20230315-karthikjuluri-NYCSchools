//
//  SchoolDetailsViewController.swift
//  20230315-karthikjuluri-NYCSchools
//
//  Created by Karthik Juluri - Vendor on 3/15/23.
//

import UIKit

class SchoolDetailsViewController: UIViewController {

    @IBOutlet weak var readingLabel: UILabel!
    @IBOutlet weak var writingLabel: UILabel!
    @IBOutlet weak var mathLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var averagesTitleLabel: UILabel!
    @IBOutlet weak var averageWritingLabel: UILabel!
    @IBOutlet weak var averageMathLabel: UILabel!
    @IBOutlet weak var averageReadingLabel: UILabel!

    var schoolDetails: SchoolDetails?
    var dbn = String()

    static let shared = SchoolDetailsViewController()
    lazy var viewModel = SchoolDetailsViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        searchForSchoolDetails(str: dbn)
    }

    func searchForSchoolDetails(str: String) {
        viewModel.getSchoolDetails(dbn: dbn) { schoolDetiails in
            self.schoolDetails = schoolDetiails
            self.updateLabels()
        }

    }

    /// update Lables
    func updateLabels() {

        guard let schoolDetails = schoolDetails else {
            return }
        if let writingScore = schoolDetails.writingScore,
            let mathScore = schoolDetails.mathScore,
            let readingScore = schoolDetails.readingScore {
            let overallWritingAverage = viewModel.returnAverage(ofCurrentSchool: writingScore, againstOverallAverage: viewModel.writingAverage, typeOfScore: "Writing")
            let overallMathAverage = viewModel.returnAverage(ofCurrentSchool: mathScore, againstOverallAverage: viewModel.mathAverage, typeOfScore: "Math")
            let overallReadingAverage = viewModel.returnAverage(ofCurrentSchool: readingScore, againstOverallAverage: viewModel.readingAverage, typeOfScore: "Reading")
            DispatchQueue.main.async {
                self.readingLabel.text = "Reading Average SAT Score: \(readingScore)"
                self.writingLabel.text = "Writing Average SAT Score: \(writingScore)"
                self.mathLabel.text = "Math Average SAT Score: \(mathScore)"
                self.nameLabel.text = schoolDetails.name?.capitalized
                self.averagesTitleLabel.text = "Avarage Title Label"
                self.averageWritingLabel.text = "\(overallWritingAverage)"
                self.averageMathLabel.text = "\(overallMathAverage)"
                self.averageReadingLabel.text = "\(overallReadingAverage)"
            }
        }


    }

}
