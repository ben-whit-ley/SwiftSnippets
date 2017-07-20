//
//  ViewController.swift
//  DatePicker
//
//  Created by Ben Whitley on 6/21/17.
//  Copyright © 2017 Ben Whitley. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

// MARK: -  IBOutlets

    @IBOutlet weak var datePicker: UIDatePicker!

// MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

// MARK: - IBActions

    @IBAction func setDateButtonAction(_ sender: UIButton) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long

        title = dateFormatter.string(from: datePicker.date)
    }
}

