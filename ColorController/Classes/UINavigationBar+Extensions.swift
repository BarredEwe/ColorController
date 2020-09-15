import UIKit

extension UINavigationBar {
    func setBarTintColor(_ color: UIColor) {
        if #available(iOS 13.0, *) {
            standardAppearance.backgroundColor = color
            compactAppearance?.backgroundColor = color
            scrollEdgeAppearance?.backgroundColor = color
        }
        barTintColor = color
    }

    func setStatusBarStyle(_ style: UIBarStyle) {
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = style == .default ? .light : .dark
        }
        barStyle = style
    }

    func setTintColor(_ color: UIColor) {
        if #available(iOS 13.0, *) {
            let appearance = standardAppearance
            appearance.titleTextAttributes = [.foregroundColor: color]
            appearance.largeTitleTextAttributes = [.foregroundColor: color]
            standardAppearance = appearance
            compactAppearance = appearance
            scrollEdgeAppearance = appearance
        }
        tintColor = color
        titleTextAttributes = [.foregroundColor: color]
        if #available(iOS 11.0, *) {
            largeTitleTextAttributes = [.foregroundColor: color]
        }
    }

    func getBarTintColor() -> UIColor? {
        if #available(iOS 13.0, *) {
            return standardAppearance.backgroundColor ?? barTintColor
        } else {
            return barTintColor
        }
    }
}
