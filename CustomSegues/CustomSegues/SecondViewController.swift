//
//  SecondViewController.swift
//  CustomSegues
//
//  Created by Ben Whitley on 7/8/17.
//  Copyright © 2017 Ben Whitley. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBAction func swipeDownAction
        (_ sender: UISwipeGestureRecognizer) {

        let id = "unwindFromSecondToFirst"
        performSegue(withIdentifier: id,
                     sender: self)
    }

    @IBAction func swipeUpAction
        (_ sender: UISwipeGestureRecognizer) {

        let id = "secondToThirdSegue"
        performSegue(withIdentifier: id,
                     sender: self)
    }

    @IBAction func thirdToSecondSegue
        (_ sender: UIStoryboardSegue) { }

}
