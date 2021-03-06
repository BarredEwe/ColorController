import UIKit

open class ColorTableViewController: UITableViewController, AnimateColor {

    public var destinationColor = UIColor.groupTableViewBackground
    public lazy var currentColor = navigationController?.navigationBar.getBarTintColor() ?? UIColor.groupTableViewBackground

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
        if let navigationController = parent as? UINavigationController, let color = navigationController.navigationBar.getBarTintColor() {
            destinationColor = color
        }
        willMoveAnimateColor()
        super.willMove(toParent: parent)
    }
}
