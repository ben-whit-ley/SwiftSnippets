//
//  ViewController.swift
//  UiSlider01
//
//  Created by Ben Whitley on 6/15/17.
//  Copyright © 2017 Ben Whitley. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var slider: UISlider!

    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        label.textColor = UIColor(hue: 0,
                                  saturation: 0,
                                  brightness: 0,
                                  alpha: CGFloat(slider.value))
    }

    // MARK: - Actions

    @IBAction func slide(_ sender: UISlider) {
        label.textColor = UIColor(hue: 0,
                                  saturation: 0,
                                  brightness: 0,
                                  alpha: CGFloat(sender.value))
    }
}
