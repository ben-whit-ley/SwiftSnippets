//
//  PostViewController.swift
//  CollectionView
//
//  Created by Ben Whitley on 6/23/17.
//  Copyright © 2017 Ben Whitley. All rights reserved.
//

import UIKit

class PostViewController: UIViewController {

// MARK: - IBOutlets

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var postLabel: UILabel!
    @IBOutlet weak var tagsLabel: UILabel!

// MARK: - Properties

    var selectedIndex: IndexPath?

// MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        if let indexPath = selectedIndex {

            let post = dataModel.posts[indexPath.row]
            title = post["title"]

            if let image = post["image"] {
                imageView.image = UIImage(named: image)
            }

            if let likes = post["likes"] {
                likesLabel.text = "♥︎ \(likes) likes"
            }

            if let description = post["description"] {
                postLabel.text = description
            }

            if let tags = post["tags"] {
                tagsLabel.text = tags
            }
        }
    }

// MARK: - IBActions

    @IBAction func optionsAction(_ sender: UIBarButtonItem) {
        showActionSheet()
    }

// MARK: - Helper Functions

    func showAlert() {
        let alertController = UIAlertController(title: "Alert view",
                                                message: "Hello",
                                                preferredStyle: .alert)

        let confirmAction = UIAlertAction(title: "OK",
                                          style: .default,
                                          handler: nil)

        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: .destructive,
                                         handler: nil)

        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)

        present(alertController,
                animated: true,
                completion: nil)
    }

    func showActionSheet() {
        let alertController = UIAlertController(title: nil,
                                                message: nil,
                                                preferredStyle: .actionSheet)

        let reportAction = UIAlertAction(title: "Report",
                                         style: .destructive,
                                         handler: nil)

        let shareAction = UIAlertAction(title: "Share",
                                        style: .default,
                                        handler: nil)

        let saveImageAction = UIAlertAction(title: "Save Image",
                                            style: .default,
                                            handler: nil)
        let copyLinkAction = UIAlertAction(title: "Copy Link",
                                           style: .default,
                                           handler: nil)

        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: .cancel,
                                         handler: nil)

        let actions = [reportAction,
                       shareAction,
                       saveImageAction,
                       copyLinkAction,
                       cancelAction]

        for action in actions  {

            alertController.addAction(action)
        }

        present(alertController,
                animated: true,
                completion: nil)
    }
}
