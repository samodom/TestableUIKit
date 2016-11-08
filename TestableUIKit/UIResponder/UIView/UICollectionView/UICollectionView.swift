//
//  UICollectionView.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/22/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit


open class UICollectionView: UIKit.UICollectionView {

    /*!
        Indicates whether or not the `reloadData` method has been called on this object.
    */
    open var reloadDataCalled = false

    //  MARK: Sections

    /*!
        Indicates whether or not the `insertSections:` method has been called on this object.
    */
    open var insertSectionsCalled = false

    /*!
        Provides the index set of sections that was passed to the `insertSections:` method, if called.
    */
    open var insertSectionsIndexSet: IndexSet?

    /*!
        Indicates whether or not the `deleteSections:` method has been called on this object.
    */
    open var deleteSectionsCalled = false

    /*!
        Provides the index set of sections that was passed to the `deleteSections:` method, if called.
    */
    open var deleteSectionsIndexSet: IndexSet?

    /*!
        Indicates whether or not the `reloadSections:` method has been called on this object.
    */
    open var reloadSectionsCalled = false

    /*!
        Provides the index set of sections that was passed to the `reloadSections:` method, if called.
    */
    open var reloadSectionsIndexSet: IndexSet?

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

    //  MARK: Rows

    /*!
        Indicates whether or not the `insertItemsAtIndexPaths:` method has been called on this object.
    */
    open var insertItemsCalled = false

    /*!
        Provides the index paths that were passed to the `insertItemsAtIndexPaths:` method, if called.
    */
    open var insertItemsIndexPaths: [IndexPath]?

    /*!
        Indicates whether or not the `deleteItemsAtIndexPaths:` method has been called on this object.
    */
    open var deleteItemsCalled = false

    /*!
        Provides the index paths that were passed to the `deleteItemsAtIndexPaths:` method, if called.
    */
    open var deleteItemsIndexPaths: [IndexPath]?

    /*!
        Indicates whether or not the `reloadItemsAtIndexPaths:` method has been called on this object.
    */
    open var reloadItemsCalled = false

    /*!
        Provides the index paths that were passed to the `reloadItemsAtIndexPaths:` method, if called.
    */
    open var reloadItemsIndexPaths: [IndexPath]?

    /*!
        Indicates whether or not the `moveItemAtIndexPath:toIndexPath:` method has been called on this object.
    */
    open var moveItemCalled = false

    /*!
        Provides the 'from' index path that was passed to the `moveItemAtIndexPath:toIndexPath:` method, if called.
    */
    open var moveItemFromIndexPath: IndexPath?

    /*!
        Provides the 'to' index path that was passed to the `moveItemAtIndexPath:toIndexPath:` method, if called.
    */
    open var moveItemToIndexPath: IndexPath?

    internal var forwardingList = ShimMethodForwardingList(shouldForwardByDefault: true)

}
