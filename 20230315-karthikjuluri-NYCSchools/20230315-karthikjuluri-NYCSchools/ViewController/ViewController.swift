//
//  ViewController.swift
//  20230315-karthikjuluri-NYCSchools
//
//  Created by Karthik Juluri - Vendor on 3/15/23.
//

import UIKit
import SwiftUI
import Combine

class ViewController: UIViewController {

    var schools = [School]()
    var currenvalueSubject = PassthroughSubject<School, Never>()
    var store = Set<AnyCancellable>()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let hostingController = UIHostingController(rootView: SwiftUIViewController(currentValuesubject: currenvalueSubject))
        navigationController?.pushViewController(hostingController, animated: true)
        navigationController?.navigationBar.backItem?.hidesBackButton = true

        currenvalueSubject.sink { never in

        } receiveValue: { schol in
            let hostingController = UIHostingController(rootView: SwiftUISchollDetials(school: schol))
            self.navigationController?.pushViewController(hostingController, animated: true)
        }.store(in: &store)

    }

}
