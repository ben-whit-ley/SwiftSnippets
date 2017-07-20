//
//  ViewController.swift
//  StickyHeaderJumpbar
//
//  Created by Ben Whitley on 6/17/17.
//  Copyright © 2017 Ben Whitley. All rights reserved.
//

import UIKit

class PlacesTableViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet weak var placesTableView: UITableView!

    // MARK: - Properties

    let alphabetArray = Array(dataModel.places.keys).sorted { $0 < $01 }

    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension PlacesTableViewController: UITableViewDataSource,
                                     UITableViewDelegate {

    // MARK: - UITableViewDataSource

    func numberOfSections(in tableView: UITableView) -> Int {

        return dataModel.places.count
    }

    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {

        let letter = alphabetArray[section]

        switch section {
            case 0...alphabetArray.count - 1:
                if let places = dataModel.places[letter] {
                    return places.count
                }
                fallthrough
            default: return 1
        }
    }

    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "placeCell",
                                                 for: indexPath)
        let letter = alphabetArray[indexPath.section]

        switch indexPath.section {
            case 0...alphabetArray.count - 1:
                cell.textLabel?.text = dataModel.places[letter]?[indexPath.row]
            default: break
        }

        return cell
    }

    // MARK: - UITableViewDelegate

    func tableView(
        _ tableView: UITableView,
        titleForHeaderInSection section: Int) -> String? {

        return alphabetArray[section]
    }
}

