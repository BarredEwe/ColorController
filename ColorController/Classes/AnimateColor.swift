//
//  Created by grishutin on 20/04/2018.
//  Copyright © 2018 bifit. All rights reserved.
//

import UIKit

public protocol AnimateColor {
    var destinationColor: UIColor { get set }
    var currentColor: UIColor { get set }
}

public extension AnimateColor where Self: UIViewController {

    public func viewWillAppearAnimateColor() {
        updateNavigationBar(with: currentColor)
        animateNavigationBarColors()
    }

    public func viewDidAppearAnimateColor() {
        updateNavigationBar(with: currentColor)
    }

    public func viewWillDisappearAnimateColor() {
        updateNavigationBar(with: destinationColor)
    }

    public func willMoveAnimateColor() {
        navigationController?.navigationBar.barTintColor = destinationColor
        navigationController?.navigationBar.barStyle = isLight(destinationColor) ? .default : .black
    }

    // MARK: Private methods
    private func updateNavigationBar(with color: UIColor) {
        navigationController?.navigationBar.barTintColor = currentColor
        navigationController?.navigationBar.tintColor = isLight(currentColor) ? UIColor.darkGray : UIColor.white
        navigationController?.navigationBar.barStyle = isLight(currentColor) ? .default : .black
    }

    private func animateNavigationBarColors() {
        guard let coordinator = self.transitionCoordinator else { return }

        coordinator.animate(alongsideTransition: { [unowned self] _ in
            self.navigationController?.navigationBar.barTintColor = self.currentColor
            self.navigationController?.navigationBar.tintColor = self.isLight(self.currentColor) ? UIColor.darkGray : UIColor.white
            }, completion: nil)
    }

    private func isLight(_ color: UIColor) -> Bool {
        var white: CGFloat = 0
        color.getWhite(&white, alpha: nil)
        return white > 0.8
    }
}

open class ColorTableViewController: UITableViewController, AnimateColor {

    public var destinationColor = UIColor.groupTableViewBackground
    public var currentColor = UIColor.groupTableViewBackground

    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewWillAppearAnimateColor()
    }

    override open func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewDidAppearAnimateColor()
    }

    override open func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        viewWillDisappearAnimateColor()
    }

    override open func willMove(toParent parent: UIViewController?) {
        if let navigationController = parent as? UINavigationController, let color = navigationController.navigationBar.barTintColor {
            destinationColor = color
        }
        willMoveAnimateColor()
        super.willMove(toParent: parent)
    }
}

open class ColorViewController: UIViewController, AnimateColor {

    public var destinationColor = UIColor.groupTableViewBackground
    public var currentColor = UIColor.groupTableViewBackground

    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewWillAppearAnimateColor()
    }

    override open func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewDidAppearAnimateColor()
    }

    override open func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        viewWillDisappearAnimateColor()
    }

    override open func willMove(toParent parent: UIViewController?) {
        if let navigationController = parent as? UINavigationController, let color = navigationController.navigationBar.barTintColor {
            destinationColor = color
        }
        willMoveAnimateColor()
        super.willMove(toParent: parent)
    }
}
