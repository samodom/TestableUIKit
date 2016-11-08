//
//  UITableView.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/22/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

open class UITableView: UIKit.UITableView {

    /*!
        Indicates whether or not the `reloadData` method has been called on this object.
    */
    open var reloadDataCalled = false

    /*!
        Indicates whether or not the `beginUpdates` method has been called on this object.
    */
    open var beginUpdatesCalled = false

    /*!
        Indicates whether or not the `endUpdates` method has been called on this object.
    */
    open var endUpdatesCalled = false

    //  MARK: Sections

    /*!
        Indicates whether or not the `insertSections:withRowAnimation:` method has been called on this object.
    */
    open var insertSectionsCalled = false

    /*!
        Provides the index set of sections that was passed to the `insertSections:withRowAnimation:` method, if called.
    */
    open var insertSectionsIndexSet: IndexSet?

    /*!
        Provides the row animation that was passed to `insertSections:withRowAnimation:` method, if called.
    */
    open var insertSectionsRowAnimation: UITableViewRowAnimation?

    /*!
        Indicates whether or not the `deleteSections:withRowAnimation:` method has been called on this object.
    */
    open var deleteSectionsCalled = false

    /*!
        Provides the index set of sections that was passed to the `deleteSections:withRowAnimation:` method, if called.
    */
    open var deleteSectionsIndexSet: IndexSet?

    /*!
        Provides the row animation that was passed to the `deleteSections:withRowAnimation:` method, if called.
    */
    open var deleteSectionsRowAnimation: UITableViewRowAnimation?

    /*!
        Indicates whether or not the `reloadSections:withRowAnimation:` method has been called on this object.
    */
    open var reloadSectionsCalled = false

    /*!
        Provides the index set of sections that was passed to the `reloadSections:withRowAnimation:` method, if called.
    */
    open var reloadSectionsIndexSet: IndexSet?

    /*!
        Provides the row animation that was passed to the `reloadSections:withRowAnimation:` method, if called.
    */
    open var reloadSectionsRowAnimation: UITableViewRowAnimation?

    /*!
        Indicates whether or not the `moveSection:toSection:` method has been called on this object.
    */
    open var moveSectionCalled = false

    /*!
        Provides the source section index that was passed to the `moveSection:toSection:` method, if called.
    */
    open var moveSectionFromIndex: Int?

    /*!
        Provides the destination section index that was passed to the `moveSection:toSection:` method, if called.
    */
    open var moveSectionToIndex: Int?

    /*!
        Indicates whether or not the `reloadSectionIndexTitles` method has been called on this object.
    */
    open var reloadSectionIndexTitlesCalled = false


    //  MARK: Rows

    /*!
        Indicates whether or not the `insertRowsAtIndexPaths:withRowAnimation:` method has been called on this object.
    */
    open var insertRowsCalled = false

    /*!
        Provides the index paths that were passed to the `insertRowsAtIndexPaths:withRowAnimation:` method, if called.
    */
    open var insertRowsIndexPaths: [IndexPath]?

    /*!
        Provides the row animation that was passed to the `insertRowsAtIndexPaths:withRowAnimation:` method, if called.
    */
    open var insertRowsRowAnimation: UITableViewRowAnimation?

    /*!
        Indicates whether or not the `deleteRowsAtIndexPaths:withRowAnimation:` method has been called on this object.
    */
    open var deleteRowsCalled = false

    /*!
        Provides the index paths that were passed to the `deleteRowsAtIndexPaths:withRowAnimation:` method, if called.
    */
    open var deleteRowsIndexPaths: [IndexPath]?

    /*!
        Provides the row animation that was passed to the `deleteRowsAtIndexPaths:withRowAnimation:` method, if called.
    */
    open var deleteRowsRowAnimation: UITableViewRowAnimation?

    /*!
        Indicates whether or not the `reloadRowsAtIndexPaths:withRowAnimation:` method has been called on this object.
    */
    open var reloadRowsCalled = false

    /*!
        Provides the index paths that were passed to the `reloadRowsAtIndexPaths:withRowAnimation:` method, if called.
    */
    open var reloadRowsIndexPaths: [IndexPath]?

    /*!
        Provides the row animation that was passed to the `reloadRowsAtIndexPaths:withRowAnimation:` method, if called.
    */
    open var reloadRowsRowAnimation: UITableViewRowAnimation?

    /*!
        Indicates whether or not the `moveRowAtIndexPath:toIndexPath:` method has been called on this object.
    */
    open var moveRowCalled = false

    /*!
    Provides the 'from' index path that was passed to the `moveRowAtIndexPath:toIndexPath:` method, if called.
    */
    open var moveRowFromIndexPath: IndexPath?

    /*!
        Provides the 'to' index path that was passed to the `moveRowAtIndexPath:toIndexPath:` method, if called.
    */
    open var moveRowToIndexPath: IndexPath?

    internal var forwardingList = ShimMethodForwardingList(shouldForwardByDefault: true)

}
