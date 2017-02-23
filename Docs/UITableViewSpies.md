`UITableView` Spy
=================

These spies forward all method calls to the original method implementation.


**Direct spies:**

* [`reloadData`](#spying-on-reloadData)
* [`beginUpdates`](#spying-on-beginUpdates)
* [`endUpdates`](#spying-on-endUpdates)
* [`insertSections(_:with:)`](#spying-on-insertSections_with)
* [`deleteSections(_:with:)`](#spying-on-deleteSections_with)
* [`reloadSections(_:with:)`](#spying-on-reloadSections_with)
* [`moveSection(_:toSection:)`](#spying-on-moveSection_toSection)
* [`reloadSectionIndexTitles`](#spying-on-reloadSectionIndexTitles)
* [`insertRows(at:with:)`](#spying-on-insertRowsatwith)
* [`deleteRows(at:with:)`](#spying-on-deleteRowsatwith)
* [`reloadRows(at:with:)`](#spying-on-reloadRowsatwith)
* [`moveRow(at:to:)`](#spying-on-moveRowatto)


## Spying on `reloadData`

Use this spy to validate that a table view has been asked to reload its data.  The spy controller is named `UITableView.ReloadDataSpyController`.

A single evidence property indicates whether the method was called:

* `var reloadDataCalled: Bool`


## Spying on `beginUpdates`

Use this spy to validate that a table view has been asked to begin updates.  The spy controller is named `UITableView.BeginUpdatesSpyController`.

A single evidence property indicates whether the method was called:

* `var beginUpdatesCalled: Bool`


## Spying on `endUpdates`

Use this spy to validate that a table view has been asked to end updates.  The spy controller is named `UITableView.EndUpdatesSpyController`.

A single evidence property indicates whether the method was called:

* `var endUpdatesCalled: Bool`


## Spying on `insertSections(_:with:)`

Use this spy to validate that a table view has been asked to insert some new sections with optional animation.  The spy controller is named `UITableView.InsertSectionsSpyController`.

Three properties provide evidence about a potential method call:

* `var insertSectionsCalled: Bool`
* `var insertSectionsSections: IndexSet?`
* `var insertSectionsAnimation: UITableViewRowAnimation?`


## Spying on `deleteSections(_:with:)`

Use this spy to validate that a table view has been asked to delete some sections with optional animation.  The spy controller is named `UITableView.DeleteSectionsSpyController`.

Three properties provide evidence about a potential method call:

* `var deleteSectionsCalled: Bool`
* `var deleteSectionsSections: IndexSet?`
* `var deleteSectionsAnimation: UITableViewRowAnimation?`


## Spying on `reloadSections(_:with:)`

Use this spy to validate that a table view has been asked to reload some sections with optional animation.  The spy controller is named `UITableView.ReloadSectionsSpyController`.

Three properties provide evidence about a potential method call:

* `var reloadSectionsCalled: Bool`
* `var reloadSectionsSections: IndexSet?`
* `var reloadSectionsAnimation: UITableViewRowAnimation?`


## Spying on `moveSection(_:toSection:)`

Use this spy to validate that a table view has been asked to move a section.  The spy controller is named `UITableView.MoveSectionSpyController`.

Three properties provide evidence about a potential method call:

* `var moveSectionCalled: Bool`
* `var moveSectionFromSection: Int?`
* `var moveSectionToSection: Int?`


## Spying on `reloadSectionIndexTitles `

Use this spy to validate that a table view has been asked to reload its section index titles.  The spy controller is named `UITableView.ReloadSectionIndexTitlesSpyController`.

A single evidence property indicates whether the method was called:

* `var reloadSectionIndexTitlesCalled: Bool`


## Spying on `insertRows(at:with:)`

Use this spy to validate that a table view has been asked to insert some new rows with optional animation.  The spy controller is named `UITableView.InsertRowsSpyController`.

Three properties provide evidence about a potential method call:

* `var insertRowsCalled: Bool`
* `var insertRowsRows: [IndexPath]?`
* `var insertRowsAnimation: UITableViewRowAnimation?`


## Spying on `deleteRows(at:with:)`

Use this spy to validate that a table view has been asked to delete some rows with optional animation.  The spy controller is named `UITableView.DeleteRowsSpyController`.

Three properties provide evidence about a potential method call:

* `var deleteRowsCalled: Bool`
* `var deleteRowsRows: [IndexPath]?`
* `var deleteRowsAnimation: UITableViewRowAnimation?`


## Spying on `reloadRows(at:with:)`

Use this spy to validate that a table view has been asked to reload some rows with optional animation.  The spy controller is named `UITableView.ReloadRowsSpyController`.

Three properties provide evidence about a potential method call:

* `var reloadRowsCalled: Bool`
* `var reloadRowsRows: [IndexPath]?`
* `var reloadRowsAnimation: UITableViewRowAnimation?`


## Spying on `moveRow(at:to:)`

Use this spy to validate that a table view has been asked to move a row.  The spy controller is named `UITableView.MoveRowSpyController`.

Three properties provide evidence about a potential method call:

* `var moveRowCalled: Bool`
* `var moveRowFromRow: IndexPath?`
* `var moveRowToRow: IndexPath?`
