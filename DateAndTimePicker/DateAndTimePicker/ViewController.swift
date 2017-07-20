//
//  ViewController.swift
//  DateAndTimePicker
//
//  Created by Ben Whitley on 6/22/17.
//  Copyright © 2017 Ben Whitley. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

// MARK: - IBOutlets

    @IBOutlet weak var dateAndTimeLabel: UILabel!

// MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM d, yyyy 'at' h:mm a"

        dateAndTimeLabel.text = dateFormatter.string(from: Date())
    }

// MARK: - IBActions

    @IBAction func unwindToViewController(sender: UIStoryboardSegue) {
        if let source = sender.source as? DateTimePickerViewController {

            let dateFormatter = DateFormatter()
            let timeFormatter = DateFormatter()

            dateFormatter.dateStyle = .long
            timeFormatter.timeStyle = .short

            dataModel.date = source.datePicker.date
            dataModel.time = source.timePicker.date

            if let date = dataModel.date,
               let time = dataModel.time {

                let selectedDate = dateFormatter.string(from: date)
                let selectedTime = timeFormatter.string(from: time)

                dateAndTimeLabel.text = "\(selectedDate) at \(selectedTime)"
            }
        }
    }
}

