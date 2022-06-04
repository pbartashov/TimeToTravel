//
//  TravelController.swift
//  TimeToTravel
//
//  Created by Павел Барташов on 02.06.2022.
//

import Foundation

protocol TravelSource {
    func fetchTravels() async throws -> [Travel]
}

final class TravelController {
    private let source: TravelSource
    var travels: [Travel] = []

    init(source: TravelSource = NetworkController()) {
        self.source = source
    }

    func fetchTravels() async throws {
        travels = try await source.fetchTravels()
    }
}
