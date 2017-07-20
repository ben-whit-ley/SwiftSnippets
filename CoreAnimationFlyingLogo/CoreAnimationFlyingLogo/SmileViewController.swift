//
//  SmilesViewController.swift
//  CoreAnimationFlyingLogo
//
//  Created by Ben Whitley on 7/9/17.
//  Copyright © 2017 Ben Whitley. All rights reserved.
//

import UIKit

class SmileViewController: UIViewController {

// MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        let whiteView = UIView(frame: view.frame)
        whiteView.backgroundColor = UIColor.white
        view.addSubview(whiteView)

        UIView.animate(withDuration: 0.1,
                       delay: 0.7,
                       options: [],
                       animations: {

            whiteView.alpha = 0
        }) { _ in

            whiteView.isHidden = true
        }
    }
}

// MARK: - UITableViewDataSource

extension SmileViewController: UITableViewDataSource {

    func numberOfSections
        (in tableView: UITableView) -> Int {

        return 1
    }

    func tableView
        (_ tableView: UITableView,
         numberOfRowsInSection section: Int) -> Int {

        return dataModel.smiles.count
    }

    func tableView
        (_ tableView: UITableView,
         cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let id = "smileCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: id,
                                                 for: indexPath)

        if let smileCell = cell as? SmileTableViewCell {

            let smile = dataModel.smiles[indexPath.row]

            if let name = smile["icon"] {
                smileCell.icon.image = UIImage(named: name)
            }

            smileCell.nameLabel.text = smile["name"]
            smileCell.messageLabel.text = smile["message"]

            return smileCell
        }
        
        return cell
    }
}
