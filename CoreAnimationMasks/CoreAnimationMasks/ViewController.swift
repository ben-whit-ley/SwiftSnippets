//
//  ViewController.swift
//  SpringAnimations
//
//  Created by Ben Whitley on 7/15/17.
//  Copyright © 2017 Ben Whitley. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - IBOutlets

    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var bannerView: UIView!
    @IBOutlet weak var micView: UIView!
    @IBOutlet weak var micButton: UIButton!
    @IBOutlet weak var micButtonYConstraint: NSLayoutConstraint!
    @IBOutlet weak var closeMicButtonBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var languageButtonBottomConstraint: NSLayoutConstraint!

    // MARK: - Properties

    let searchLogo = UIImageView(image: #imageLiteral(resourceName: "search logo"))
    let micViewMask = CALayer()

    // MARK: - View Lifecycle

    override func viewWillAppear
        (_ animated: Bool) {

        super.viewWillAppear(animated)

        // Load search logo
        searchLogo.frame.size = CGSize(width: 145,
                                       height: 35)
        searchLogo.layer.position = view.center
        searchLogo.contentMode = .scaleAspectFit
        view.insertSubview(searchLogo,
                           belowSubview: micView)

        // Load mic view mask
        micViewMask.contents = #imageLiteral(resourceName: "mic view mask").cgImage
        micViewMask.bounds = CGRect(x: 0,
                                    y: 0,
                                    width: 0,
                                    height: 0)
        micViewMask.position = micButton.center
        micView.layer.mask = micViewMask
        micView.layer.masksToBounds = true

        // Animate search logo
        UIView.animate(withDuration: 0.36,
                       delay: 0.3,
                       usingSpringWithDamping: 0.9,
                       initialSpringVelocity: 30.0,
                       options: .curveEaseOut,
                       animations: {

            let x = self.view.center.x
            let y = self.view.center.y - 108
            self.searchLogo.layer.position = CGPoint(x: x,
                                                     y: y)
        }, completion: nil)

        // Animate search view
        searchView.alpha = 0.0
        searchView.transform = CGAffineTransform(scaleX: 0.7,
                                                 y: 0.7)

        micButton.alpha = 0.0
        micButton.transform = CGAffineTransform(scaleX: 0.0,
                                                 y: 0.0)
        UIView.animate(withDuration: 0.2,
                       delay: 0.3,
                       usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 13.0,
                       options: .curveEaseOut,
                       animations: {

            self.searchView.alpha = 1.0
            self.searchView.transform = CGAffineTransform(scaleX: 1.0,
                                                          y: 1.0)
            self.micButton.alpha = 1.0
            self.micButton.transform = CGAffineTransform(scaleX: 1.0,
                                                          y: 1.0)
            self.micButtonYConstraint.constant = 99.0
            self.view.layoutIfNeeded()
        }, completion: nil)
    }

    // MARK: - IBActions

    @IBAction func micButtonAction
        (_ sender: UIButton) {

        if sender.isSelected == true {
            dismissMicView()
        } else {

            sender.isSelected = true
            micView.isHidden = false
            UIView.animate(withDuration: 1.0,
                           delay: 0.0,
                           usingSpringWithDamping: 1.0,
                           initialSpringVelocity: 10.0,
                           options: .curveEaseInOut,
                           animations: {

                self.micButtonYConstraint.constant += 155
                self.closeMicButtonBottomConstraint.constant += 57
                self.languageButtonBottomConstraint.constant += 57
                self.micViewMask.bounds = CGRect(x: 0.0,
                                                 y: 0.0,
                                                 width: 1300.0,
                                                 height: 1300.0)

                let x = self.micButton.center.x
                let y = self.micButton.center.y + 155
                self.micViewMask.position = CGPoint(x: x,
                                                    y: y)
                self.view.layoutIfNeeded()
            },
                           completion: nil)
        }
    }

    @IBAction func closeMicAction
        (_ sender: UIButton) {

        dismissMicView()
    }

    

    // MARK: - Helper Functions

    func dismissMicView() {
        micButton.isSelected = false
        UIView.animate(withDuration: 1.0,
                       delay: 0.0,
                       usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 10.0,
                       options: .curveEaseInOut,
                       animations: {

            self.micButtonYConstraint.constant -= 155
            self.closeMicButtonBottomConstraint.constant -= 57
            self.languageButtonBottomConstraint.constant -= 57
            self.micViewMask.bounds = CGRect(x: 0,
                                             y: 0,
                                             width: 64,
                                             height: 64)

            let x = self.micButton.center.x
            let y = self.micButton.center.y - 155
            self.micViewMask.position = CGPoint(x: x,
                                                y: y)
            self.view.layoutIfNeeded()
        },
                       completion: { _ in
                        
            self.micView.isHidden = true
        })
    }
}

