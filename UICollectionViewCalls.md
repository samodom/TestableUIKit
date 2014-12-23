### Capturing calls to `UICollectionView` methods

Each of the methods below have spy method equivalents that capture the calls to the method and any parameters, if available.  The properties listed below the method names list the new properties of `UICollectionView` that you can use to validate method calls.


`reloadData`
 - `var reloadDataCalled: Bool`

`insertSections:`
 - `var insertSectionsCalled: Bool`
 - `var insertSectionsIndexSet: NSIndexSet?`

`deleteSections:`
 - `var deleteSectionsCalled: Bool`
 - `var deleteSectionsIndexSet: NSIndexSet?`

`reloadSections:`
 - `var reloadSectionsCalled: Bool`
 - `var reloadSectionsIndexSet: NSIndexSet?`

`moveSection:toSection:`
 - `var moveSectionCalled: Bool`
 - `var moveSectionFromIndex: Int?`
 - `var moveSectionToIndex: Int?`

`insertItemsAtIndexPaths:`
 - `var insertItemsCalled: Bool`
 - `var insertItemsIndexPaths: [NSIndexPath]?`

`deleteItemsAtIndexPaths:`
 - `var deleteItemsCalled: Bool`
 - `var deleteItemsIndexPaths: [NSIndexPath]?`

`reloadItemsAtIndexPaths:`
 - `var reloadItemsCalled: Bool`
 - `var reloadItemsIndexPaths: [NSIndexPath]?`

`moveItemAtIndexPath:toIndexPath:`
 - `var moveItemCalled: Bool`
 - `var moveItemFromIndexPath: NSIndexPath?`
 - `var moveItemToIndexPath: NSIndexPath?`


> After capturing the call to the method, these spies forward the call to the superclass (real) implementation.  If you would like for any of these spies to not forward the method call to the superclass implementation, simply insert the following call at the beginning of your test with an appropriate selector:
>
> `myCollectionView.setShouldForwardMethodCallWithSelector("reloadData", false)`
>
> This can be reversed in your test at any time by another call to the same method with the value `true`.
