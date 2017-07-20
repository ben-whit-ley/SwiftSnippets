//
//  ViewController.swift
//  TapCounter
//
//  Created by Ben Whitley on 6/14/17.
//  Copyright © 2017 Ben Whitley. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

// MARK: - Outlets

    @IBOutlet weak var counter: UILabel!

// MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.backgroundColor = UIColor.lightGray
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }

// MARK: - Actions

    @IBAction func tap(_ sender: UIButton) {
        incrementCount()
    }

    @IBAction func longPress(_ sender: UILongPressGestureRecognizer) {
        incrementCount()
    }

    @IBAction func reset(_ sender: UIBarButtonItem) {
        counter.text = "0"
    }

// MARK: - Helpers

    func incrementCount() {
        if let text = counter.text,
            let count = Int(text) {
            counter.text = String(describing: count + 1)
        }
    }
}

