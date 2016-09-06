//
//  UITableViewCalls.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/22/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

public extension TestableUIKit.UITableView {

    public override func reloadData() {
        reloadDataCalled = true

        let selector = UITableViewTestableSelectors.ReloadData
        if UITableView.shouldForwardMethodCallWithSelector(selector) {
            super.reloadData()
        }
    }

    public override func beginUpdates() {
        beginUpdatesCalled = true

        let selector = UITableViewTestableSelectors.BeginUpdates
        if UITableView.shouldForwardMethodCallWithSelector(selector) {
            super.beginUpdates()
        }
    }

    public override func endUpdates() {
        endUpdatesCalled = true

        let selector = UITableViewTestableSelectors.EndUpdates
        if UITableView.shouldForwardMethodCallWithSelector(selector) {
            super.endUpdates()
        }
    }

    //  MARK: Sections

    public override func insertSections(sections: NSIndexSet, withRowAnimation animation: UITableViewRowAnimation) {
        insertSectionsCalled = true
        insertSectionsIndexSet = sections
        insertSectionsRowAnimation = animation

        let selector = UITableViewTestableSelectors.InsertSections
        if UITableView.shouldForwardMethodCallWithSelector(selector) {
            super.insertSections(sections, withRowAnimation: animation)
        }
    }

    public override func deleteSections(sections: NSIndexSet, withRowAnimation animation: UITableViewRowAnimation) {
        deleteSectionsCalled = true
        deleteSectionsIndexSet = sections
        deleteSectionsRowAnimation = animation

        let selector = UITableViewTestableSelectors.DeleteSections
        if UITableView.shouldForwardMethodCallWithSelector(selector) {
            super.deleteSections(sections, withRowAnimation: animation)
        }
    }

    public override func reloadSections(sections: NSIndexSet, withRowAnimation animation: UITableViewRowAnimation) {
        reloadSectionsCalled = true
        reloadSectionsIndexSet = sections
        reloadSectionsRowAnimation = animation

        let selector = UITableViewTestableSelectors.ReloadSections
        if UITableView.shouldForwardMethodCallWithSelector(selector) {
            super.reloadSections(sections, withRowAnimation: animation)
        }
    }

    public override func moveSection(section: Int, toSection newSection: Int) {
        moveSectionCalled = true
        moveSectionFromIndex = section
        moveSectionToIndex = newSection

        let selector = UITableViewTestableSelectors.MoveSection
        if UITableView.shouldForwardMethodCallWithSelector(selector) {
            super.moveSection(section, toSection: newSection)
        }
    }

    public override func reloadSectionIndexTitles() {
        reloadSectionIndexTitlesCalled = true

        let selector = UITableViewTestableSelectors.ReloadSectionIndexTitles
        if UITableView.shouldForwardMethodCallWithSelector(selector) {
            super.reloadSectionIndexTitles()
        }
    }

    //  MARK: Rows

    public override func insertRowsAtIndexPaths(indexPaths: [NSIndexPath], withRowAnimation animation: UITableViewRowAnimation) {
        insertRowsCalled = true
        insertRowsIndexPaths = indexPaths
        insertRowsRowAnimation = animation

        let selector = UITableViewTestableSelectors.InsertRows
        if UITableView.shouldForwardMethodCallWithSelector(selector) {
            super.insertRowsAtIndexPaths(indexPaths, withRowAnimation: animation)
        }
    }

    public override func deleteRowsAtIndexPaths(indexPaths: [NSIndexPath], withRowAnimation animation: UITableViewRowAnimation) {
        deleteRowsCalled = true
        deleteRowsIndexPaths = indexPaths
        deleteRowsRowAnimation = animation

        let selector = UITableViewTestableSelectors.DeleteRows
        if UITableView.shouldForwardMethodCallWithSelector(selector) {
            super.deleteRowsAtIndexPaths(indexPaths, withRowAnimation: animation)
        }
    }

    public override func reloadRowsAtIndexPaths(indexPaths: [NSIndexPath], withRowAnimation animation: UITableViewRowAnimation) {
        reloadRowsCalled = true
        reloadRowsIndexPaths = indexPaths
        reloadRowsRowAnimation = animation

        let selector = UITableViewTestableSelectors.ReloadRows
        if UITableView.shouldForwardMethodCallWithSelector(selector) {
            super.reloadRowsAtIndexPaths(indexPaths, withRowAnimation: animation)
        }
    }

    public override func moveRowAtIndexPath(indexPath: NSIndexPath, toIndexPath newIndexPath: NSIndexPath) {
        moveRowCalled = true
        moveRowFromIndexPath = indexPath
        moveRowToIndexPath = newIndexPath

        let selector = UITableViewTestableSelectors.MoveRow
        if UITableView.shouldForwardMethodCallWithSelector(selector) {
            super.moveRowAtIndexPath(indexPath, toIndexPath: newIndexPath)
        }
    }

}
