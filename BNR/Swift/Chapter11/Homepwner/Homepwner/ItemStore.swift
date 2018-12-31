//
//  ItemStore.swift
//  Homepwner
//
//         ItemStore is a Swift base class – it does not inherit from any other class.
//      Unlike the Item class ItemStore does not require any of the behavior that NSObject affords.
//
//        The ItemsViewController will call a method on ItemStore when it wants a
//      new Item to be created. The ItemStore will oblige, creating the object
//      and adding it to an array of instances of Item.
//
//      Take a look at the following code listing that illustrates this effect.
//         - This is OK
//          let newItem = itemStore.createItem()
//         - This is also OK; the result is not assigned to a variable
//          itemStore.createItem()
//
//      A store is a lower-level object that retrieves and saves Item instances
//      through details that are only known to that class.
//
//  Created by Arie Myrmo on 10/4/18.
//  Copyright © 2018 WynterVate. All rights reserved.
//

import UIKit

class ItemStore {

    var allItems = [Item]()

    // optional now that we have the functionality to add our own items to the store
    // designated initialzer - adds five random items
    init() {
        for _ in 0..<5 {
            createItem()
        }
    }

    // The @discardableResult annotation means that a caller of this function is free to ignore the result of calling this function.
    @discardableResult func createItem() -> Item {
        let newItem = Item(random: true)

        allItems.append(newItem)

        return newItem
    }

    func removeItem(_ item: Item) {
        if let index = allItems.index(of: item) {
            allItems.remove(at: index)
        }
    }

    func moveItem(from fromIndex: Int, to toIndex: Int) {
        if fromIndex == toIndex {
            return
        }

        // Get reference to object being moved so you can reinsert it
        let movedItem = allItems[fromIndex]

        // Remove item from array
        allItems.remove(at: fromIndex)

        // Insert item in array at new location
        allItems.insert(movedItem, at: toIndex)
    }
}
