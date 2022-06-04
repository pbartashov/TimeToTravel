//
//  Travel.swift
//  TimeToTravel
//
//  Created by Павел Барташов on 02.06.2022.
//

import Foundation

struct Travel: Codable {
    var startCity: String
    var startCityCode: String
    var endCity: String
    var endCityCode: String
    var startDate: Date
    var endDate: Date
    var price: Double
    var searchToken: String
    var isFavorite = false
}

