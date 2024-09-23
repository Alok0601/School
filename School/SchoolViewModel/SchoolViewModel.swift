//
//  schoolViewModel.swift
//  School
//
//  Created by Alok Ranjan on 18/09/24.
//

import Foundation
import Combine


struct AppError: Identifiable {
    let id = UUID()  // Ensures uniqueness
    let message: String
}

class SchoolViewModel: ObservableObject {
    @Published var schools: [School] = []
    @Published var satScores: [SATScore] = []
    @Published var appError: AppError?

    private var cancellables = Set<AnyCancellable>()
    private let schoolService = SchoolService()

    init() {
        fetchSchools()
        fetchSATScores()
    }

    func fetchSchools() {
        schoolService.fetchSchools()
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    self.appError = AppError(message: "Failed to load schools: \(error.localizedDescription)")
                }
            }, receiveValue: { schools in
                self.schools = schools
            })
            .store(in: &cancellables)
    }

    func fetchSATScores() {
        schoolService.fetchSATScores()
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    self.appError = AppError(message: "Failed to load SAT scores: \(error.localizedDescription)")
                }
            }, receiveValue: { satScores in
                self.satScores = satScores
            })
            .store(in: &cancellables)
    }

    func getSATScore(for dbn: String) -> SATScore? {
        return satScores.first { $0.dbn == dbn }
    }
}
