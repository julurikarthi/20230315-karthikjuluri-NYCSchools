//
//  NetWorkManager.swift
//  20230315-karthikjuluri-NYCSchools
//
//  Created by Karthik Juluri - Vendor on 3/15/23.
//

import UIKit

class NetWorkManager: NSObject {

    static let sharedInstance = NetWorkManager()


    func getRequest(url: String, completionHandler: @escaping (_ responce: Data?, Error?) -> Void) {
        // URL: I like to put #file and #function into my guard statements so that if it returns early, I know what is wrong with my functions and can debug easier.
        guard let url = URL(string: url) else {
            completionHandler(nil, NSError(domain: "invalidURL", code: 404))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) -> Void in
            if let data = data {completionHandler(data, nil)
                print(String(data: data, encoding: .utf8)!)
                completionHandler(data, nil)
            } else {
                completionHandler(nil,error)
            }

        }
        dataTask.resume()
    }

    func fetchSchools(completion: @escaping (_ school: [School], Error?) -> Void) {
        getRequest(url: "https://data.cityofnewyork.us/resource/97mf-9njv.json") { responce, error in
            if let data = responce {
                do {
                    let decoder = JSONDecoder()
                    let schoolsArray = try decoder.decode([School].self, from: data)
                    completion(schoolsArray, nil)
                } catch {
                    print("\(error.localizedDescription)")
                    completion([],error)
                }
            } else {
                completion([],error)
            }
        }
    }

    func fetchSchoolDetails(completion: @escaping (_ schoolDetails: [SchoolDetails]) -> Void) {

        getRequest(url: "https://data.cityofnewyork.us/resource/734v-jeq5.json") { responce, error in
            guard let data = responce else {
                completion([])
                return
            }

            do {
                let decoder = JSONDecoder()
                let schoolDetailsArray = try decoder.decode([SchoolDetails].self, from: data)
                completion(schoolDetailsArray)
            } catch {
                completion([])
            }
        }
    }
    
}
