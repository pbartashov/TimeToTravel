//
//  GradientView.swift
//  TimeToTravel
//
//  Created by Павел Барташов on 04.06.2022.
//

import UIKit

//https://stackoverflow.com/questions/39572990/applying-gradient-background-for-uiview-using-auto-layout
class GradientView: UIView {

    let gradient : CAGradientLayer

    init(gradient: CAGradientLayer) {
        self.gradient = gradient
        super.init(frame: .zero)
        self.gradient.frame = self.bounds
        self.layer.insertSublayer(self.gradient, at: 0)
    }

    convenience init(colors: [UIColor],
                     locations:[Float] = [0.0, 1.0],
                     startPoint: CGPoint = .init(x: 0.5, y: 0.0),
                     endPoint: CGPoint = .init(x: 0.5, y: 1.0)) {

        let gradient = CAGradientLayer()
        gradient.colors = colors.map { $0.cgColor }
        gradient.locations = locations.map { NSNumber(value: $0) }
        gradient.startPoint = startPoint
        gradient.endPoint = endPoint

        self.init(gradient: gradient)
    }

    override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        self.gradient.frame = self.bounds
    }

    required init?(coder: NSCoder) { fatalError("no init(coder:)") }
}

