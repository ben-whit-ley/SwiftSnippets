//
//  TimelineViewController.swift
//  SaveDateLocationPhoto
//
//  Created by Ben Whitley on 6/21/17.
//  Copyright © 2017 Ben Whitley. All rights reserved.
//

import UIKit
import CoreData

class TimelineViewController: UIViewController {

// MARK: - IBOutlets

    @IBOutlet weak var timelineTableView: UITableView!

// MARK: - Properties

    var viewContext: NSManagedObjectContext? = {

        let delegate = UIApplication.shared.delegate

        if let appDelegate = delegate as? AppDelegate {
            return appDelegate.persistentContainer.viewContext
        }
        return nil
    }()

    var fetchedResultsController: NSFetchedResultsController<NSFetchRequestResult>?

// MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeFetchedResultsController()
        timelineTableView.estimatedRowHeight = 44.0
        timelineTableView.rowHeight = UITableViewAutomaticDimension
    }

// MARK: - Helper Functions

    func initializeFetchedResultsController() {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Entries")
        let dateSort = NSSortDescriptor(key: "date",
                                        ascending: false)

        request.sortDescriptors = [dateSort]

        guard let context = viewContext else { return }
        fetchedResultsController = NSFetchedResultsController(fetchRequest: request,
                                                              managedObjectContext: context,
                                                              sectionNameKeyPath: nil,
                                                              cacheName: nil)
        fetchedResultsController?.delegate = self
        fetch()
    }

    func fetch() {
        do {
            try fetchedResultsController?.performFetch()
        } catch {
            print("Failed to initalize fetchedResultsController: \(error)")
        }
    }

    func configureCell(cell: UITableViewCell,
                       indexPath: IndexPath) {

        guard let result = fetchedResultsController?.object(at: indexPath),
              let entry = result as? Entries,
              let timelineCell = cell as? TimelineTableViewCell else {

                print("Unexpected object in FetchedResultsController")
                return
        }

        timelineCell.entryLabel.text = entry.entry

        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long

        if let date = entry.date {

            let dateString = dateFormatter.string(from: date as Date)
            timelineCell.dateLabel.text = dateString
        }

        if let locationText = entry.location {
            timelineCell.locationLabel.text = locationText
        }

        if let image = entry.image {

            let selectedImage = UIImage(data: image as Data)
            timelineCell.selectedImageView.image = selectedImage
        }
    }
}
