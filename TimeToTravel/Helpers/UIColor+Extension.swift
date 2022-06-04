//
//  UIColor+Extension.swift
//  TimeToTravel
//
//  Created by Павел Барташов on 04.06.2022.
//

import UIKit

extension UIColor {
    static let wbMagenta = UIColor(red: 203 / 255, green: 17 / 255, blue: 171 / 255, alpha: 1)
    static let wbPurplish = UIColor(red: 153 / 255, green: 0 / 255, blue: 153 / 255, alpha: 1)
    static let wbDarkViolet = UIColor(red: 72 / 255, green: 17 / 255, blue: 115 / 255, alpha: 1)

//    static func gradientColor(bounds: CGRect, colors: [UIColor]) -> UIColor {
//        let gradientLayer = CAGradientLayer()
//        gradientLayer.frame = bounds
//        gradientLayer.colors = colors.map(\.cgColor)
//
//        // This makes it left to right, default is top to bottom
//        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
//        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
//
//        let renderer = UIGraphicsImageRenderer(bounds: bounds)
//
//        let gradient = renderer.image { ctx in
//            gradientLayer.render(in: ctx.cgContext)
//        }
//        
//        return UIColor(patternImage: gradient)
//    }
}
