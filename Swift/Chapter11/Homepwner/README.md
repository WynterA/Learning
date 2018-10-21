#  Swift Chapter 11 Notes
---


### Editing Mode
`UITableView` has an editing property, and when this property is set to true, the `UITableView` enters editing mode. In editing mode the rows of the table can be edited by the user. Note, editing mode does **not** allow the user to edit the **content** of a row.

- A _header view_ appears at the top of a table and is useful for adding section-wide or table-wide titles and controls. It can be any `UIView` instance
- Note that the table view uses the word "header" in two different ways:
- There can be a table header and section headers
- Likewise there can be table and section footers

