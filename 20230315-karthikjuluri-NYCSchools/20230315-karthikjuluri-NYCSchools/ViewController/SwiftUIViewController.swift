//
//  SwiftUIViewController.swift
//  20230315-karthikjuluri-NYCSchools
//
//  Created by Karthik Juluri - Vendor on 9/13/23.
//

import SwiftUI
import Combine
struct SwiftUIViewController: View {
    @State var schools: [School] = []
    @State var navigateToDetails:Bool = false
    @State var school: School?
    var currentValuesubject: PassthroughSubject<School, Never>?
    var body: some View {
        NavigationView {
            VStack {
                if schools.count == 0 {
                    ProgressView().frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                List {
                    ForEach(schools, id: \.self) { school in
                        TableViewCell(schoolName: school.name, schooplace: school.city, totalStudents: school.totalStudents).onTapGesture {
                            self.navigateToDetails = true
                            currentValuesubject?.send(school)
                        }
                    }
                }
                
            }.navigationTitle("New York Schools").onAppear {
                NetWorkManager.sharedInstance.fetchSchools { schools, error in
                    self.schools = schools
                }
            }

        }.onAppear {

        }.navigationBarBackButtonHidden(true)


    }
}

struct TableViewCell: View {
    @State var schoolName: String?
    @State var schooplace: String?
    @State var totalStudents: String?
    var body: some View {
        VStack {
            Text(schoolName ?? "").frame(maxWidth: .infinity, alignment: .leading)
            Text(schooplace ?? "" )
                .frame(maxWidth: .infinity, alignment: .leading)
            Text("Total Number of Stundets \(totalStudents ?? "")").frame(maxWidth: .infinity, alignment: .leading)
        }
    }

}

struct SwiftUIViewController_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIViewController()
    }
}
