//
//  Travel.swift
//  TimeToTravel
//
//  Created by Павел Барташов on 02.06.2022.
//

import UIKit

final class Travel: Codable {
    var startCity: String
//    var startCityCode: String
    var endCity: String
//    var endCityCode: String
    var startDate: Date
    var endDate: Date
    var price: Double
    var searchToken: String
    var isFavorite = false

    private enum CodingKeys: String, CodingKey {
        case startCity
        case endCity
        case startDate
        case endDate
        case price
        case searchToken
    }
}

extension Travel {
    var isFavoriteImage: UIImage? {
        UIImage(systemName: isFavorite ? "heart.fill" : "heart")
    }
}

