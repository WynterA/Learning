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
