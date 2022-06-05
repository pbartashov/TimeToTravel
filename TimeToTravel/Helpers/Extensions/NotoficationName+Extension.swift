//
//  NotoficationName+Extension.swift
//  TimeToTravel
//
//  Created by Павел Барташов on 06.06.2022.
//

import Foundation

extension Notification.Name {
    static var travelUpdated: Notification.Name {
        .init(rawValue: "Travel.updated")
    }
}
