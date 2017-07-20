//
//  ThirdViewController.swift
//  CustomSegues
//
//  Created by Ben Whitley on 7/8/17.
//  Copyright © 2017 Ben Whitley. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

// MARK: - IBActions

    @IBAction func swipeDownAction
        (_ sender: UISwipeGestureRecognizer) {

        let id = "unwindFromThirdToSecond"
        performSegue(withIdentifier: id,
                     sender: self)
    }
}
