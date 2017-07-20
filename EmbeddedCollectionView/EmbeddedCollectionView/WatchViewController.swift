//
//  ViewController.swift
//  EmbeddedCollectionView
//
//  Created by Ben Whitley on 7/19/17.
//  Copyright © 2017 Ben Whitley. All rights reserved.
//

import UIKit

class WatchViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet weak var watchTableView: UITableView!

    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.setBackgroundImage(UIImage(),
                                                               for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }

    // MARK: - Helper Functions

    func cellIdForSection(_ section: Int) -> String {
        switch section {
            case 0:
                return "heroCell"
            case 1:
                return "descriptionCell"
            case 2:
                return "thumbnailsCell"
            case 3:
                return "infoCell"
            default:
                print("Error - section outside of scope")
                return ""
        }
    }
}

extension WatchViewController: UITableViewDataSource {

    func numberOfSections
        (in tableView: UITableView) -> Int {

        return 4
    }

    func tableView
        (_ tableView: UITableView,
         numberOfRowsInSection section: Int) -> Int {

        return 1
    }

    func tableView
        (_ tableView: UITableView,
         cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let id = cellIdForSection(indexPath.section)
        let cell = tableView.dequeueReusableCell(withIdentifier: id,
                                                 for: indexPath)

        switch indexPath.section {
            case 0:
                if let heroCell = cell as? HeroTableViewCell,
                   let imageName = dataModel.watch["hero image"] {

                    heroCell.heroImageView.image = UIImage(named: imageName)
                    return heroCell
                }

            case 1:
                if let descriptionCell = cell as? DescriptionTableViewCell,
                   let title = dataModel.watch["title"],
                   let description = dataModel.watch["description"] {

                    descriptionCell.titleLabel.text = title
                    descriptionCell.descriptionLabel.text = description
                    return descriptionCell
                }

            case 2:
                return cell

            case 3:
                if let infoCell = cell as? InfoTableViewCell,
                   let subtitle1 = dataModel.watch["subtitle 1"],
                   let subtitle2 = dataModel.watch["subtitle 2"],
                   let subtitle3 = dataModel.watch["subtitle 3"],
                   let info1 = dataModel.watch["info 1"],
                   let info2 = dataModel.watch["info 2"],
                   let info3 = dataModel.watch["info 3"],
                   let footnote = dataModel.watch["footnote"] {

                    infoCell.subtitleLabel1.text = subtitle1
                    infoCell.subtitleLabel2.text = subtitle2
                    infoCell.subtitleLabel3.text = subtitle3
                    infoCell.infoLabel1.text = info1
                    infoCell.infoLabel2.text = info2
                    infoCell.infoLabel3.text = info3
                    infoCell.footnoteLabel.text = footnote
                    return infoCell
                }
            default:
                return cell
        }

        return cell
    }
}

extension WatchViewController: UITableViewDelegate {

    func tableView
        (_ tableView: UITableView,
         heightForRowAt indexPath: IndexPath) -> CGFloat {

        switch indexPath.section {
            case 0: return UITableViewAutomaticDimension
            case 1: return 100
            case 2: return 120
            case 3: return 400
            default: return 0
        }
    }

    func tableView
        (_ tableView: UITableView,
         estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {

        return 200
    }
}

extension WatchViewController: UICollectionViewDataSource {

    func numberOfSections
        (in collectionView: UICollectionView) -> Int {

        return 1
    }

    func collectionView
        (_ collectionView: UICollectionView,
         numberOfItemsInSection section: Int) -> Int {

        return dataModel.images.count
    }

    func collectionView
        (_ collectionView: UICollectionView,
         cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let id = "thumbnailCell"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: id,
                                                      for: indexPath)

        if let thumbnailCell = cell as? ThumbnailCollectionViewCell,
           let imageName = dataModel.images[indexPath.row]["thumbnail"] {

            thumbnailCell.thumbnailImageView.image = UIImage(named: imageName)
            return thumbnailCell
        }

        return cell
    }
}

