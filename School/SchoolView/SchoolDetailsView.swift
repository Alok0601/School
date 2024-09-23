//
//  SchoolDetailsView.swift
//  School
//
//  Created by Alok Ranjan on 18/09/24.
//

import SwiftUI

struct SchoolDetailView: View {
    let school: School
    @ObservedObject var viewModel: SchoolViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(school.school_name).font(.headline)
            Text("Neighborhood: \(school.neighborhood ?? "N/A")")
            Text(school.overview_paragraph ?? "No description available")

            if let satScore = viewModel.getSATScore(for: school.dbn) {
                Text("SAT Math: \(satScore.sat_math_avg_score ?? "N/A")")
                Text("SAT Reading: \(satScore.sat_critical_reading_avg_score ?? "N/A")")
                Text("SAT Writing: \(satScore.sat_writing_avg_score ?? "N/A")")
            } else {
                Text("SAT scores not available")
            }
        }
        .padding()
        .navigationTitle(school.school_name)
    }
}
