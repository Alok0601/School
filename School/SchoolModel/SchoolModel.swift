//
//  SchoolModel.swift
//  School
//
//  Created by Alok Ranjan on 18/09/24.
//

import Foundation

struct School: Codable, Identifiable {
    let id = UUID() // Unique identifier for SwiftUI List
    let dbn: String
    let school_name: String
    let overview_paragraph: String?
    let neighborhood: String?
}

struct SATScore: Codable {
    let dbn: String
    let school_name: String
    let sat_math_avg_score: String?
    let sat_critical_reading_avg_score: String?
    let sat_writing_avg_score: String?
}
