//
//  PhotoDetailViewController.swift
//  InteractiveTransitions
//
//  Created by Ben Whitley on 7/17/17.
//  Copyright © 2017 Ben Whitley. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {

    // MARK: - IBOutlets

    @IBOutlet weak var photoImageView: UIImageView!

    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        if let indexPath = selectedIndexPath {

            let image = dataModel.images[indexPath.row]
            title = image["title"]

            if let name = image["image"] {
                photoImageView.image = UIImage(named: name)
            }
        }
    }
    @IBAction func leftEdgeSwipeAction
        (_ sender: UIScreenEdgePanGestureRecognizer) {

        let swipeAmount = sender.translation(in: view)
        let swipePercent = swipeAmount.x / view.frame.width

        switch sender.state {
            case .began:
                interactiveTransition = UIPercentDrivenInteractiveTransition()
                let _ = navigationController?.popToRootViewController(animated: true)
            case .changed:
                interactiveTransition?.update(swipePercent)
            case .cancelled, .ended:
                if swipePercent < 0.16 {
                    interactiveTransition?.cancel()
                } else {
                    interactiveTransition?.finish()
                }
                interactiveTransition = nil
            default: break
        }
    }
}

extension PhotoDetailViewController: ImageViewsForTransition {

    func getImageForShow
        (transition: ShowTransition) -> UIImageView? {

        return photoImageView
    }

    func getImageForDismiss
        (transition: DismissTransition) -> UIImageView? {

        return photoImageView
    }
}
