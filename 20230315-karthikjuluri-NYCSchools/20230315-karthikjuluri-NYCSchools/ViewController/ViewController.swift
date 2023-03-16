//
//  ViewController.swift
//  20230315-karthikjuluri-NYCSchools
//
//  Created by Karthik Juluri - Vendor on 3/15/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    //
    // MARK: - Variables
    //

    var schools = [School]()

    //
    // MARK: - Outlets
    //

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activitySpinner: UIActivityIndicatorView!

    //
    // MARK: - View Lifecycle
    //

    override func viewDidLoad() {
        super.viewDidLoad()
        showEmptyStateView()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        NetWorkManager.sharedInstance.fetchSchools { school, error in
            DispatchQueue.main.async {
                self.schools = school
                self.tableView.reloadData()
                self.showTableView()
            }
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "New York Schools"
    }

    //
    // MARK: - TableView
    //

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schools.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "schoolCell", for: indexPath) as? SchoolTableViewCell ?? SchoolTableViewCell()
        let school = schools[indexPath.row]
        cell.school = school
        formatTableView(andCell: cell)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc: SchoolDetailsViewController = self.storyboard?.instantiateViewController(withIdentifier: "SchoolDetailsVC") as? SchoolDetailsViewController {
            let school = schools[indexPath.row]
            vc.dbn = school.dbn
            self.navigationItem.title = ""
            self.navigationController?.pushViewController(vc, animated: true)
            self.tableView.deselectRow(at: indexPath, animated: true)

        }
    }

    //
    // MARK: - Methods
    //

    func showEmptyStateView() {
        self.tableView.isHidden = true
        self.activitySpinner.isHidden = false
        self.activitySpinner.startAnimating()
    }

    func showTableView() {
        self.tableView.isHidden = false
        self.activitySpinner.isHidden = true
        self.activitySpinner.stopAnimating()
    }

    func formatTableView(andCell cell: SchoolTableViewCell) {
        self.tableView.backgroundColor = .gray
        cell.backgroundView?.alpha = 0.5
        cell.cityLabel.textColor = .black
        cell.nameLabel.textColor = .black
        cell.totalStudentsLabel.textColor = .black
    }

}
