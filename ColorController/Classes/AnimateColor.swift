//
//  Created by BarredEwe on 04/23/2019.
//  Copyright (c) 2019 BarredEwe. All rights reserved.
//

import UIKit

public protocol AnimateColor {
    var destinationColor: UIColor { get set }
    var currentColor: UIColor { get set }
}

public extension AnimateColor where Self: UIViewController {

    func viewWillAppearAnimateColor() {
        updateNavigationBar(with: currentColor)
        animateNavigationBarColors()
    }

    func viewDidAppearAnimateColor() {
        updateNavigationBar(with: currentColor)
    }

    func viewWillDisappearAnimateColor() {
        updateNavigationBar(with: destinationColor)
    }

    func willMoveAnimateColor() {
        navigationController?.navigationBar.setBarTintColor(destinationColor)
        navigationController?.navigationBar.setStatusBarStyle(isLight(destinationColor) ? .default : .black)
        navigationController?.setNeedsStatusBarAppearanceUpdate()
    }

    // MARK: Private methods
    private func updateNavigationBar(with color: UIColor) {
        navigationController?.navigationBar.setBarTintColor(currentColor)
        navigationController?.navigationBar.setTintColor(isLight(currentColor) ? UIColor.darkGray : UIColor.white)
        navigationController?.navigationBar.setStatusBarStyle(isLight(currentColor) ? .default : .black)
        navigationController?.setNeedsStatusBarAppearanceUpdate()
    }

    private func animateNavigationBarColors() {
        guard let coordinator = self.transitionCoordinator else { return }
        coordinator.animate(alongsideTransition: { [unowned self] _ in
            self.navigationController?.navigationBar.setBarTintColor(self.currentColor)
            self.navigationController?.navigationBar.setTintColor(self.isLight(self.currentColor) ? UIColor.darkGray : UIColor.white)
            }, completion: nil)
    }

    private func isLight(_ color: UIColor) -> Bool {
        var white: CGFloat = 0
        color.getWhite(&white, alpha: nil)
        return white > 0.8
    }
}
