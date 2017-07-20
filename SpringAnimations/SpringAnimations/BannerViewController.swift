//
//  BannerViewController.swift
//  SpringAnimations
//
//  Created by Ben Whitley on 7/15/17.
//  Copyright © 2017 Ben Whitley. All rights reserved.
//

import UIKit

class BannerViewController: UIViewController {

    // MARK: - IBOutlets

    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!


    override func viewDidLayoutSubviews() {

        // Animate Banner View
        UIView.animate(withDuration: 1.3,
                       delay: 0.6,
                       usingSpringWithDamping: 1.9,
                       initialSpringVelocity: 6.0,
                       options: .curveLinear, animations: {

            self.bottomConstraint.constant = 0
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
}
