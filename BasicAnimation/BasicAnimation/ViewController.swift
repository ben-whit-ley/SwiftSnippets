//
//  ViewController.swift
//  BasicAnimation
//
//  Created by Ben Whitley on 7/8/17.
//  Copyright © 2017 Ben Whitley. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

// MARK: - Properties

    let characterImageView = UIImageView()

// MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        loadImage(imageView: characterImageView,
                  name: "tesla",
                  x: 0,
                  y: 130,
                  width: 230,
                  height: 330)
    }

// MARK: - IBAction

    @IBAction func shootAction
        (_ sender: UIButton) {

        let lightningBall = UIImageView()

        loadImage(imageView: lightningBall,
                  name: "lightning ball",
                  x: 200,
                  y: 170,
                  width: 100,
                  height: 100)

        UIView.animate(withDuration: 0.3,
                       delay: 0,
                       options: .curveLinear,
                       animations: { 

            lightningBall.frame = CGRect(x: self.view.frame.width,
                                         y: lightningBall.frame.origin.y,
                                         width: lightningBall.frame.width,
                                         height: lightningBall.frame.height)
            self.characterImageView.image = UIImage(named: "tesla action")
        },
                       completion: { _ in

            self.characterImageView.image = UIImage(named: "tesla")
            lightningBall.removeFromSuperview()
        })
    }

// MARK: - Helper Functions

    func loadImage(imageView: UIImageView,
                   name: String,
                   x: CGFloat,
                   y: CGFloat,
                   width: CGFloat,
                   height: CGFloat) {

        imageView.image = UIImage(named: name)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: x,
                                 y: y,
                                 width: width,
                                 height: height)

        view.addSubview(imageView)
    }
}

