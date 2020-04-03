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
        navigationController?.navigationBar.setStatusBarStyle(destinationColor.isLight ? .default : .black)
        navigationController?.setNeedsStatusBarAppearanceUpdate()
    }

    // MARK: Private Methods
    private func updateNavigationBar(with color: UIColor) {
        navigationController?.navigationBar.setBarTintColor(currentColor)
        navigationController?.navigationBar.setTintColor(currentColor.contrastAnimateColor)
        navigationController?.navigationBar.setStatusBarStyle(currentColor.isLight ? .default : .black)
        navigationController?.setNeedsStatusBarAppearanceUpdate()
    }

    private func animateNavigationBarColors() {
        guard let coordinator = self.transitionCoordinator else { return }
        coordinator.animate(alongsideTransition: { [unowned self] _ in
            self.navigationController?.navigationBar.setBarTintColor(self.currentColor)
            self.navigationController?.navigationBar.setTintColor(self.currentColor.contrastAnimateColor)
            }, completion: nil)
    }
}
