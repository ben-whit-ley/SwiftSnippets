//
//  PosterCollectionViewController.swift
//  SegmentedControl
//
//  Created by Ben Whitley on 7/4/17.
//  Copyright © 2017 Ben Whitley. All rights reserved.
//

import UIKit

class PosterCollectionViewController: UIViewController {

// MARK: - IBOutlets

    @IBOutlet weak var collectionView: UICollectionView!
}

extension PosterCollectionViewController: UICollectionViewDataSource {

    func numberOfSections
        (in collectionView: UICollectionView) -> Int {

        return 1
    }

    func collectionView
        (_ collectionView: UICollectionView,
        numberOfItemsInSection section: Int) -> Int {

        return dataModel.featuredPosters.count
    }

    func collectionView
        (_ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let id = "posterCell"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: id,
                                                      for: indexPath)

        if let posterCell = cell as? PosterCollectionViewCell {

            let poster = dataModel.featuredPosters[indexPath.row]

            if let imageName = poster["image"] {
                posterCell.imageView.image = UIImage(named: imageName)
            }

            posterCell.titleLabel.text = poster["title"]
            return posterCell
        }
        return cell
    }
}
