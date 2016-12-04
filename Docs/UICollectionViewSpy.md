`UICollectionView ` Spy
=======================

> This spy forwards all methods by default.


**Available spy methods:**

* [`reloadData`](#spying-on-reloadData)
* [`insertSections(_:)`](#spying-on-insertSections_)
* [`deleteSections(_:)`](#spying-on-deleteSections_)
* [`reloadSections(_:)`](#spying-on-reloadSections_)
* [`moveSection(_:toSection:)`](#spying-on-moveSection_toSection)
* [`insertItems(at:)`](#spying-on-insertItemsat)
* [`deleteItems(at:)`](#spying-on-deleteItemsat)
* [`reloadItems(at:)`](#spying-on-reloadItemsat)
* [`moveItem(at:to:)`](#spying-on-moveItematto)


## Spying on `reloadData`

Use this spy to validate that a collection view has been asked to reload its data.

### Spy Methods

* `spyOnReloadData(in:)`
* `beginSpyingOnReloadData`
* `endSpyingOnReloadData`

### Spy Variables

* `var reloadDataCalled: Bool`


## Spying on `insertSections(_:)`

Use this spy to validate that a collection view has been asked to insert some new sections.

### Spy Methods

* `spyOnReloadSections(in:)`
* `beginSpyingOnReloadSections`
* `endSpyingOnReloadSections`

### Spy Variables

* `var insertSectionsCalled: Bool`
* `var insertSectionsSections: IndexSet?`


## Spying on `deleteSections(_:)`

Use this spy to validate that a collection view has been asked to delete some sections.

### Spy Methods

* `spyOnDeleteSections(in:)`
* `beginSpyingOnDeleteSections`
* `endSpyingOnDeleteSections`

### Spy Variables

* `var deleteSectionsCalled: Bool`
* `var deleteSectionsSections: IndexSet?`


## Spying on `reloadSections(_:)`

Use this spy to validate that a collection view has been asked to reload some sections.

### Spy Methods

* `spyOnReloadSections(in:)`
* `beginSpyingOnReloadSections`
* `endSpyingOnReloadSections`

### Spy Variables

* `var reloadSectionsCalled: Bool`
* `var reloadSectionsSections: IndexSet?`


## Spying on `moveSection(_:toSection:)`

Use this spy to validate that a collection view has been asked to move a section.

### Spy Methods

* `spyOnMoveSection(in:)`
* `beginSpyingOnMoveSection`
* `endSpyingOnMoveSection`

### Spy Variables

* `var moveSectionCalled: Bool`
* `var moveSectionFromSection: Int?`
* `var moveSectionToSection: Int?`


## Spying on `insertItems(at:)`

Use this spy to validate that a collection view has been asked to insert some new items.

### Spy Methods

* `spyOnInsertItems(in:)`
* `beginSpyingOnInsertItems`
* `endSpyingOnInsertItems`

### Spy Variables

* `var insertItemsCalled: Bool`
* `var insertItemsItems: [IndexPath]?`


## Spying on `deleteItems(at:)`

Use this spy to validate that a collection view has been asked to delete some items.

### Spy Methods

* `spyOnDeleteItems(in:)`
* `beginSpyingOnDeleteItems`
* `endSpyingOnDeleteItems`

### Spy Variables

* `var deleteItemsCalled: Bool`
* `var deleteItemsItems: [IndexPath]?`


## Spying on `reloadItems(at:)`

Use this spy to validate that a collection view has been asked to reload some items.

### Spy Methods

* `spyOnReloadItems(in:)`
* `beginSpyingOnReloadItems`
* `endSpyingOnReloadItems`

### Spy Variables

* `var reloadItemsCalled: Bool`
* `var reloadItemsItems: [IndexPath]?`


## Spying on `moveItem(at:to:)`

Use this spy to validate that a collection view has been asked to move an item.

### Spy Methods

* `spyOnMoveItem(in:)`
* `beginSpyingOnMoveItem`
* `endSpyingOnMoveItem`

### Spy Variables

* `var moveItemCalled: Bool`
* `var moveItemFromItem: IndexPath?`
* `var moveItemToItem: IndexPath?`
