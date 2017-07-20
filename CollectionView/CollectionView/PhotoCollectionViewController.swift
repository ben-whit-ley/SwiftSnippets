//
//  ViewController.swift
//  CollectionView
//
//  Created by Ben Whitley on 6/23/17.
//  Copyright © 2017 Ben Whitley. All rights reserved.
//

import UIKit

class PhotoCollectionViewController: UIViewController {

// MARK: - IBOutlets

    @IBOutlet weak var collectionView: UICollectionView!

// MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        let backButton = UIBarButtonItem(title: "",
                                         style: .plain,
                                         target: nil,
                                         action: nil)
        navigationItem.backBarButtonItem = backButton
    }

// MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue,
                          sender: Any?) {
        if segue.identifier == "photosToPostSegue",
           let destination = segue.destination as? PostViewController,
           let cell = sender as? UICollectionViewCell {
            
            destination.selectedIndex = collectionView.indexPath(for: cell)
        }
    }
}

extension PhotoCollectionViewController: UICollectionViewDataSource {

// MARK: - UICollectionViewDataSource

    func numberOfSections(
        in collectionView: UICollectionView) -> Int {

        return 1
    }

    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int) -> Int {

        return dataModel.posts.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell",
                                                      for: indexPath)

        let post = dataModel.posts[indexPath.row]

        if let photoCell = cell as? PhotoCollectionViewCell,
           let imageName = post["image"] {
            photoCell.imageView.image = UIImage(named: imageName)
            return photoCell
        }

        return cell
    }
}
