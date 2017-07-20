//
//  InfoCardViewController.swift
//  Contacts
//
//  Created by Ben Whitley on 6/19/17.
//  Copyright © 2017 Ben Whitley. All rights reserved.
//

import UIKit

class InfoCardViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet weak var tableView: UITableView!

    // MARK: - Properties
    var selectedIndexPath = IndexPath()

    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

extension InfoCardViewController: UITableViewDataSource,
                                  UITableViewDelegate {

    // MARK: - UITableViewDataSource

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let infoCardCell = tableView.dequeueReusableCell(withIdentifier: "infoCardCell",
                                                               for: indexPath) as? InfoCardTableViewCell else {
            print("cellForRow error: could not create info card cell")
            return UITableViewCell()
        }

        switch selectedIndexPath.section {
            case 0:
                if let imageName = dataModel.recent[selectedIndexPath.row]["infoImage"] {
                    infoCardCell.icon.image = UIImage(named: imageName)
                }

                if let name = dataModel.recent[selectedIndexPath.row]["name"] {
                    infoCardCell.nameLabel.text = name
                }

                if let phoneNumber = dataModel.recent[selectedIndexPath.row]["number"] {
                    infoCardCell.phoneNumberLabel.text = phoneNumber
                }

                if let email = dataModel.recent[selectedIndexPath.row]["email"] {
                    infoCardCell.emailLabel.text = email
                }

                if let notes = dataModel.recent[selectedIndexPath.row]["notes"] {
                    infoCardCell.notesLabel.text = notes
                }

        case 1:
            if let imageName = dataModel.friends[selectedIndexPath.row]["infoImage"] {
                infoCardCell.icon.image = UIImage(named: imageName)
            }

            if let name = dataModel.friends[selectedIndexPath.row]["name"] {
                infoCardCell.nameLabel.text = name
            }

            if let phoneNumber = dataModel.friends[selectedIndexPath.row]["number"] {
                infoCardCell.phoneNumberLabel.text = phoneNumber
            }

            if let email = dataModel.friends[selectedIndexPath.row]["email"] {
                infoCardCell.emailLabel.text = email
            }

            if let notes = dataModel.friends[selectedIndexPath.row]["notes"] {
                infoCardCell.notesLabel.text = notes
            }

            default: break
        }
        return infoCardCell
    }
}









