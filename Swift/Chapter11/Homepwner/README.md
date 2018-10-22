#  Swift Chapter 11 Notes
## Editing UITableView
---

### Editing Mode
`UITableView` has an editing property, and when this property is set to true, the `UITableView` enters editing mode. In editing mode the rows of the table can be edited by the user. Note, editing mode does **not** allow the user to edit the **content** of a row.

- A _header view_ appears at the top of a table and is useful for adding section-wide or table-wide titles and controls. It can be any `UIView` instance
- Note that the table view uses the word "header" in two different ways:
- There can be a table header and section headers
- Likewise there can be table and section footers

### Adding Rows
There are two common interfaces for adding rows to a table view at runtime.
- _A button above the cells of the table view:_ usually for adding a record for which there is a detail view.
- _A cell with a green plus sign:_ usally adding a new field to a record
NOTE:
- You must make sure the `UITableView` and its `dataSource` agree on the number of rows by adding a new **Item** to the **ItemStore** before inserting the new row.

### Deleting Rows
> Before the table view will delete a row, it calls a method on its data source about the proposed deletion and waits for confirmation.
- When deleting a cell, you must do two things: remove the row from the `UITableView` and remove the `Item` associated with it from the `ItemStore`. To pull this off, the `ItemStore` must know how to remove objects from itself.
- Now you will implement `tableView(_:commit:forRow:)`, a method from the `UITableViewDataSource` protocol. (This method is called on the `ItemsViewController`. Keep in mind that while the `ItemStore` is where the data is kept, the `ItemsViewController` is the table view’s dataSource.)

### Moving Rows
- To change the order of rows in a `UITableView`, you will use another method from the `UITableViewDataSource` protocol – `tableView(_:moveRowAt:to:)`
- To delete a row, you had to call the method `deleteRows(at:with:)` on the `UITableView` to confirm the deletion. Moving a row, however, does not require confirmation: The table view moves the row on its own authority and reports the move to its data source by calling the `methodtableView(_:moveRowAt:to:)`. You implement this method to update your data source to match the new order.
- But before you can implement this method, you need to give the `ItemStore` a method to change the order of items in its allItems array.
- Note that simply implementing `tableView(_:moveRowAt:to:)` caused the reordering controls to appear. The `UITableView` can ask its data source at runtime whether it implements `tableView(_:moveRowAt:to:)`. If it does, then the table view adds the reordering controls whenever the table view enters editing mode.

### Displaying User Alerts
- Alerts are often used to warn users that an important action is about to happen and perhaps give them
the opportunity to cancel that action. When you want to display an alert, you create an instance of `UIAlertController` with a preferred style. The two available styles are `UIAlertControllerStyle.actionSheet` and `UIAlertControllerStyle.alert`
- The `.actionSheet` style is used to present the user with a list of actions from which to choose. The `.alert` type is used to display critical information to require the user to decide how to proceed. The distinction may seem subtle, but if the user can back out of a decision or if the action is not critical, then an .actionSheet is probably the best choice.
You are going to use a `UIAlertController` to confirm the deletion of items. You will use the `.actionSheet` style because the purpose of the alert is to confirm or cancel a possibly destructive action.
- Add actions...
- Now that the actions have been added, the alert controller can be displayed to the user. Because `UIAlertController` is a subclass of `UIViewController`, you can present it to the user **_modally_**. A _**modal view controller**_ takes over the entire screen until it has finished its work.
- To present a view controller modally, you call **`present(_:animated:completion:)`** on the view controller whose view is on the screen. The view controller to be presented is passed to it, and this view controller’s view takes over the screen.

### Design Patterns
- A **_design pattern_** solves a common software engineering problem. Design patterns are not actual snippets of code, but instead are abstract ideas or approaches that you can use in your applications. Good design patterns are valuable and powerful tools for any developer.
- The consistent use of design patterns throughout the development process reduces the mental overhead in solving a problem so you can create complex applications more easily and rapidly. Here are some of the design patterns that you have already used:
- **_Delegation:_** One object delegates certain responsibilities to another object. You used delegation with the `UITextField` to be informed when the contents of the text field change.
- **_Data source:_** A data source is similar to a delegate, but instead of reacting to another object, a data source is responsible for providing data to another object when requested. You used the data source pattern with table views: Each table view has a data source that is responsible for, at a minimum, telling the table view how many rows to display and which cell it should display at each index path.
- **_Model-View-Controller:_** Each object in your applications fulfills one of three roles. Model objects are the data. Views display the UI. Controllers provide the glue that ties the models and views together.
- **_Target-action pairs:_** One object calls a method on another object when a specific event occurs. The target is the object that has a method called on it, and the action is the method being called. For example, you used target- action pairs with buttons: When a touch event occurs, a method will be called on another object (often a view controller).




