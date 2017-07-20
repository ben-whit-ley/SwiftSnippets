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

    // MARK: - Properties

    let searchLogo = UIImageView(image: #imageLiteral(resourceName: "search logo"))

    // MARK: - View Lifecycle

    override func viewWillAppear
        (_ animated: Bool) {

        super.viewWillAppear(animated)
        searchLogo.frame.size = CGSize(width: 145,
                                       height: 35)
        searchLogo.layer.position = view.center
        searchLogo.contentMode = .scaleAspectFit
        view.addSubview(searchLogo)
    }

    override func viewDidLayoutSubviews() {

        // Animate search logo

        UIView.animate(withDuration: 0.36,
                       delay: 0.3,
                       usingSpringWithDamping: 0.9,
                       initialSpringVelocity: 30.0,
                       options: .curveEaseOut,
                       animations: {

            self.searchLogo.layer.position = CGPoint(x: self.view.center.x,
                                                     y: self.view.center.y - 108)
        }, completion: nil)

        // Animate search view

        searchView.alpha = 0.0
        searchView.transform = CGAffineTransform(scaleX: 0.7,
                                                 y: 0.7)
        UIView.animate(withDuration: 0.2,
                       delay: 0.3,
                       usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 13.0,
                       options: .curveEaseOut,
                       animations: {

            self.searchView.alpha = 1.0
            self.searchView.transform = CGAffineTransform(scaleX: 1.0,
                                                          y: 1.0)
        }, completion: nil)
    }

 /*

 Mic View
 Duration: 1
 delay: 0
 usingSpringWithDamping: 1
 initialSpringVelocity: 10
 options: .curveEaseInOut
*/

}

