//
//  ViewController.swift
//  ColorController
//
//  Created by BarredEwe on 04/23/2019.
//  Copyright (c) 2019 BarredEwe. All rights reserved.
//

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
