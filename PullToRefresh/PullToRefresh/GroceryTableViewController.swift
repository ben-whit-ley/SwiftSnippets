//
//  ViewController.swift
//  PullToRefresh
//
//  Created by Ben Whitley on 6/17/17.
//  Copyright © 2017 Ben Whitley. All rights reserved.
//

import UIKit

class GroceryTableViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet weak var tableView: UITableView!

    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        editButtonItem.action = #selector(toggleEditing)
        navigationItem.leftBarButtonItem = self.editButtonItem
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                            target: self,
                                                            action: #selector(segue))
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self,
                                 action: #selector(refreshTable),
                                 for: .valueChanged)

        tableView.refreshControl = refreshControl
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    // MARK: - Helper Functions

    func toggleEditing() {
        tableView.setEditing(!tableView.isEditing,
                             animated: true)
        editButtonItem.title = tableView.isEditing ? "Done" : "Edit"
    }

    func segue() {
        performSegue(withIdentifier: "newGrocerySegue",
                     sender: self)
    }

    func refreshTable() {
        dataModel.groceries = dataModel.newGroceries
        tableView.reloadData()
        tableView.refreshControl?.endRefreshing()
    }
}


extension GroceryTableViewController: UITableViewDataSource, UITableViewDelegate {

    // MARK: - UITableViewDataSource

    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "groceryCell",
                                                 for: indexPath)
        cell.textLabel?.text = dataModel.groceries[indexPath.row]
        return cell
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {

        return dataModel.groceries.count
    }

    // MARK: - UITableViewDelegate

    func tableView(
        _ tableView: UITableView,
        canEditRowAt indexPath: IndexPath) -> Bool {

        return true
    }

    func tableView(
        _ tableView: UITableView,
        commit editingStyle: UITableViewCellEditingStyle,
        forRowAt indexPath: IndexPath) {

        if editingStyle == .delete {
            dataModel.groceries.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {

        }
    }

    func tableView(
        _ tableView: UITableView,
        canMoveRowAt indexPath: IndexPath) -> Bool {

        return true
    }

    func tableView(
        _ tableView: UITableView,
        moveRowAt sourceIndexPath: IndexPath,
        to destinationIndexPath: IndexPath) {

    }
}

