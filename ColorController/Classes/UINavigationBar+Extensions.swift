//
//  Created by BarredEwe on 04/23/2019.
//  Copyright (c) 2019 BarredEwe. All rights reserved.
//

import UIKit

extension UINavigationBar {
    func setBarTintColor(_ color: UIColor) {
        if #available(iOS 13.0, *) {
            standardAppearance.backgroundColor = color
            scrollEdgeAppearance?.backgroundColor = color
        } else {
            barTintColor = color
        }
    }

    func setStatusBarStyle(_ style: UIBarStyle) {
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = style == .default ? .light : .dark
        }
        barStyle = style
    }

    func setTintColor(_ color: UIColor) {
        if #available(iOS 13.0, *) {
            standardAppearance.titleTextAttributes = [.foregroundColor: color]
            standardAppearance.largeTitleTextAttributes = [.foregroundColor: color]
            scrollEdgeAppearance?.titleTextAttributes = [.foregroundColor: color]
            scrollEdgeAppearance?.largeTitleTextAttributes = [.foregroundColor: color]
        }
        tintColor = color
    }

    func getBarTintColor() -> UIColor? {
        if #available(iOS 13.0, *) {
            return standardAppearance.backgroundColor
        } else {
            return barTintColor
        }
    }
}
