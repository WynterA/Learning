#  Chapter 10 Notes

A UITableView is a view object. Recall that in the MVC design pattern, which iOS developers do their best to follow, each class falls into exactly one of the following categories:
- **model**: holds data and knows nothing about the UI
- **view**: is visible to the user and knows nothing about the model objects
- **controller**: keeps the UI and the model objects in sync and controls the flow of the application


#### TableViews and Controller

As a view object, a `UITableView` does not handle application logic or data. When using a `UITableView`, you must
consider what else is necessary to get the table working in your application:
- A `UITableView` typically needs a view controller to handle its appearance on the screen.
- A `UITableView` needs a data source. A `UITableView` asks its data source for the number of rows to display, the data to be shown in those rows, and other tidbits that make a `UITableView` a useful UI. Without a data source, a table view is just an empty container. The dataSource for a `UITableView` can be any type of object as long as it conforms to the `UITableViewDataSource` protocol.
- A `UITableView` typically needs a delegate that can inform other objects of events involving the `UITableView`. The delegate can be any object as long as it conforms to the `UITableViewDelegate` protocol.

An instance of the class `UITableViewController` can fill all three roles: view controller, data source, and delegate.
`UITableViewController` is a subclass of `UIViewController` and therefore has a view. A `UITableViewController’s` view is always an instance of `UITableView`, and the `UITableViewController` handles the preparation and presentation of the `UITableView`.
When a `UITableViewController` creates its view, the dataSource and delegate properties of the `UITableView` are automatically set to point at the `UITableViewController`


#### Dependency Inversion Principle

Why didn’t the `ItemsViewController` instance itself just create an instance of the store? The reason for this approach is
based on a fairly complex topic called the dependency inversion principle. The essential goal of this principle is to decouple objects in an application by inverting certain dependencies between them. This results in more robust and maintainable code.

The **dependency inversion principle** states that:
1. High-level objects should not depend on low-level objects. Both should depend on abstractions. 
2. Abstractions should not depend on details. Details should depend on abstractions.

The abstraction required by the dependency inversion principle in **Homepwner** is the concept of a “store.” A store is a lower-level object that retrieves and saves Item instances through details that are only known to that class. `ItemsViewController` is a higher-level object that only knows that it will be provided with a utility object (the store) from which it can obtain a list of Item instances and to which it can pass new or updated Item instances to be stored persistently. This results in a decoupling because ItemsViewController is not dependent on ItemStore. In fact, as long as the store abstraction is respected, ItemStore could be replaced by another object that fetches Item instances differently (such as by using a web service) without any changes to `ItemsViewController`.

A common pattern used when implementing the dependency inversion principle is dependency injection. In its simplest form, higher-level objects do not assume which lower-level objects they need to use. Instead, those are passed to them through an initializer or property. In your implementation of ItemsViewController, you used injection through a property to give it a store.

For `ItemsViewController` to conform to `UITableViewDataSource`, it must implement `tableView(_:numberOfRowsInSection:) and tableView(_:cellForRowAt:)`. These methods tell the table view how many rows it should display and what content to display in each row.

#### Sections and Cells

Table views can be broken up into sections, with each section having its own set of rows. For example, in the address book, all names beginning with “C” are grouped together in a section. By default, a table view has one section, and in this chapter you will work with only one. Once you understand how a table view works, it is not hard to use multiple sections.

Each row of a table view is a view. These views are instances of `UITableViewCell`. In this section, you will create the instances of `UITableViewCell` to fill the table view.
A cell itself has one subview – its contentView (Figure 10.8). The contentView is the superview for the content of the cell. The cell may also have an accessory view. The accessory view shows an action-oriented icon, such as a checkmark, a disclosure icon, or an information button.

The real meat of a `UITableViewCell` is the contentView, which has three subviews of its own (Figure 10.9).
Two of those subviews are `UILabel` instances that are properties of `UITableViewCell` named textLabel and detailTextLabel. The third subview is a `UIImageView` called imageView. In this chapter, you will use textLabel and detailTextLabel.
Each cell also has a `UITableViewCellStyle` that determines which subviews are used and their position within the contentView. Examples of these styles and their constants are shown in Figure 10.10.
How do you decide which cell an Item corresponds to? One of the parameters sent to `tableView(_:cellForRowAt:)` is an IndexPath, which has two properties: section and row. When this method is called on a data source, the table view is asking, “Can I have a cell to display in section X, row Y?” Because there is only one section in this exercise, your implementation will only be concerned with the index path’s row.

