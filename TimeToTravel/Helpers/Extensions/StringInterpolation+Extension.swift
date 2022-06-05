//
//  StringInterpolation+Extension.swift
//  TimeToTravel
//
//  Created by Павел Барташов on 04.06.2022.
//

import Foundation

extension String.StringInterpolation {
    mutating func appendInterpolation(format value: Date) {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium

        let dateString = formatter.string(from: value)
        appendLiteral(dateString)
    }

    mutating func appendInterpolation(format value: Double) {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        formatter.decimalSeparator = "."
        formatter.groupingSeparator = " "

        if let result = formatter.string(from: value as NSNumber) {
            appendLiteral(result)
        }
    }
}
