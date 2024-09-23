//
//  Networking.swift
//  School
//
//  Created by Alok Ranjan on 18/09/24.
//

import Foundation
import Combine

class SchoolService {
    private let schoolURL = URL(string: "https://data.cityofnewyork.us/resource/s3k6-pzi2.json")!
    private let satScoreURL = URL(string: "https://data.cityofnewyork.us/resource/f9bf-2cp4.json")!
    
    func fetchSchools() -> AnyPublisher<[School], Error> {
        URLSession.shared.dataTaskPublisher(for: schoolURL)
            .map(\.data)
            .decode(type: [School].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }

    func fetchSATScores() -> AnyPublisher<[SATScore], Error> {
        URLSession.shared.dataTaskPublisher(for: satScoreURL)
            .map(\.data)
            .decode(type: [SATScore].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

