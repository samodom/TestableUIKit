### Capturing calls to `UITableView` methods

Each of the methods below have spy method equivalents that capture the calls to the method and any parameters, if available.  The properties listed below the method names list the new properties of `UITableView` that you can use to validate method calls.


`reloadData`
 - `var reloadDataCalled: Bool`

`beginUpdates`
 - `var beginUpdatesCalled: Bool`

`endUpdates`
 - `var endUpdatesCalled: Bool`

`insertSections:withRowAnimation:`
 - `var insertSectionsCalled: Bool`
 - `var insertSectionsIndexSet: NSIndexSet?`
 - `var insertSectionsRowAnimation: UITableViewRowAnimation?`

`deleteSections:withRowAnimation:`
 - `var deleteSectionsCalled: Bool`
 - `var deleteSectionsIndexSet: NSIndexSet?`
 - `var deleteSectionsRowAnimation: UITableViewRowAnimation?`

`reloadSections:withRowAnimation:`
 - `var reloadSectionsCalled: Bool`
 - `var reloadSectionsIndexSet: NSIndexSet?`
 - `var reloadSectionsRowAnimation: UITableViewRowAnimation?`

`moveSection:toSection:`
 - `var moveSectionCalled: Bool`
 - `var moveSectionFromIndex: Int?`
 - `var moveSectionToIndex: Int?`

`reloadSectionIndexTitles`
 - `var reloadSectionIndexTitlesCalled: Bool`

`insertRowsAtIndexPaths:withRowAnimation:`
 - `var insertRowsCalled: Bool`
 - `var insertRowsIndexPaths: [NSIndexPath]?`
 - `var insertRowsRowAnimation: UITableViewRowAnimation?`

`deleteRowsAtIndexPaths:withRowAnimation:`
 - `var deleteRowsCalled: Bool`
 - `var deleteRowsIndexPaths: [NSIndexPath]?`
 - `var deleteRowsRowAnimation: UITableViewRowAnimation?`

`reloadRowsAtIndexPaths:withRowAnimation:`
 - `var reloadRowsCalled: Bool`
 - `var reloadRowsIndexPaths: [NSIndexPath]?`
 - `var reloadRowsRowAnimation: UITableViewRowAnimation?`

`moveRowAtIndexPath:toIndexPath:`
 - `var moveRowCalled: Bool`
 - `var moveRowFromIndexPath: NSIndexPath?`
 - `var moveRowToIndexPath: NSIndexPath?`


> After capturing the call to the method, these spies forward the call to the superclass (real) implementation.  If you would like for any of these spies to not forward the method call to the superclass implementation, simply insert the following call at the beginning of your test with an appropriate selector:
>
> `myTableView.setShouldForwardMethodCallWithSelector("reloadData", false)`
>
> This can be reversed in your test at any time by another call to the same method with the value `true`.
