//
//  ItemsViewController.swift
//  Homepwner
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

    
}
