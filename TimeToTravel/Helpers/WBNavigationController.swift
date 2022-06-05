//
//  WBNavigationController.swift
//  TimeToTravel
//
//  Created by Павел Барташов on 06.06.2022.
//

import UIKit

//https://serialcoder.dev/text-tutorials/ios-tutorials/change-status-bar-style-in-navigation-controller-based-apps/
class WBNavigationController: UINavigationController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return topViewController?.preferredStatusBarStyle ?? .default
    }
}
