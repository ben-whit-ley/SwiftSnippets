//
//  MainViewController.swift
//  SegmentedControl
//
//  Created by Ben Whitley on 7/5/17.
//  Copyright © 2017 Ben Whitley. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

// MARK: - IBOutlets

    @IBOutlet weak var featuredContainer: UIView!
    @IBOutlet weak var chartContainer: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        chartContainer.isHidden = true
    }

// MARK: - IBActions

    @IBAction func segmentedControlAction
        (_ sender: UISegmentedControl) {

        if sender.selectedSegmentIndex == 0 {
            featuredContainer.isHidden = false
            chartContainer.isHidden = true
        } else {
            featuredContainer.isHidden = true
            chartContainer.isHidden = false
        }
    }
}
