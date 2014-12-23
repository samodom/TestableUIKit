//
//  UITableViewCalls.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/22/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

public extension UITableView {

    public override func reloadData() {
        reloadDataCalled = true

        if shouldForwardMethodCallWithSelector("reloadData") {
            super.reloadData()
        }
    }

    public override func beginUpdates() {
        beginUpdatesCalled = true

        if shouldForwardMethodCallWithSelector("beginUpdates") {
            super.beginUpdates()
        }
    }

    public override func endUpdates() {
        endUpdatesCalled = true

        if shouldForwardMethodCallWithSelector("endUpdates") {
            super.endUpdates()
        }
    }

    //  MARK: Sections

    public override func insertSections(sections: NSIndexSet, withRowAnimation animation: UITableViewRowAnimation) {
        insertSectionsCalled = true
        insertSectionsIndexSet = sections
        insertSectionsRowAnimation = animation

        if shouldForwardMethodCallWithSelector("insertSections:withRowAnimation:") {
            super.insertSections(sections, withRowAnimation: animation)
        }
    }

    public override func deleteSections(sections: NSIndexSet, withRowAnimation animation: UITableViewRowAnimation) {
        deleteSectionsCalled = true
        deleteSectionsIndexSet = sections
        deleteSectionsRowAnimation = animation

        if shouldForwardMethodCallWithSelector("deleteSections:withRowAnimation:") {
            super.deleteSections(sections, withRowAnimation: animation)
        }
    }

    public override func reloadSections(sections: NSIndexSet, withRowAnimation animation: UITableViewRowAnimation) {
        reloadSectionsCalled = true
        reloadSectionsIndexSet = sections
        reloadSectionsRowAnimation = animation

        if shouldForwardMethodCallWithSelector("reloadSections:withRowAnimation:") {
            super.reloadSections(sections, withRowAnimation: animation)
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

    public override func reloadSectionIndexTitles() {
        reloadSectionIndexTitlesCalled = true

        if shouldForwardMethodCallWithSelector("reloadSectionIndexTitles") {
            super.reloadSectionIndexTitles()
        }
    }

    //  MARK: Rows

    public override func insertRowsAtIndexPaths(indexPaths: [AnyObject], withRowAnimation animation: UITableViewRowAnimation) {
        insertRowsCalled = true
        insertRowsIndexPaths = indexPaths as? [NSIndexPath]
        insertRowsRowAnimation = animation

        if shouldForwardMethodCallWithSelector("insertRowsAtIndexPaths:withRowAnimation") {
            super.insertRowsAtIndexPaths(indexPaths, withRowAnimation: animation)
        }
    }

    public override func deleteRowsAtIndexPaths(indexPaths: [AnyObject], withRowAnimation animation: UITableViewRowAnimation) {
        deleteRowsCalled = true
        deleteRowsIndexPaths = indexPaths as? [NSIndexPath]
        deleteRowsRowAnimation = animation

        if shouldForwardMethodCallWithSelector("deleteRowsAtIndexPaths:withRowAnimation") {
            super.deleteRowsAtIndexPaths(indexPaths, withRowAnimation: animation)
        }
    }

    public override func reloadRowsAtIndexPaths(indexPaths: [AnyObject], withRowAnimation animation: UITableViewRowAnimation) {
        reloadRowsCalled = true
        reloadRowsIndexPaths = indexPaths as? [NSIndexPath]
        reloadRowsRowAnimation = animation

        if shouldForwardMethodCallWithSelector("reloadRowsAtIndexPaths:withRowAnimation") {
            super.reloadRowsAtIndexPaths(indexPaths, withRowAnimation: animation)
        }
    }

    public override func moveRowAtIndexPath(indexPath: NSIndexPath, toIndexPath newIndexPath: NSIndexPath) {
        moveRowCalled = true
        moveRowFromIndexPath = indexPath
        moveRowToIndexPath = newIndexPath

        if shouldForwardMethodCallWithSelector("moveRowAtIndexPath:toIndexPath:") {
            super.moveRowAtIndexPath(indexPath, toIndexPath: newIndexPath)
        }
    }

}


extension UITableView: ShimMethodForwarding {

    /**
      The UITableView shim should forward spied messages by default.
    */
    public var shouldForwardByDefault: Bool { return forwardingList.shouldForwardByDefault }

    /**
      This method indicates whether or not the spy for the provided selector forwards the method call to the superclass implementation.
      @param        selector Selector of spy method to check for forwarding status.
      @return       Boolean value indicating whether or not the spy currently forwards calls to the specified method.
    */
    public func shouldForwardMethodCallWithSelector(selector: Selector) -> Bool {
        return forwardingList.shouldForwardMethodCallWithSelector(selector)
    }

    /**
      Calls to this method control whether or not the spy for the provided selector forwards the method call to the superclass implementation.
      @param        selector Selector of spy method of which to change the forwarding status.
      @param        Boolean value indicating whether or not the method calls should be forwarded.
    */
    public func setShouldForwardMethodCallWithSelector(selector: Selector, _ shouldForward: Bool) {
        forwardingList.setShouldForwardMethodCallWithSelector(selector, shouldForward)
    }

}
