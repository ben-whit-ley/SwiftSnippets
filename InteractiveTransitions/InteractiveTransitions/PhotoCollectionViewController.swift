//
//  ViewController.swift
//  InteractiveTransitions
//
//  Created by Ben Whitley on 7/16/17.
//  Copyright © 2017 Ben Whitley. All rights reserved.
//

import UIKit

var selectedIndexPath: IndexPath?

class PhotoCollectionViewController: UIViewController {

    // MARK: - IBOutlets

    @IBOutlet weak var photoCollectionView: UICollectionView!

    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension PhotoCollectionViewController: UICollectionViewDataSource {

    func numberOfSections
        (in collectionView: UICollectionView) -> Int {

        return 1
    }

    func collectionView
        (_ collectionView: UICollectionView,
         numberOfItemsInSection section: Int) -> Int {

        return dataModel.images.count
    }

    func collectionView
        (_ collectionView: UICollectionView,
         cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let id = "photoCell"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: id,
                                                      for: indexPath)

        if let photoCell = cell as? PhotoCollectionViewCell,
           let imageName = dataModel.images[indexPath.row]["image"] {

            photoCell.photoImageView.image = UIImage(named: imageName)
            return photoCell
        }

        return cell
    }
}

extension PhotoCollectionViewController: UICollectionViewDelegate {

    func collectionView
        (_ collectionView: UICollectionView,
         didSelectItemAt indexPath: IndexPath) {

        selectedIndexPath = indexPath
    }
}

extension PhotoCollectionViewController: ImageViewsForTransition {

    func getImageForShow
        (transition: ShowTransition) -> UIImageView? {

        guard
            let gSelectedIndexPath = selectedIndexPath
            else { return nil }

        let cell = photoCollectionView.cellForItem(at: gSelectedIndexPath)

        if let photoCell = cell as? PhotoCollectionViewCell {
            return photoCell.photoImageView
        }

        return nil
    }

    func getImageForDismiss
        (transition: DismissTransition) -> UIImageView? {

        guard
            let gSelectedIndexPath = selectedIndexPath
            else { return nil }

        let cell = photoCollectionView.cellForItem(at: gSelectedIndexPath)

        if let photoCell = cell as? PhotoCollectionViewCell {
            return photoCell.photoImageView
        }

        return nil
    }

}
/*
 Image Transitions

 Portrait Only
 Cell Size  - 187w 187h
 Min Spacing - 0 cell, 1 Lines

 ImageView
 Aspect Fit

 Initial Transition Animation
 duration: 0.7
 delay: 0
 usingSpringWithDamping: 1
 initialSpringVelocity: 1
 options: []

 Final Transition Animation
 duration: 0.35
 delay: 0
 usingSpringWithDamping: 0.9
 initialSpringVelocity: 10
 options: []

 
 */
