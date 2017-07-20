//
//  TimelineViewController.Extensions.swift
//  SaveDateLocationPhoto
//
//  Created by Ben Whitley on 6/22/17.
//  Copyright © 2017 Ben Whitley. All rights reserved.
//

import UIKit
import CoreData

extension TimelineViewController: UITableViewDataSource {

    // MARK: - UITableViewDataSource

    func numberOfSections(in tableView: UITableView) -> Int {

        guard let frc = fetchedResultsController,
              let sections = frc.sections else { return 0 }
        return sections.count
    }

    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {

        guard let frc = fetchedResultsController,
            let sections = frc.sections else { return 0 }

        return sections[section].numberOfObjects
    }

    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let id = "timelineCell"
        let cell = timelineTableView.dequeueReusableCell(withIdentifier: id,
                                                         for: indexPath)

        if let timelineCell = cell as? TimelineTableViewCell {

            configureCell(cell: timelineCell,
                          indexPath: indexPath)
            return timelineCell
        }

        print("timelineCell iflet error")
        return UITableViewCell()
    }
}

extension TimelineViewController: UITableViewDelegate {

// MARK: - UITableViewDelegate

    func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath) -> CGFloat {

        return UITableViewAutomaticDimension
    }

    func tableView(
        _ tableView: UITableView,
        estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {

        return 44
    }

    func tableView(
        _ tableView: UITableView,
        canEditRowAt indexPath: IndexPath) -> Bool {

        return true
    }

    func tableView(
        _ tableView: UITableView,
        commit editingStyle: UITableViewCellEditingStyle,
        forRowAt indexPath: IndexPath) {

        guard let entries = fetchedResultsController?.object(at: indexPath),
              let managedObject = entries as? NSManagedObject,
              let context = viewContext else { return }

        context.delete(managedObject)

        do {
            try context.save()
        } catch let error as NSError {
            print("Unresolved error: \(error.domain)")
        }
    }
}

extension TimelineViewController: NSFetchedResultsControllerDelegate {

    func controllerWillChangeContent(
        _ controller: NSFetchedResultsController<NSFetchRequestResult>) {

        timelineTableView.beginUpdates()
    }

    func controller(
        _ controller: NSFetchedResultsController<NSFetchRequestResult>,
        didChange sectionInfo: NSFetchedResultsSectionInfo,
        atSectionIndex sectionIndex: Int,
        for type: NSFetchedResultsChangeType) {

        let indexSet = IndexSet(integer: sectionIndex)

        switch type {
            case .insert:
                timelineTableView.insertSections(indexSet,
                                                 with: .fade)
            case .delete:
                timelineTableView.deleteSections(indexSet,
                                                 with: .fade)
            default: break
        }
    }

    func controller
        (_ controller: NSFetchedResultsController<NSFetchRequestResult>,
         didChange anObject: Any,
         at indexPath: IndexPath?,
         for type: NSFetchedResultsChangeType,
         newIndexPath: IndexPath?) {

        switch type {
            case .insert:

                guard let newIP = newIndexPath else { return }
                timelineTableView.insertRows(at: [newIP],
                                             with: .fade)
            case .delete:

                guard let ip = indexPath else { return }
                timelineTableView.deleteRows(at: [ip],
                                             with: .fade)
            case .update:

                guard let ip = indexPath,
                      let cell = timelineTableView.cellForRow(at: ip) else { return }
                configureCell(cell: cell,
                              indexPath: ip)
            case .move:

                guard let ip = indexPath,
                      let newIP = newIndexPath else { return }
                timelineTableView.moveRow(at: ip,
                                          to: newIP)
        }
    }

    func controllerDidChangeContent(
        _ controller: NSFetchedResultsController<NSFetchRequestResult>) {

        timelineTableView.endUpdates()
    }
}
