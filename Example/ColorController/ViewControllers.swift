import UIKit
import ColorController

class FirstViewController: ColorViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

class SecondViewController: ColorViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        currentColor = .systemBlue
    }
}

class ThirdViewController: ColorViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        currentColor = .white
    }
}
