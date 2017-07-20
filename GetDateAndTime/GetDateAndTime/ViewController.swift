//
//  ViewController.swift
//  GetDateAndTime
//
//  Created by Ben Whitley on 6/15/17.
//  Copyright © 2017 Ben Whitley. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet weak var dateLabel: UILabel!

    // MARK: - Properties

    let dateFormatter = DateFormatter()

    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        updateDateAndTime()
    }

    // MARK: - Actions

    @IBAction func refreshAction(_ sender: UIButton) {
        updateDateAndTime()
    }

    // MARK: - Helper Functions

    func updateDateAndTime() {
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium

        dateLabel.text = dateFormatter.string(from: Date())
    }
}

