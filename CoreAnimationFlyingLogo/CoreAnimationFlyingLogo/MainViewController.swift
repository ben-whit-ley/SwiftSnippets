//
//  MainViewController.swift
//  CoreAnimationFlyingLogo
//
//  Created by Ben Whitley on 7/9/17.
//  Copyright © 2017 Ben Whitley. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

// MARK: - IBOutlets

    @IBOutlet weak var greenView: UIView!
    @IBOutlet weak var contentView: UIView!

// MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidLayoutSubviews() {

        let smileMask = CALayer()
        smileMask.contents = UIImage(named: "smiley face")?.cgImage
        smileMask.bounds = CGRect(x: 0.0,
                                  y: 0.0,
                                  width: 92.0,
                                  height: 92.0)

        smileMask.position = CGPoint(x: view.center.x,
                                     y: view.center.y - 20)

        contentView.layer.mask = smileMask
        contentView.layer.masksToBounds = true

        let animation = CAKeyframeAnimation()
        animation.keyPath = "bounds"
        animation.duration = 1
        animation.timingFunctions = [

            CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut),
            CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        ]

        let keyframe1 = NSValue(cgRect: CGRect(x: 0.0,
                                               y: 0.0,
                                               width: 80.0,
                                               height: 80.0))
        let keyframe2 = NSValue(cgRect: CGRect(x: 0.0,
                                               y: 0.0,
                                               width: 65.0,
                                               height: 65.0))
        let keyframe3 = NSValue(cgRect: CGRect(x: 0.0,
                                               y: 0.0,
                                               width: 2600.0,
                                               height: 2600.0))


        animation.values = [keyframe1,
                            keyframe2,
                            keyframe3]

        animation.keyTimes = [0.0,
                              0.7,
                              1.0]

        contentView.layer.mask?.add(animation,
                                    forKey: "bounds")

        contentView.layer.mask?.bounds = CGRect(x: 0.0,
                                                y: 0.0,
                                                width: 2600.0,
                                                height: 2600.0)

        contentView.transform = CGAffineTransform(scaleX: 1.1,
                                                  y: 1.1)

        UIView.animate(withDuration: 0.4,
                       delay: 0.8,
                       usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 16.0,
                       options: .curveEaseInOut,
                       animations: { 

            self.contentView.transform = CGAffineTransform(scaleX: 1.0,
                                                      y: 1.1)
        },
                       completion: nil)
    }
}
