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

}
