//
//  MainViewController.Extensions.swift
//  SearchResultsBlurView
//
//  Created by Ben Whitley on 7/6/17.
//  Copyright © 2017 Ben Whitley. All rights reserved.
//

import UIKit

// MARK: - UICollectionViewDataSource

extension MainViewController: UICollectionViewDataSource {

    func numberOfSections
        (in collectionView: UICollectionView) -> Int {

        return 1
    }

    func collectionView
        (_ collectionView: UICollectionView,
         numberOfItemsInSection section: Int) -> Int {

        return searchResults.count
    }

    func collectionView
        (_ collectionView: UICollectionView,
         cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let id = "searchCell"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: id,
                                                      for: indexPath)

        if let posterCell = cell as? PosterCollectionViewCell {

            let poster = searchResults[indexPath.row]

            if let imageName = poster["image"] as? String {
                posterCell.imageView.image = UIImage(named: imageName)
            }

            if let title = poster["title"] as? String {
                posterCell.titleLabel.text = title
            }

            return posterCell
        }
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension MainViewController: UICollectionViewDelegate {

}

// MARK: - UISearchResultsUpdating

extension MainViewController: UISearchResultsUpdating {

    func updateSearchResults(
        for searchController: UISearchController) {

        guard let text = searchController.searchBar.text else { return }

        let predicate = NSPredicate(format: "description contains[cd] %@", text)
        let featuredPosters = dataModel.featuredPosters as NSArray
        let filteredResults = featuredPosters.filtered(using: predicate)

        searchResults = filteredResults as [AnyObject]
        searchCollectionView.reloadData()
    }
}

// MARK: - UISearchBarDelegate

extension MainViewController: UISearchBarDelegate {

    func searchBar
        (_ searchBar: UISearchBar,
         textDidChange searchText: String) {

        if searchText.characters.count <= 0 {
            searchCollectionView.isHidden = true
        } else {
            searchCollectionView.isHidden = false
        }
    }

    func searchBarCancelButtonClicked
        (_ searchBar: UISearchBar) {
        dismissSearch()
    }
}
