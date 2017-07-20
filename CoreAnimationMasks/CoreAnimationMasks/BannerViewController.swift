//
//  BannerViewController.swift
//  CoreAnimationMasks
//
//  Created by Ben Whitley on 7/15/17.
//  Copyright © 2017 Ben Whitley. All rights reserved.
//

import UIKit

class BannerViewController: UIViewController {

    // MARK: - IBOutlets

    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!

    // MARK: - View Lifecycle

    override func viewDidAppear
        (_ animated: Bool) {

        // Animate Banner View
        animateBanner(delay: 0.6,
                      bottomConstraint: 0)
    }

    // MARK: - IBActions

    @IBAction func closeBannerAction
        (_ sender: UIButton) {

        animateBanner(delay: 0.0,
                      bottomConstraint: -96)
    }

    // MARK: - Helper Functions

    func animateBanner
        (delay: TimeInterval,
         bottomConstraint: CGFloat) {

        UIView.animate(withDuration: 1.3,
                       delay: delay,
                       usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 6.0,
                       options: .curveLinear,
                       animations: {

            self.bottomConstraint.constant = bottomConstraint
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
}
