//
//  UITableViewCalls.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/22/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

extension TestableUIKit.UITableView {

    open override func reloadData() {
        reloadDataCalled = true

        if shouldForwardMethodCallWithSelector(#selector(UITableView.reloadData)) {
            super.reloadData()
        }
    }

    open override func beginUpdates() {
        beginUpdatesCalled = true

        if shouldForwardMethodCallWithSelector(#selector(UITableView.beginUpdates)) {
            super.beginUpdates()
        }
    }

    open override func endUpdates() {
        endUpdatesCalled = true

        if shouldForwardMethodCallWithSelector(#selector(UITableView.endUpdates)) {
            super.endUpdates()
        }
    }

    //  MARK: Sections

    open override func insertSections(_ sections: IndexSet, with animation: UITableViewRowAnimation) {
        insertSectionsCalled = true
        insertSectionsIndexSet = sections
        insertSectionsRowAnimation = animation

        if shouldForwardMethodCallWithSelector(#selector(UITableView.insertSections(_:with:))) {
            super.insertSections(sections, with: animation)
        }
    }

    open override func deleteSections(_ sections: IndexSet, with animation: UITableViewRowAnimation) {
        deleteSectionsCalled = true
        deleteSectionsIndexSet = sections
        deleteSectionsRowAnimation = animation

        if shouldForwardMethodCallWithSelector(#selector(UITableView.deleteSections(_:with:))) {
            super.deleteSections(sections, with: animation)
        }
    }

    open override func reloadSections(_ sections: IndexSet, with animation: UITableViewRowAnimation) {
        reloadSectionsCalled = true
        reloadSectionsIndexSet = sections
        reloadSectionsRowAnimation = animation

        if shouldForwardMethodCallWithSelector(#selector(UITableView.reloadSections(_:with:))) {
            super.reloadSections(sections, with: animation)
        }
    }

    open override func moveSection(_ section: Int, toSection newSection: Int) {
        moveSectionCalled = true
        moveSectionFromIndex = section
        moveSectionToIndex = newSection

        if shouldForwardMethodCallWithSelector(#selector(UITableView.moveSection(_:toSection:))) {
            super.moveSection(section, toSection: newSection)
        }
    }

    open override func reloadSectionIndexTitles() {
        reloadSectionIndexTitlesCalled = true

        if shouldForwardMethodCallWithSelector(#selector(UITableView.reloadSectionIndexTitles)) {
            super.reloadSectionIndexTitles()
        }
    }

    //  MARK: Rows

    open override func insertRows(at indexPaths: [IndexPath], with animation: UITableViewRowAnimation) {
        insertRowsCalled = true
        insertRowsIndexPaths = indexPaths
        insertRowsRowAnimation = animation

        if shouldForwardMethodCallWithSelector(#selector(UITableView.insertRows(at:with:))) {
            super.insertRows(at: indexPaths, with: animation)
        }
    }

    open override func deleteRows(at indexPaths: [IndexPath], with animation: UITableViewRowAnimation) {
        deleteRowsCalled = true
        deleteRowsIndexPaths = indexPaths
        deleteRowsRowAnimation = animation

        if shouldForwardMethodCallWithSelector(#selector(UITableView.deleteRows(at:with:))) {
            super.deleteRows(at: indexPaths, with: animation)
        }
    }

    open override func reloadRows(at indexPaths: [IndexPath], with animation: UITableViewRowAnimation) {
        reloadRowsCalled = true
        reloadRowsIndexPaths = indexPaths
        reloadRowsRowAnimation = animation

        if shouldForwardMethodCallWithSelector(#selector(UITableView.reloadRows(at:with:))) {
            super.reloadRows(at: indexPaths, with: animation)
        }
    }

    open override func moveRow(at indexPath: IndexPath, to newIndexPath: IndexPath) {
        moveRowCalled = true
        moveRowFromIndexPath = indexPath
        moveRowToIndexPath = newIndexPath

        if shouldForwardMethodCallWithSelector(#selector(UITableView.moveRow(at:to:))) {
            super.moveRow(at: indexPath, to: newIndexPath)
        }
    }

}


extension TestableUIKit.UITableView: ShimMethodForwarding {

    /*!
        The UITableView shim should forward spied messages by default.
    */
    public var shouldForwardByDefault: Bool { return forwardingList.shouldForwardByDefault }

    /*!
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
