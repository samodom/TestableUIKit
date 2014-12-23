//
//  UITableView.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/22/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

public class UITableView: UIKit.UITableView {

    /**
      Indicates whether or not the `reloadData` method has been called on this object.
    */
    public var reloadDataCalled = false

    /**
      Indicates whether or not the `beginUpdates` method has been called on this object.
    */
    public var beginUpdatesCalled = false

    /**
      Indicates whether or not the `endUpdates` method has been called on this object.
    */
    public var endUpdatesCalled = false

    //  MARK: Sections

    /**
      Indicates whether or not the `insertSections:withRowAnimation:` method has been called on this object.
    */
    public var insertSectionsCalled = false

    /**
      Provides the index set of sections that was passed to the `insertSections:withRowAnimation:` method, if called.
    */
    public var insertSectionsIndexSet: NSIndexSet?

    /**
      Provides the row animation that was passed to `insertSections:withRowAnimation:` method, if called.
    */
    public var insertSectionsRowAnimation: UITableViewRowAnimation?

    /**
      Indicates whether or not the `deleteSections:withRowAnimation:` method has been called on this object.
    */
    public var deleteSectionsCalled = false

    /**
      Provides the index set of sections that was passed to the `deleteSections:withRowAnimation:` method, if called.
    */
    public var deleteSectionsIndexSet: NSIndexSet?

    /**
      Provides the row animation that was passed to the `deleteSections:withRowAnimation:` method, if called.
    */
    public var deleteSectionsRowAnimation: UITableViewRowAnimation?

    /**
      Indicates whether or not the `reloadSections:withRowAnimation:` method has been called on this object.
    */
    public var reloadSectionsCalled = false

    /**
      Provides the index set of sections that was passed to the `reloadSections:withRowAnimation:` method, if called.
    */
    public var reloadSectionsIndexSet: NSIndexSet?

    /**
      Provides the row animation that was passed to the `reloadSections:withRowAnimation:` method, if called.
    */
    public var reloadSectionsRowAnimation: UITableViewRowAnimation?

    /**
      Indicates whether or not the `moveSection:toSection:` method has been called on this object.
    */
    public var moveSectionCalled = false

    /**
      Provides the source section index that was passed to the `moveSection:toSection:` method, if called.
    */
    public var moveSectionFromIndex: Int?

    /**
      Provides the destination section index that was passed to the `moveSection:toSection:` method, if called.
    */
    public var moveSectionToIndex: Int?

    /**
      Indicates whether or not the `reloadSectionIndexTitles` method has been called on this object.
    */
    public var reloadSectionIndexTitlesCalled = false


    //  MARK: Rows

    /**
      Indicates whether or not the `insertRowsAtIndexPaths:withRowAnimation:` method has been called on this object.
    */
    public var insertRowsCalled = false

    /**
      Provides the index paths that were passed to the `insertRowsAtIndexPaths:withRowAnimation:` method, if called.
    */
    public var insertRowsIndexPaths: [NSIndexPath]?

    /**
      Provides the row animation that was passed to the `insertRowsAtIndexPaths:withRowAnimation:` method, if called.
    */
    public var insertRowsRowAnimation: UITableViewRowAnimation?

    /**
      Indicates whether or not the `deleteRowsAtIndexPaths:withRowAnimation:` method has been called on this object.
    */
    public var deleteRowsCalled = false

    /**
      Provides the index paths that were passed to the `deleteRowsAtIndexPaths:withRowAnimation:` method, if called.
    */
    public var deleteRowsIndexPaths: [NSIndexPath]?

    /**
      Provides the row animation that was passed to the `deleteRowsAtIndexPaths:withRowAnimation:` method, if called.
    */
    public var deleteRowsRowAnimation: UITableViewRowAnimation?

    /**
      Indicates whether or not the `reloadRowsAtIndexPaths:withRowAnimation:` method has been called on this object.
    */
    public var reloadRowsCalled = false

    /**
      Provides the index paths that were passed to the `reloadRowsAtIndexPaths:withRowAnimation:` method, if called.
    */
    public var reloadRowsIndexPaths: [NSIndexPath]?

    /**
      Provides the row animation that was passed to the `reloadRowsAtIndexPaths:withRowAnimation:` method, if called.
    */
    public var reloadRowsRowAnimation: UITableViewRowAnimation?

    /**
      Indicates whether or not the `moveRowAtIndexPath:toIndexPath:` method has been called on this object.
    */
    public var moveRowCalled = false

    /**
      Provides the 'from' index path that was passed to the `moveRowAtIndexPath:toIndexPath:` method, if called.
    */
    public var moveRowFromIndexPath: NSIndexPath?

    /**
      Provides the 'to' index path that was passed to the `moveRowAtIndexPath:toIndexPath:` method, if called.
    */
    public var moveRowToIndexPath: NSIndexPath?

    internal var forwardingList = ShimMethodForwardingList(shouldForwardByDefault: true)

}
