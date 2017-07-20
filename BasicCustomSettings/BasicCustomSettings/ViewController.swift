//
//  ViewController.swift
//  BasicCustomSettings
//
//  Created by Ben Whitley on 6/14/17.
//  Copyright © 2017 Ben Whitley. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet weak var textView: UITextView!

    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        textView.becomeFirstResponder()

        UserDefaults.standard.addObserver(
            self, forKeyPath: "nightMode",
            options: .new,
            context: nil)

        detectSettingsChanged()
    }

    // MARK: - Key-Value Observing

    override func observeValue(
        forKeyPath keyPath: String?,
        of object: Any?,
        change: [NSKeyValueChangeKey : Any]?,
        context: UnsafeMutableRawPointer?) {

        detectSettingsChanged()
    }

    // MARK: - Helpers

    func detectSettingsChanged() {
        if UserDefaults.standard.bool(forKey: "nightMode") == true {
            view.backgroundColor = UIColor.black
            textView.textColor = UIColor.white
            textView.keyboardAppearance  = .dark
            UIApplication.shared.statusBarStyle = .lightContent
        } else {
            view.backgroundColor = UIColor.white
            textView.textColor = UIColor.black
            textView.keyboardAppearance  = .light
            UIApplication.shared.statusBarStyle = .default
        }
    }

    // MARK: - Deinit

    deinit {
        UserDefaults.standard.removeObserver(
            self,
            forKeyPath: "nightMode")
    }
}

