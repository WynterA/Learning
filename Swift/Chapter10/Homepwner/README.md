#  Chapter: 10 UITableView and UITableViewController Notes


Why didn’t the ItemsViewController instance itself just create an instance of the store? The reason for this approach is
based on a fairly complex topic called the dependency inversion principle. The essential goal of this principle is to decouple objects in an application by inverting certain dependencies between them. This results in more robust and maintainable code.

The dependency inversion principle states that:
1. High-level objects should not depend on low-level objects. Both should depend on abstractions. 
2. Abstractions should not depend on details. Details should depend on abstractions.

The abstraction required by the dependency inversion principle in Homepwner is the concept of a “store.” A store is a lower-level object that retrieves and saves Item instances through details that are only known to that class. ItemsViewController is a higher-level object that only knows that it will be provided with a utility object (the store) from which it can obtain a list of Item instances and to which it can pass new or updated Item instances to be stored persistently. This results in a decoupling because ItemsViewController is not dependent on ItemStore. In fact, as long as the store abstraction is respected, ItemStore could be replaced by another object that fetches Item instances differently (such as by using a web service) without any changes to ItemsViewController.

A common pattern used when implementing the dependency inversion principle is dependency injection. In its simplest form, higher-level objects do not assume which lower-level objects they need to use. Instead, those are passed to them through an initializer or property. In your implementation of ItemsViewController, you used injection through a property to give it a store.


