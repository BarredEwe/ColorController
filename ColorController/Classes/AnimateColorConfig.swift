import UIKit

public struct AnimateColorConfig {
    public static var lightTextColor: UIColor = .white
    public static var darkTextColor: UIColor = .darkGray

    public static var isLightRatio: CGFloat = 0.8
}

extension UIColor {
    var contrastAnimateColor: UIColor {
        return isLight ? AnimateColorConfig.darkTextColor : AnimateColorConfig.lightTextColor
    }

    var isLight: Bool {
        var white: CGFloat = 0
        getWhite(&white, alpha: nil)
        return white > AnimateColorConfig.isLightRatio
    }
}
