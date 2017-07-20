//
//  GroceriesTableViewController.swift
//  BasicTableView
//
//  Created by Ben Whitley on 6/17/17.
//  Copyright © 2017 Ben Whitley. All rights reserved.
//

import UIKit

class GroceriesTableViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet weak var tableView: UITableView!

    // MARK: - Properties

    var groceries = ["Milk", "Apples", "Ham", "Eggs"]

    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func editAction(_ sender: UIBarButtonItem) {

    }

    @IBAction func addAction(_ sender: UIBarButtonItem) {
        
    }

}

extension GroceriesTableViewController: UITableViewDataSource {

    // MARK: - UITableViewDataSource

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "groceryCell", for: indexPath)

        cell.textLabel?.text = groceries[indexPath.row]

        return cell
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return groceries.count
    }
}


