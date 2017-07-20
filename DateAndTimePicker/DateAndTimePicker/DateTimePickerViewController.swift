//
//  DateTimePickerViewController.swift
//  DateAndTimePicker
//
//  Created by Ben Whitley on 6/22/17.
//  Copyright © 2017 Ben Whitley. All rights reserved.
//

import UIKit

class DateTimePickerViewController: UIViewController {

// MARK: - IBOutlets

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var timePicker: UIDatePicker!

// MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long

        let currentDate = dateFormatter.string(from: datePicker.date)
        dateLabel.text = "Today is: \(currentDate)"

        if let date = dataModel.date,
           let time = dataModel.time {

            datePicker.date = date
            timePicker.date = time
        }
    }

// MARK: - IBActions

    @IBAction func cancelAction(_ sender: UIBarButtonItem) {
        dismiss(animated: true,
                completion: nil)
    }
}
