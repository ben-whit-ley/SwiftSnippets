//
//  ViewController.swift
//  Contacts
//
//  Created by Ben Whitley on 6/19/17.
//  Copyright © 2017 Ben Whitley. All rights reserved.
//

import UIKit

class ContactsViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet weak var tableView: UITableView!

    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    // MARK: - Actions

    @IBAction func settingsAction(_ sender: UIBarButtonItem) {

    }

    @IBAction func addAction(_ sender: UIBarButtonItem) {

    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "infoCardSegue" {

            if let vc = segue.destination as? InfoCardViewController,
               let indexPath = tableView.indexPathForSelectedRow {
                vc.selectedIndexPath = indexPath
            }
        }
    }
}

extension ContactsViewController: UITableViewDataSource,
                                  UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {

        return 2
    }

    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {

        switch section {
            case 0:         return dataModel.recent.count
            case 1:         return dataModel.friends.count
            default:        return 0
        }
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let personCell = tableView.dequeueReusableCell(withIdentifier: "personCell",
                                                             for: indexPath) as? PersonTableViewCell else {
            print("cellForRow error: could not create personCell")
            return UITableViewCell()
        }

        switch indexPath.section {

            // Recent section
            case 0:
                if let imageName = dataModel.recent[indexPath.row]["contactImage"] {
                    personCell.icon.image = UIImage(named: imageName)
                }

                personCell.nameLabel.text = dataModel.recent[indexPath.row]["name"]

            // Friends section
            case 1:
                if let imageName = dataModel.friends[indexPath.row]["contactImage"] {
                    personCell.icon.image = UIImage(named: imageName)
                }

                personCell.nameLabel.text = dataModel.friends[indexPath.row]["name"]

            default: break
        }

        return personCell
    }

    // MARK: - UITableViewDelegate

    func tableView(
        _ tableView: UITableView,
        viewForHeaderInSection section: Int) -> UIView? {

        guard let headerCell = tableView.dequeueReusableCell(withIdentifier: "headerCell") as? HeaderTableViewCell else {
            print("viewForHeader error: could not create headerCell")
            return UIView()
        }

        switch section {
            case 0:
                headerCell.titleLabel.text = "RECENT"
            case 1:
                headerCell.titleLabel.text = "FRIENDS"

            default: break
        }

        return headerCell
    }

    func tableView(
        _ tableView: UITableView,
        heightForHeaderInSection section: Int) -> CGFloat {

        return 40
    }
}

