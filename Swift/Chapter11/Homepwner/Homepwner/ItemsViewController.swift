//
//  ItemsViewController.swift
//  Homepwner
//
//          ItemsViewController is a higher-level object that only knows that it will be provided with a
//      utility object (the store) from which it can obtain a list of Item instances and to which it
//      can pass new or updated Item instances to be stored persistently. This results in a decoupling
//      because ItemsViewController is not dependent on ItemStore. In fact, as long as the store abstraction
//      is respected, ItemStore could be replaced by another object that fetches Item instances differently
//      (such as by using a web service) without any changes to ItemsViewController.
//
//         When a UITableView wants to know what to display, it calls methods from the
//      set of methods declared in the UITableViewDataSource protocol.
//
//  Created by Arie Myrmo on 10/4/18.
//  Copyright © 2018 WynterVate. All rights reserved.
//

import UIKit

class ItemsViewController: UITableViewController {

    // At this point you may be wondering why itemStore was set externally on the ItemsViewController.
    // Why didn’t the ItemsViewController instance itself just create an instance of the store? The reason
    // for this approach is based on a fairly complex topic called the dependency inversion principle.
    // The essential goal of this principle is to decouple objects in an application by inverting certain
    // dependencies between them. This results in more robust and maintainable code.
    //   The dependency inversion principle states that:
    //      1. High-level objects should not depend on low-level objects. Both should depend on abstractions.
    //      2. Abstractions should not depend on details. Details should depend on abstractions.
    var itemStore: ItemStore!

    /// Add a new item to UITableView
    @IBAction func addNewItem(_ sender: UIButton) {
        // Create a new item and add it to the store
        let newItem = itemStore.createItem()

        // Figure out where that item is in the array
        if let index = itemStore.allItems.index(of: newItem) {
            let indexPath = IndexPath(row: index, section: 0)

            // Insert this new row into the table
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
    }

    /// Toggle UITableView editing mode on and off
    @IBAction func toggleEditingMode(_ sender: UIButton) {
        // In editing mode..
        if isEditing {
            // Change text of button to inform user of state
            sender.setTitle("Edit", for: .normal)

            // Turn off editing mode
            setEditing(false, animated: true)
        } else {
            // Change text of button to inform user of state
            sender.setTitle("Done", for: .normal)

            // Enter editing mode
            setEditing(true, animated: true)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Get the height of the status bar
        let statusBarHeight = UIApplication.shared.statusBarFrame.height

        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
    }

    //  The required method tableView(_:numberOfRowsInSection:) returns an integer value for the number
    // of rows that the UITableView should display. In the table view for Homepwner, there should be a
    // row for each entry in the store.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return itemStore.allItems.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        //  The method dequeueReusableCell(withIdentifier:for:) will check the pool, or queue, of cells to see
        // whether a cell with the correct reuse identifier already exists. If so, it will “dequeue” that cell.
        // If there is not an existing cell, a new cell will be created and returned.

        // Get a new or recycled cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)

        // Set the text on the cell with the description of the item
        // that is at the nth index of items, where n = row this cell
        // will appear in on the tableview
        let item = itemStore.allItems[indexPath.row]

        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = "$\(item.valueInDollars)"

        return cell
    }

    override func tableView(_ tableView: UITableView,
                            commit editingStyle: UITableViewCell.EditingStyle,
                            forRowAt indexPath: IndexPath) {
        // If the table view is asking to commit a delete command
        if editingStyle == .delete {
             let item = itemStore.allItems[indexPath.row]

            // Remove the item from the store
            itemStore.removeItem(item)

            // Also remove that row from the table view with an animation
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }

    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        // Update the model
        itemStore.moveItem(from: sourceIndexPath.row, to: destinationIndexPath.row)
    }

}
