//
//  NetworkController.swift
//  TimeToTravel
//
//  Created by Павел Барташов on 04.06.2022.
//

import Foundation

enum NetworkControllerError: Error, LocalizedError {
    case travelsNotFound

    var errorDescription: String? {
        switch self {
            case .travelsNotFound:
                return "На сервере нет данных"
        }
    }
}

/// Manages work with server
struct NetworkController: TravelSource {
    private let baseURL = URL(string: "https://travel.wildberries.ru/")!

    func fetchTravels() async throws -> [Travel] {
        let travelURL = baseURL.appendingPathComponent("statistics/v1/cheap")

        let (data, response) = try await URLSession.shared.data(from: travelURL)

        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw NetworkControllerError.travelsNotFound
        }

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601

        let dataResponse = try decoder.decode(DataResponse.self, from: data)

        return dataResponse.data
    }
}
