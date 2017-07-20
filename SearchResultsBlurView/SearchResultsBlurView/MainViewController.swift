//
//  MainViewController.swift
//  SegmentedControl
//
//  Created by Ben Whitley on 7/5/17.
//  Copyright © 2017 Ben Whitley. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

// MARK: - IBOutlets

    @IBOutlet weak var featuredContainer: UIView!
    @IBOutlet weak var chartContainer: UIView!
    @IBOutlet weak var blurView: UIVisualEffectView!
    @IBOutlet weak var searchCollectionView: UICollectionView!

// MARK: - Properties

    let segmentedControl = UISegmentedControl(items:["Featured", "Charts"])
    var exploreButton: UIBarButtonItem?
    var searchButton: UIBarButtonItem?
    let searchController = UISearchController(searchResultsController: nil)
    var searchResults = [AnyObject]()

// MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        segmentedControl.addTarget(self,
                                   action: #selector(segmentedControlAction),
                                   for: .valueChanged)
        segmentedControl.selectedSegmentIndex = 0

        exploreButton = UIBarButtonItem(title: "Explore",
                                        style: .plain,
                                        target: nil,
                                        action: nil)

        searchButton = UIBarButtonItem(barButtonSystemItem: .search,
                                       target: self,
                                       action: #selector(setupSearchBar))

        navigationItem.titleView = segmentedControl
        navigationItem.leftBarButtonItem = exploreButton
        navigationItem.rightBarButtonItem = searchButton

        blurView.isHidden = true
        chartContainer.isHidden = true
        searchCollectionView.isHidden = true
    }


// MARK: - IBActions

    @IBAction func blurButtonAction
        (_ sender: UIButton) {
        dismissSearch()
    }

// MARK: - Helper Functions

    func setupSearchBar() {
        definesPresentationContext = false

        navigationItem.leftBarButtonItem = nil
        navigationItem.rightBarButtonItem = nil
        navigationItem.titleView = searchController.searchBar

        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.keyboardAppearance = .dark
        searchController.searchBar.becomeFirstResponder()
        searchController.searchBar.delegate = self

        let key = "searchField"
        if let searchField = searchController.searchBar.value(forKey: key),
           let textField = searchField as? UITextField {

            textField.textColor = .white
            textField.backgroundColor = UIColor.init(hue: 0.4,
                                                    saturation: 0,
                                                    brightness: 0.212,
                                                    alpha: 1.0)
        }

        blurView.isHidden = false
    }

    func segmentedControlAction
        (_ sender: UISegmentedControl) {

        if sender.selectedSegmentIndex == 0 {
            featuredContainer.isHidden = false
            chartContainer.isHidden = true
        } else {
            featuredContainer.isHidden = true
            chartContainer.isHidden = false
        }
    }

    func dismissSearch() {
        navigationItem.leftBarButtonItem = exploreButton
        navigationItem.titleView = segmentedControl
        navigationItem.rightBarButtonItem = searchButton

        searchCollectionView.isHidden = true
        blurView.isHidden = true
    }
}

