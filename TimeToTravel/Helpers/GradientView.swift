//
//  GradientView.swift
//  TimeToTravel
//
//  Created by Павел Барташов on 04.06.2022.
//

import UIKit

//https://www.advancedswift.com/gradient-view-background-in-swift/
class GradientView: UIView {
    var gradientLayer: CAGradientLayer {
        return layer as! CAGradientLayer
    }

    init(colors: [UIColor],
         locations:[Float] = [0.0, 1.0],
         startPoint: CGPoint = .init(x: 0.5, y: 0.0),
         endPoint: CGPoint = .init(x: 0.5, y: 1.0)) {

        super.init(frame: .zero)

        gradientLayer.colors = colors.map { $0.cgColor }
        gradientLayer.locations = locations.map { NSNumber(value: $0) }
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
    }

    required init?(coder: NSCoder) { fatalError("no init(coder:)") }

    override open class var layerClass: AnyClass {
        return CAGradientLayer.classForCoder()
    }
}
