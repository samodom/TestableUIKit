`UICollectionView` Spies
========================

All but on of these spies forward all method calls to the original method implementation.  The lone exception is 


**Direct spies:**

* [`reloadData`](#spying-on-reloadData)
* [`performBatchUpdates(_:completion:)`](#spying-on-performBatchUpdates_completion)
* [`insertSections(_:)`](#spying-on-insertSections_)
* [`deleteSections(_:)`](#spying-on-deleteSections_)
* [`reloadSections(_:)`](#spying-on-reloadSections_)
* [`moveSection(_:toSection:)`](#spying-on-moveSection_toSection)
* [`insertItems(at:)`](#spying-on-insertItemsat)
* [`deleteItems(at:)`](#spying-on-deleteItemsat)
* [`reloadItems(at:)`](#spying-on-reloadItemsat)
* [`moveItem(at:to:)`](#spying-on-moveItematto)


## Spying on `reloadData`

Use this spy to validate that a collection view has been asked to reload its data.  The spy controller is named `UICollectionView.ReloadDataSpyController`.

A single evidence property indicates whether the method was called:

* `var reloadDataCalled: Bool`


## Spying on `performBatchUpdates(_:completion:)`

Use this spy to validate that a collection view has been asked to perform batch updates.  The spy controller is named `UICollectionView.PerformBatchUpdatesSpyController`.

Three properties provide evidence about a potential method call:

* `var performBatchUpdatesCalled: Bool`
* `var performBatchUpdatesUpdates: (() -> Void)?`
* `var performBatchUpdatesCompletion: ((Bool) -> Void)?

**Note:** Custom method forwarding is allowed for this spy.  When methods are forwarded, the updates and completion closure properties are not captured since they will be executed by the original method.


## Spying on `insertSections(_:)`

Use this spy to validate that a collection view has been asked to insert some new sections.  The spy controller is named `UICollectionView.InsertSectionsSpyController`.

Two properties provide evidence about a potential method call:

* `var insertSectionsCalled: Bool`
* `var insertSectionsSections: IndexSet?`


## Spying on `deleteSections(_:)`

Use this spy to validate that a collection view has been asked to delete some sections.  The spy controller is named `UICollectionView.DeleteSectionsSpyController`.

Two properties provide evidence about a potential method call:

* `var deleteSectionsCalled: Bool`
* `var deleteSectionsSections: IndexSet?`


## Spying on `reloadSections(_:)`

Use this spy to validate that a collection view has been asked to reload some sections.  The spy controller is named `UICollectionView.ReloadSectionsSpyController`.

Two properties provide evidence about a potential method call:

* `var reloadSectionsCalled: Bool`
* `var reloadSectionsSections: IndexSet?`


## Spying on `moveSection(_:toSection:)`

Use this spy to validate that a collection view has been asked to move a section.  The spy controller is named `UICollectionView.MoveSectionSpyController`.

Three properties provide evidence about a potential method call:

* `var moveSectionCalled: Bool`
* `var moveSectionFromSection: Int?`
* `var moveSectionToSection: Int?`


## Spying on `insertItems(at:)`

Use this spy to validate that a collection view has been asked to insert some new items.  The spy controller is named `UICollectionView.InsertItemsSpyController`.

Two properties provide evidence about a potential method call:

* `var insertItemsCalled: Bool`
* `var insertItemsItems: [IndexPath]?`


## Spying on `deleteItems(at:)`

Use this spy to validate that a collection view has been asked to delete some items.  The spy controller is named `UICollectionView.DeleteItemsSpyController`.

Two properties provide evidence about a potential method call:

* `var deleteItemsCalled: Bool`
* `var deleteItemsItems: [IndexPath]?`


## Spying on `reloadItems(at:)`

Use this spy to validate that a collection view has been asked to reload some items.  The spy controller is named `UICollectionView.ReloadItemsSpyController`.

Two properties provide evidence about a potential method call:

* `var reloadItemsCalled: Bool`
* `var reloadItemsItems: [IndexPath]?`


## Spying on `moveItem(at:to:)`

Use this spy to validate that a collection view has been asked to move an item.  The spy controller is named `UICollectionView.MoveItemSpyController`.

Three properties provide evidence about a potential method call:

* `var moveItemCalled: Bool`
* `var moveItemFromItem: IndexPath?`
* `var moveItemToItem: IndexPath?`
