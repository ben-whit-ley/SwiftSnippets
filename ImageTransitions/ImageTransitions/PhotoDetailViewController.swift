//
//  PhotoDetailViewController.swift
//  ImageTransitions
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
