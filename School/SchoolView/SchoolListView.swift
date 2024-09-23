//
//  SchoolListView.swift
//  School
//
//  Created by Alok Ranjan on 18/09/24.
//

import SwiftUI

struct SchoolListView: View {
    @ObservedObject var viewModel = SchoolViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.schools) { school in
                NavigationLink(destination: SchoolDetailView(school: school, viewModel: viewModel)) {
                    Text(school.school_name)
                }
            }
            .navigationTitle("NYC High Schools")
            .alert(item: $viewModel.appError) { error in
                Alert(title: Text("Error"), message: Text(error.message), dismissButton: .default(Text("OK")))
            }
        }
    }
}
