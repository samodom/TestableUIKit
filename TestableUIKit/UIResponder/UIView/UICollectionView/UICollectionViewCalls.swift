//
//  UICollectionViewCalls.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/22/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

public extension UICollectionView {

    public override func reloadData() {
        reloadDataCalled = true

        if shouldForwardMethodCallWithSelector("reloadData") {
            super.reloadData()
        }
    }

    //  MARK: Sections

    public override func insertSections(sections: NSIndexSet) {
        insertSectionsCalled = true
        insertSectionsIndexSet = sections

        if shouldForwardMethodCallWithSelector("insertSections:") {
            super.insertSections(sections)
        }
    }

    public override func deleteSections(sections: NSIndexSet) {
        deleteSectionsCalled = true
        deleteSectionsIndexSet = sections

        if shouldForwardMethodCallWithSelector("deleteSections:") {
            super.deleteSections(sections)
        }
    }

    public override func reloadSections(sections: NSIndexSet) {
        reloadSectionsCalled = true
        reloadSectionsIndexSet = sections

        if shouldForwardMethodCallWithSelector("reloadSections:") {
            super.reloadSections(sections)
        }
    }

    public override func moveSection(section: Int, toSection newSection: Int) {
        moveSectionCalled = true
        moveSectionFromIndex = section
        moveSectionToIndex = newSection

        if shouldForwardMethodCallWithSelector("moveSection:toSection:") {
            super.moveSection(section, toSection: newSection)
        }
    }

    //  MARK: Items

    public override func insertItemsAtIndexPaths(indexPaths: [AnyObject]) {
        insertItemsCalled = true
        insertItemsIndexPaths = indexPaths as? [NSIndexPath]

        if shouldForwardMethodCallWithSelector("insertItemsAtIndexPaths:") {
            super.insertItemsAtIndexPaths(indexPaths)
        }
    }

    public override func deleteItemsAtIndexPaths(indexPaths: [AnyObject]) {
        deleteItemsCalled = true
        deleteItemsIndexPaths = indexPaths as? [NSIndexPath]

        if shouldForwardMethodCallWithSelector("deleteItemsAtIndexPaths:") {
            super.deleteItemsAtIndexPaths(indexPaths)
        }
    }

    public override func reloadItemsAtIndexPaths(indexPaths: [AnyObject]) {
        reloadItemsCalled = true
        reloadItemsIndexPaths = indexPaths as? [NSIndexPath]

        if shouldForwardMethodCallWithSelector("reloadItemsAtIndexPaths:") {
            super.reloadItemsAtIndexPaths(indexPaths)
        }
    }

    public override func moveItemAtIndexPath(indexPath: NSIndexPath, toIndexPath newIndexPath: NSIndexPath) {
        moveItemCalled = true
        moveItemFromIndexPath = indexPath
        moveItemToIndexPath = newIndexPath

        if shouldForwardMethodCallWithSelector("moveItemAtIndexPath:toIndexPath:") {
            super.moveItemAtIndexPath(indexPath, toIndexPath: newIndexPath)
        }
    }

}


extension UICollectionView: ShimMethodForwarding {

    /*!
        The `UICollectionView` shim should forward spied messages by default.
    */
    public var shouldForwardByDefault: Bool { return forwardingList.shouldForwardByDefault }

    /**
        This method indicates whether or not the spy for the provided selector forwards the method call to the superclass implementation.
        :param: selector Selector of spy method to check for forwarding status.
        :returns: Boolean value indicating whether or not the spy currently forwards calls to the specified method.
    */
    public func shouldForwardMethodCallWithSelector(selector: Selector) -> Bool {
        return forwardingList.shouldForwardMethodCallWithSelector(selector)
    }

    /*!
        Calls to this method control whether or not the spy for the provided selector forwards the method call to the superclass implementation.
        :param: selector Selector of spy method of which to change the forwarding status.
        :param: Boolean value indicating whether or not the method calls should be forwarded.
    */
    public func setShouldForwardMethodCallWithSelector(selector: Selector, _ shouldForward: Bool) {
        forwardingList.setShouldForwardMethodCallWithSelector(selector, shouldForward)
    }

}
