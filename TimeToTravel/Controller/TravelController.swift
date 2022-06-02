//
//  TravelController.swift
//  TimeToTravel
//
//  Created by Павел Барташов on 02.06.2022.
//

import Foundation

enum TravelControllerError: Error, LocalizedError {
    case travelsNotFound

    var errorDescription: String? {
        switch self {
            case .travelsNotFound:
                return "На сервере нет данных"
        }
    }
}

final class TravelController {
    private let baseURL = URL(string: "https://travel.wildberries.ru/")!

    func fetchTravels() async throws -> [Travel] {
        let travelURL = baseURL.appendingPathComponent("statistics/v1/cheap")

        let (data, response) = try await URLSession.shared.data(from: travelURL)

        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw TravelControllerError.travelsNotFound
        }

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601

        let dataResponse = try decoder.decode(DataResponse.self, from: data)

        return dataResponse.data
    }
}
