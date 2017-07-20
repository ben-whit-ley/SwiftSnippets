//
//  MainTableViewController.swift
//  SearchBarTableView
//
//  Created by Ben Whitley on 6/29/17.
//  Copyright © 2017 Ben Whitley. All rights reserved.
//

import UIKit

class FeaturedTableViewController: UITableViewController {

// MARK: - IBOutlets

    @IBOutlet weak var featuredCollectionView: UICollectionView!

// MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - UICollectionViewDataSource

extension FeaturedTableViewController: UICollectionViewDataSource {

    func numberOfSections(
        in collectionView: UICollectionView) -> Int {

        return 1
    }

    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int) -> Int {

        return dataModel.featuredBanners.count
    }

    func collectionView
        (_ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let id = "bannerCell"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: id,
                                                      for: indexPath)

        if let bannerCell = cell as? BannerCollectionViewCell,
           let name = dataModel.featuredBanners[indexPath.row]["image"] {

            bannerCell.imageView.image = UIImage(named: name)
            return bannerCell
        }
        return cell
    }
}

// MARK: - UITableViewDataSource

extension FeaturedTableViewController {


    override func numberOfSections
        (in tableView: UITableView) -> Int {

        return 1
    }

    override func tableView
        (_ tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {

        return 2
    }

}
