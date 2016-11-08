//
//  UICollectionViewCalls.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/22/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

extension UICollectionView {

    open override func reloadData() {
        reloadDataCalled = true

        if shouldForwardMethodCallWithSelector(#selector(UICollectionView.reloadData)) {
            super.reloadData()
        }
    }

    //  MARK: Sections

    open override func insertSections(_ sections: IndexSet) {
        insertSectionsCalled = true
        insertSectionsIndexSet = sections

        if shouldForwardMethodCallWithSelector(#selector(UICollectionView.insertSections(_:))) {
            super.insertSections(sections)
        }
    }

    open override func deleteSections(_ sections: IndexSet) {
        deleteSectionsCalled = true
        deleteSectionsIndexSet = sections

        if shouldForwardMethodCallWithSelector(#selector(UICollectionView.deleteSections(_:))) {
            super.deleteSections(sections)
        }
    }

    open override func reloadSections(_ sections: IndexSet) {
        reloadSectionsCalled = true
        reloadSectionsIndexSet = sections

        if shouldForwardMethodCallWithSelector(#selector(UICollectionView.reloadSections(_:))) {
            super.reloadSections(sections)
        }
    }

    open override func moveSection(_ section: Int, toSection newSection: Int) {
        moveSectionCalled = true
        moveSectionFromIndex = section
        moveSectionToIndex = newSection

        if shouldForwardMethodCallWithSelector(#selector(UICollectionView.moveSection(_:toSection:))) {
            super.moveSection(section, toSection: newSection)
        }
    }

    //  MARK: Items

    open override func insertItems(at indexPaths: [IndexPath]) {
        insertItemsCalled = true
        insertItemsIndexPaths = indexPaths

        if shouldForwardMethodCallWithSelector(#selector(UICollectionView.insertItems(at:))) {
            super.insertItems(at: indexPaths)
        }
    }

    open override func deleteItems(at indexPaths: [IndexPath]) {
        deleteItemsCalled = true
        deleteItemsIndexPaths = indexPaths

        if shouldForwardMethodCallWithSelector(#selector(UICollectionView.deleteItems(at:))) {
            super.deleteItems(at: indexPaths)
        }
    }

    open override func reloadItems(at indexPaths: [IndexPath]) {
        reloadItemsCalled = true
        reloadItemsIndexPaths = indexPaths

        if shouldForwardMethodCallWithSelector(#selector(UICollectionView.reloadItems(at:))) {
            super.reloadItems(at: indexPaths)
        }
    }

    open override func moveItem(at indexPath: IndexPath, to newIndexPath: IndexPath) {
        moveItemCalled = true
        moveItemFromIndexPath = indexPath
        moveItemToIndexPath = newIndexPath

        if shouldForwardMethodCallWithSelector(#selector(UICollectionView.moveItem(at:to:))) {
            super.moveItem(at: indexPath, to: newIndexPath)
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
    public func shouldForwardMethodCallWithSelector(_ selector: Selector) -> Bool {
        return forwardingList.shouldForwardMethodCallWithSelector(selector)
    }

    /*!
        Calls to this method control whether or not the spy for the provided selector forwards the method call to the superclass implementation.
        :param: selector Selector of spy method of which to change the forwarding status.
        :param: Boolean value indicating whether or not the method calls should be forwarded.
    */
    public func setShouldForwardMethodCallWithSelector(_ selector: Selector, _ shouldForward: Bool) {
        forwardingList.setShouldForwardMethodCallWithSelector(selector, shouldForward)
    }

}
