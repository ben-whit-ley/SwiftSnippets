//
//  ViewController.swift
//  PassingData
//
//  Created by Ben Whitley on 6/15/17.
//  Copyright © 2017 Ben Whitley. All rights reserved.
//

import UIKit

var sentMessage: String?

class FirstViewController: UIViewController {

    // MARK: - IBOutlets

    @IBOutlet weak var textView: UITextView!

    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        textView.becomeFirstResponder()
    }

    // MARK: - Navigation

    override func prepare(
        for segue: UIStoryboardSegue,
        sender: Any?) {
        sentMessage = textView.text
    }
}

class SecondViewController: UIViewController {

    // MARK: - IBOutlets

    @IBOutlet weak var messageLabel: UILabel!

    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        messageLabel.text = sentMessage
    }

}

