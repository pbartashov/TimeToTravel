//
//  DataResponse.swift
//  TimeToTravel
//
//  Created by Павел Барташов on 02.06.2022.
//

/// Models server response
struct DataResponse: Codable {
    //    let meta: [String:String]
    let data: [Travel]
}
