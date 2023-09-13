//
//  SwiftUISchollDetials.swift
//  20230315-karthikjuluri-NYCSchools
//
//  Created by Karthik Juluri - Vendor on 9/13/23.
//

import SwiftUI

struct SwiftUISchollDetials: View {
    var school: School?
    var viewModel = SchoolDetailsViewModel()
    @State var schoolDetails: SchoolDetails?
    var body: some View {
        VStack {
            if schoolDetails == nil {
                ProgressView().frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            if schoolDetails != nil {
                Text("Reading SAT Score: \(schoolDetails?.readingScore ?? "")").frame(alignment: .center)
                Text("Writing SAT Score: \(schoolDetails?.writingScore ?? "")")
                Text("Math SAT Score: \(schoolDetails?.writingScore ?? "")")
            }
        }.onAppear {
            if let school = self.school {
                viewModel.getSchoolDetails(dbn: school.dbn) { schoolDetails in
                    self.schoolDetails = schoolDetails
                }
            }
        }
    }
}

struct SwiftUISchollDetials_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUISchollDetials()
    }
}
