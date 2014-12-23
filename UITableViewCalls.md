### Capturing calls to `UITableView` methods

Each of the methods below have spy method equivalents that capture the calls to the method and any parameters, if available.  The properties listed below the method names list the new properties of `UITableView` that you can use to validate method calls.


`reloadData`
 - var reloadDataCalled

`beginUpdates`
 - var beginUpdatesCalled

`endUpdates`
 - var endUpdatesCalled

`insertSections:withRowAnimation:`
 - var insertSectionsCalled
 - var insertSectionsIndexSet: NSIndexSet?
 - var insertSectionsRowAnimation: UITableViewRowAnimation?

`deleteSections:withRowAnimation:`
 - var deleteSectionsCalled
 - var deleteSectionsIndexSet: NSIndexSet?
 - var deleteSectionsRowAnimation: UITableViewRowAnimation?

`reloadSections:withRowAnimation:`
 - var reloadSectionsCalled
 - var reloadSectionsIndexSet: NSIndexSet?
 - var reloadSectionsRowAnimation: UITableViewRowAnimation?

`moveSection:toSection:`
 - var moveSectionCalled
 - var moveSectionFromIndex: Int?
 - var moveSectionToIndex: Int?

`reloadSectionIndexTitles`
 - var reloadSectionIndexTitlesCalled

`insertRowsAtIndexPaths:withRowAnimation:`
 - var insertRowsCalled
 - var insertRowsIndexPaths: [NSIndexPath]?
 - var insertRowsRowAnimation: UITableViewRowAnimation?

`deleteRowsAtIndexPaths:withRowAnimation:`
 - var deleteRowsCalled
 - var deleteRowsIndexPaths: [NSIndexPath]?
 - var deleteRowsRowAnimation: UITableViewRowAnimation?

`reloadRowsAtIndexPaths:withRowAnimation:`
 - var reloadRowsCalled
 - var reloadRowsIndexPaths: [NSIndexPath]?
 - var reloadRowsRowAnimation: UITableViewRowAnimation?

`moveRowAtIndexPath:toIndexPath:`
 - var moveRowCalled
 - var moveRowFromIndexPath: NSIndexPath?
 - var moveRowToIndexPath: NSIndexPath?


> After capturing the call to the method, these spies forward the call to the superclass (real) implementation.  If you would like for any of these spies to not forward the method call to the superclass implementation, simply insert the following call at the beginning of your test with an appropriate selector:
>
> `myTableView.setShouldForwardMethodCallWithSelector("reloadData", false)`
>
> This can be reversed in your test at any time by another call to the same method with the value `true`.
