//
//  UICollectionView.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/22/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit


public class UICollectionView: UIKit.UICollectionView, ShimMethodForwarding {

    /*!
        Indicates whether or not the `reloadData` method has been called on this object.
    */
    public var reloadDataCalled = false

    //  MARK: Sections

    /*!
        Indicates whether or not the `insertSections:` method has been called on this object.
    */
    public var insertSectionsCalled = false

    /*!
        Provides the index set of sections that was passed to the `insertSections:` method, if called.
    */
    public var insertSectionsIndexSet: NSIndexSet?

    /*!
        Indicates whether or not the `deleteSections:` method has been called on this object.
    */
    public var deleteSectionsCalled = false

    /*!
        Provides the index set of sections that was passed to the `deleteSections:` method, if called.
    */
    public var deleteSectionsIndexSet: NSIndexSet?

    /*!
        Indicates whether or not the `reloadSections:` method has been called on this object.
    */
    public var reloadSectionsCalled = false

    /*!
        Provides the index set of sections that was passed to the `reloadSections:` method, if called.
    */
    public var reloadSectionsIndexSet: NSIndexSet?

    /*!
        Indicates whether or not the `moveSection:toSection:` method has been called on this object.
    */
    public var moveSectionCalled = false

    /*!
        Provides the source section index that was passed to the `moveSection:toSection:` method, if called.
    */
    public var moveSectionFromIndex: Int?

    /*!
        Provides the destination section index that was passed to the `moveSection:toSection:` method, if called.
    */
    public var moveSectionToIndex: Int?

    //  MARK: Rows

    /*!
        Indicates whether or not the `insertItemsAtIndexPaths:` method has been called on this object.
    */
    public var insertItemsCalled = false

    /*!
        Provides the index paths that were passed to the `insertItemsAtIndexPaths:` method, if called.
    */
    public var insertItemsIndexPaths: [NSIndexPath]?

    /*!
        Indicates whether or not the `deleteItemsAtIndexPaths:` method has been called on this object.
    */
    public var deleteItemsCalled = false

    /*!
        Provides the index paths that were passed to the `deleteItemsAtIndexPaths:` method, if called.
    */
    public var deleteItemsIndexPaths: [NSIndexPath]?

    /*!
        Indicates whether or not the `reloadItemsAtIndexPaths:` method has been called on this object.
    */
    public var reloadItemsCalled = false

    /*!
        Provides the index paths that were passed to the `reloadItemsAtIndexPaths:` method, if called.
    */
    public var reloadItemsIndexPaths: [NSIndexPath]?

    /*!
        Indicates whether or not the `moveItemAtIndexPath:toIndexPath:` method has been called on this object.
    */
    public var moveItemCalled = false

    /*!
        Provides the 'from' index path that was passed to the `moveItemAtIndexPath:toIndexPath:` method, if called.
    */
    public var moveItemFromIndexPath: NSIndexPath?

    /*!
        Provides the 'to' index path that was passed to the `moveItemAtIndexPath:toIndexPath:` method, if called.
    */
    public var moveItemToIndexPath: NSIndexPath?


    public static var shouldForwardMethodsByDefault = true

    public static var methodForwardingList = ShimMethodForwardingList()

    public enum UICollectionViewTestableSelectors {
        public static let ReloadData = #selector(
            UICollectionView.reloadData
        )

        public static let InsertSections = #selector(
            UICollectionView.insertSections(_:)
        )

        public static let DeleteSections = #selector(
            UICollectionView.deleteSections(_:)
        )

        public static let ReloadSections = #selector(
            UICollectionView.reloadSections(_:)
        )

        public static let MoveSection = #selector(
            UICollectionView.moveSection(_:toSection:)
        )

        public static let InsertItems = #selector(
            UICollectionView.insertItemsAtIndexPaths(_:)
        )

        public static let DeleteItems = #selector(
            UICollectionView.deleteItemsAtIndexPaths(_:)
        )

        public static let ReloadItems = #selector(
            UICollectionView.reloadItemsAtIndexPaths(_:)
        )

        public static let MoveItem = #selector(
            UICollectionView.moveItemAtIndexPath(_:toIndexPath:)
        )
    }

}
