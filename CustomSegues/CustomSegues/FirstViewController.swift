//
//  FirstViewController.swift
//  CustomSegues
//
//  Created by Ben Whitley on 7/8/17.
//  Copyright © 2017 Ben Whitley. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

// MARK: - View Lifecycle

    override func viewWillAppear
        (_ animated: Bool) {

        super.viewWillAppear(animated)
        UIApplication.shared.statusBarStyle = .default
    }

    override func viewDidDisappear
        (_ animated: Bool) {

        super.viewDidDisappear(animated)
        UIApplication.shared.statusBarStyle = .lightContent
    }

// MARK: - IBActions

    @IBAction func swipeUpAction
        (_ sender: UISwipeGestureRecognizer) {

        let id = "firstToSecondSegue"
        performSegue(withIdentifier: id,
                     sender: self)
    }

    @IBAction func secondToFirstSegue
        (_ sender: UIStoryboardSegue) { }
}
