//
//  NewGroceryViewController.swift
//  PullToRefresh
//
//  Created by Ben Whitley on 6/17/17.
//  Copyright © 2017 Ben Whitley. All rights reserved.
//

import UIKit

class NewGroceryViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet weak var textView: UITextView!

    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        textView.becomeFirstResponder()
    }

    // MARK: - Actions

    @IBAction func doneAction(_ sender: UIBarButtonItem) {
        if textView.text.characters.count > 0 {
            dataModel.groceries.append(textView.text)
        }

//        let _ = navigationController?.popToRootViewController(animated: true)
        navigationController?.popViewController(animated: true)
    }
}
