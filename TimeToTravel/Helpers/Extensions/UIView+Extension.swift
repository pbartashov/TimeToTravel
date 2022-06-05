//
//  UIView+Extension.swift
//  TimeToTravel
//
//  Created by Павел Барташов on 04.06.2022.
//

import UIKit

public extension UIView {
    static var identifier: String {
        String(describing: self)
    }

//    func addSubviewsToAutoLayout(_ subviews: UIView...) {
    func addSubviews(_ subviews: UIView...) {
        subviews.forEach {
            addSubview($0)
//            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}
