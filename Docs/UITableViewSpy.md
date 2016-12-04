`UITableView` Spy
=================

> This spy forwards all methods by default.


**Available spy methods:**

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

Use this spy to validate that a table view has been asked to reload its data.

### Spy Methods

* `spyOnReloadData(in:)`
* `beginSpyingOnReloadData`
* `endSpyingOnReloadData`

### Spy Variables

* `var reloadDataCalled: Bool`


## Spying on `beginUpdates`

Use this spy to validate that a table view has been asked to begin updates.

### Spy Methods

* `spyOnBeginUpdates(in:)`
* `beginSpyingOnBeginUpdates`
* `endSpyingOnBeginUpdates`

### Spy Variables

* `var beginUpdatesCalled: Bool`


## Spying on `endUpdates`

Use this spy to validate that a table view has been asked to end updates.

### Spy Methods

* `spyOnEndUpdates(in:)`
* `beginSpyingOnEndUpdates`
* `endSpyingOnEndUpdates`

### Spy Variables

* `var endUpdatesCalled: Bool`


## Spying on `insertSections(_:with:)`

Use this spy to validate that a table view has been asked to insert some new sections with optional animation.

### Spy Methods

* `spyOnReloadSections(in:)`
* `beginSpyingOnReloadSections`
* `endSpyingOnReloadSections`

### Spy Variables

* `var insertSectionsCalled: Bool`
* `var insertSectionsSections: IndexSet?`
* `var insertSectionsAnimation: UITableViewRowAnimation?`


## Spying on `deleteSections(_:with:)`

Use this spy to validate that a table view has been asked to delete some sections with optional animation.

### Spy Methods

* `spyOnDeleteSections(in:)`
* `beginSpyingOnDeleteSections`
* `endSpyingOnDeleteSections`

### Spy Variables

* `var deleteSectionsCalled: Bool`
* `var deleteSectionsSections: IndexSet?`
* `var deleteSectionsAnimation: UITableViewRowAnimation?`


## Spying on `reloadSections(_:with:)`

Use this spy to validate that a table view has been asked to reload some sections with optional animation.

### Spy Methods

* `spyOnReloadSections(in:)`
* `beginSpyingOnReloadSections`
* `endSpyingOnReloadSections`

### Spy Variables

* `var reloadSectionsCalled: Bool`
* `var reloadSectionsSections: IndexSet?`
* `var reloadSectionsAnimation: UITableViewRowAnimation?`


## Spying on `moveSection(_:toSection:)`

Use this spy to validate that a table view has been asked to move a section.

### Spy Methods

* `spyOnMoveSection(in:)`
* `beginSpyingOnMoveSection`
* `endSpyingOnMoveSection`

### Spy Variables

* `var moveSectionCalled: Bool`
* `var moveSectionFromSection: Int?`
* `var moveSectionToSection: Int?`


## Spying on `reloadSectionIndexTitles `

Use this spy to validate that a table view has been asked to reload its section index titles.

### Spy Methods

* `spyOnReloadSectionIndexTitles(in:)`
* `beginSpyingOnReloadSectionIndexTitles`
* `endSpyingOnReloadSectionIndexTitles`

### Spy Variables

* `var reloadSectionIndexTitlesCalled: Bool`


## Spying on `insertRows(at:with:)`

Use this spy to validate that a table view has been asked to insert some new rows with optional animation.

### Spy Methods

* `spyOnInsertRows(in:)`
* `beginSpyingOnInsertRows`
* `endSpyingOnInsertRows`

### Spy Variables

* `var insertRowsCalled: Bool`
* `var insertRowsRows: [IndexPath]?`
* `var insertRowsAnimation: UITableViewRowAnimation?`


## Spying on `deleteRows(at:with:)`

Use this spy to validate that a table view has been asked to delete some rows with optional animation.

### Spy Methods

* `spyOnDeleteRows(in:)`
* `beginSpyingOnDeleteRows`
* `endSpyingOnDeleteRows`

### Spy Variables

* `var deleteRowsCalled: Bool`
* `var deleteRowsRows: [IndexPath]?`
* `var deleteRowsAnimation: UITableViewRowAnimation?`


## Spying on `reloadRows(at:with:)`

Use this spy to validate that a table view has been asked to reload some rows with optional animation.

### Spy Methods

* `spyOnReloadRows(in:)`
* `beginSpyingOnReloadRows`
* `endSpyingOnReloadRows`

### Spy Variables

* `var reloadRowsCalled: Bool`
* `var reloadRowsRows: [IndexPath]?`
* `var reloadRowsAnimation: UITableViewRowAnimation?`


## Spying on `moveRow(at:to:)`

Use this spy to validate that a table view has been asked to move a row.

### Spy Methods

* `spyOnMoveRow(in:)`
* `beginSpyingOnMoveRow`
* `endSpyingOnMoveRow`

### Spy Variables

* `var moveRowCalled: Bool`
* `var moveRowFromRow: IndexPath?`
* `var moveRowToRow: IndexPath?`
