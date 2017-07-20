//
//  ViewController.swift
//  ImageCarouselAndGrid
//
//  Created by Ben Whitley on 6/27/17.
//  Copyright © 2017 Ben Whitley. All rights reserved.
//

import UIKit

class PlacesTableViewController: UIViewController {

// MARK: - IBOutlets

    @IBOutlet weak var placesTableView: UITableView!

// MARK: - Properties

    let searchController = UISearchController(searchResultsController: nil)
    var searchResults = [AnyObject]()

// MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
//        setupSearchBar()
    }

// MARK: - Search Controller

    func setupSearchBar() {
        searchController.searchResultsUpdater = self
        placesTableView.tableHeaderView = searchController.searchBar
        definesPresentationContext = false
        searchController.dimsBackgroundDuringPresentation = false
    }
}

// MARK: - UISearchResultsUpdating

extension PlacesTableViewController: UISearchResultsUpdating {

    func updateSearchResults(
        for searchController: UISearchController) {

        guard let text = searchController.searchBar.text else { return }

        let predicate = NSPredicate(format: "description contains[cd] %@", text)
        let featuredPosters = dataModel.featuredPosters as NSArray
        let filteredResults = featuredPosters.filtered(using: predicate)

        searchResults = filteredResults as [AnyObject]
        placesTableView.reloadData()
    }
}

// MARK: - UITableViewDataSource

extension PlacesTableViewController: UITableViewDataSource {

    func numberOfSections(
        in tableView: UITableView) -> Int {

        return 1
    }

    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {

        let isSearching = searchController.isActive
        return isSearching ? searchResults.count : dataModel.featuredPosters.count
    }

    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = placesTableView.dequeueReusableCell(withIdentifier: "placeCell",
                                                       for: indexPath)

        if searchController.isActive == true {

            let description = searchResults[indexPath.row]["description"]
            cell.textLabel?.text = description as? String

        } else {

            cell.textLabel?.text = dataModel.featuredPosters[indexPath.row]["description"]
        }

        return cell
    }
}
