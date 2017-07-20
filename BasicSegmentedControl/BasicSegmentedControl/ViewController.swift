//
//  ViewController.swift
//  BasicSegmentedControl
//
//  Created by Ben Whitley on 6/27/17.
//  Copyright © 2017 Ben Whitley. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

// MARK: - IBOutlets

    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!

// MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        secondView.isHidden = true
    }

// MARK: - IBActions

    @IBAction func segmentedControlAction(_ sender: UISegmentedControl) {

        if sender.selectedSegmentIndex == 0 {
            firstView.isHidden = false
            secondView.isHidden = true
        } else {
            firstView.isHidden = true
            secondView.isHidden = false
        }
    }
}

