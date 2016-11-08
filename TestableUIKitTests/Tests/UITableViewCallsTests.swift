//
//  UITableViewCallsTests.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/22/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import XCTest
@testable import TestableUIKit

class UITableViewCallsTests: XCTestCase {

    let table = UITableView()
    let sectionIndexSet = IndexSet(integer: 1)
    let indexPaths = [IndexPath(row: 1, section: 1), IndexPath(row: 2, section: 0)]

    func testShimMethodForwarding() {
        XCTAssertTrue(table.shouldForwardByDefault, "This shim should forward methods by default")
        XCTAssertTrue(table.shouldForwardMethodCallWithSelector("someSelector"), "The method should be forwarded by default")
        table.setShouldForwardMethodCallWithSelector("someSelector", false)
        XCTAssertFalse(table.shouldForwardMethodCallWithSelector("someSelector"), "The method should not be forwarded now")
        table.setShouldForwardMethodCallWithSelector("someSelector", true)
        XCTAssertTrue(table.shouldForwardMethodCallWithSelector("someSelector"), "The method should now be forwarded again")
    }

    func testReloadDataCall() {
        XCTAssertFalse(table.reloadDataCalled, "The table view should not indicate having had reloadData called by default")
        table.reloadData()
        XCTAssertTrue(table.reloadDataCalled, "The table view should now indicate having had reloadData called")
    }

    func testBeginUpdatesCall() {
        XCTAssertFalse(table.beginUpdatesCalled, "The table view should not indicate having had beginUpdates called by default")
        table.beginUpdates()
        XCTAssertTrue(table.beginUpdatesCalled, "The table view should now indicate having had beginUpdates called")
    }

    func testEndUpdatesCall() {
        XCTAssertFalse(table.endUpdatesCalled, "The table view should not indicate having had endUpdates called by default")
        table.endUpdates()
        XCTAssertTrue(table.endUpdatesCalled, "The table view should now indicate having had endUpdates called")
    }

    //  MARK: Sections

    func testInsertSectionsCall() {
        XCTAssertFalse(table.insertSectionsCalled, "The table view should not indicate having had insertSections called by default")
        XCTAssertNil(table.insertSectionsIndexSet, "The index set should be missing by default")
        XCTAssertTrue(table.insertSectionsRowAnimation == nil, "The row animation should be missing by default")
        let indexSet = IndexSet(integer: 1)
        table.insertSections(indexSet, with: .fade)
        XCTAssertTrue(table.insertSectionsCalled, "The table view should now indicate having had insertSections called")
        XCTAssertEqual(table.insertSectionsIndexSet!, indexSet, "The index set should be captured")
        XCTAssertEqual(table.insertSectionsRowAnimation!, UITableViewRowAnimation.Fade, "The row animation should be captured")
    }

    func testDeleteSectionsCall() {
        XCTAssertFalse(table.deleteSectionsCalled, "The table view should not indicate having had deleteSections called by default")
        XCTAssertNil(table.deleteSectionsIndexSet, "The index set should be missing by default")
        XCTAssertTrue(table.deleteSectionsRowAnimation == nil, "The row animation should be missing by default")
        table.deleteSections(sectionIndexSet, with: .top)
        XCTAssertTrue(table.deleteSectionsCalled, "The table view should now indicate having had deleteSections called")
        XCTAssertEqual(table.deleteSectionsIndexSet!, sectionIndexSet, "The index set should be captured")
        XCTAssertEqual(table.deleteSectionsRowAnimation!, UITableViewRowAnimation.Top, "The row animation should be captured")
    }

    func testReloadSectionsCall() {
        XCTAssertFalse(table.reloadSectionsCalled, "The table view should not indicate having had reloadSections called by default")
        XCTAssertNil(table.reloadSectionsIndexSet, "The index set should be missing by default")
        XCTAssertTrue(table.reloadSectionsRowAnimation == nil, "The row animation should be missing by default")
        table.reloadSections(sectionIndexSet, with: .automatic)
        XCTAssertTrue(table.reloadSectionsCalled, "The table view should now indicate having had reloadSections called")
        XCTAssertEqual(table.reloadSectionsIndexSet!, sectionIndexSet, "The index set should be captured")
        XCTAssertEqual(table.reloadSectionsRowAnimation!, UITableViewRowAnimation.Automatic, "The row animation should be captured")
    }

    func testMoveSectionCall() {
        XCTAssertFalse(table.moveSectionCalled, "The table view should not indicate having had moveSection called by default")
        XCTAssertNil(table.moveSectionFromIndex, "The from index should be missing by default")
        XCTAssertNil(table.moveSectionToIndex, "The to index should be missing by default")
        table.moveSection(2, toSection: 0)
        XCTAssertTrue(table.moveSectionCalled, "The table view should now indicate having had moveSection called")
        XCTAssertEqual(table.moveSectionFromIndex!, 2, "The from index should be captured")
        XCTAssertEqual(table.moveSectionToIndex!, 0, "The to index should be captured")
    }

    func testReloadSectionIndexTitlesCall() {
        XCTAssertFalse(table.reloadSectionIndexTitlesCalled, "The table view should not indicate having had reloadSectionIndexTitles called by default")
        table.reloadSectionIndexTitles()
        XCTAssertTrue(table.reloadSectionIndexTitlesCalled, "The table view should now indicate having had reloadSectionIndexTitles called")
    }

    //  MARK: Rows

    func testInsertRowsCall() {
        XCTAssertFalse(table.insertRowsCalled, "The table view should not indicate having had insertRows called by default")
        XCTAssertNil(table.insertRowsIndexPaths, "The index paths should be missing by default")
        XCTAssertTrue(table.insertRowsRowAnimation == nil, "The row animation should be missing by default")
        table.insertRows(at: indexPaths, with: .left)
        XCTAssertTrue(table.insertRowsCalled, "The table view should now indicate having had insertRows called")
        XCTAssertEqual(table.insertRowsIndexPaths!.count, 2, "The index paths should be captured")
        XCTAssertEqual(table.insertRowsIndexPaths![0], indexPaths[0], "The index paths should be captured")
        XCTAssertEqual(table.insertRowsIndexPaths![1], indexPaths[1], "The index paths should be captured")
        XCTAssertEqual(table.insertRowsRowAnimation!, UITableViewRowAnimation.Left, "The row animation should be captured")
    }

    func testDeleteRowsCall() {
        XCTAssertFalse(table.deleteRowsCalled, "The table view should not indicate having had deleteRows called by default")
        XCTAssertNil(table.deleteRowsIndexPaths, "The index paths should be missing by default")
        XCTAssertTrue(table.deleteRowsRowAnimation == nil, "The row animation should be missing by default")
        table.deleteRows(at: indexPaths, with: .right)
        XCTAssertTrue(table.deleteRowsCalled, "The table view should now indicate having had deleteRows called")
        XCTAssertEqual(table.deleteRowsIndexPaths!.count, 2, "The index paths should be captured")
        XCTAssertEqual(table.deleteRowsIndexPaths![0], indexPaths[0], "The index paths should be captured")
        XCTAssertEqual(table.deleteRowsIndexPaths![1], indexPaths[1], "The index paths should be captured")
        XCTAssertEqual(table.deleteRowsRowAnimation!, UITableViewRowAnimation.Right, "The row animation should be captured")
    }

    func testReloadRowsCall() {
        XCTAssertFalse(table.reloadRowsCalled, "The table view should not indicate having had reloadRows called by default")
        XCTAssertNil(table.reloadRowsIndexPaths, "The index paths should be missing by default")
        XCTAssertTrue(table.reloadRowsRowAnimation == nil, "The row animation should be missing by default")
        table.reloadRows(at: indexPaths, with: .automatic)
        XCTAssertTrue(table.reloadRowsCalled, "The table view should now indicate having had reloadRows called")
        XCTAssertEqual(table.reloadRowsIndexPaths!.count, 2, "The index paths should be captured")
        XCTAssertEqual(table.reloadRowsIndexPaths![0], indexPaths[0], "The index paths should be captured")
        XCTAssertEqual(table.reloadRowsIndexPaths![1], indexPaths[1], "The index paths should be captured")
        XCTAssertEqual(table.reloadRowsRowAnimation!, UITableViewRowAnimation.Automatic, "The row animation should be captured")
    }

    func testMoveRowCall() {
        XCTAssertFalse(table.moveRowCalled, "The table view should not indicate having had moveRow called by default")
        XCTAssertNil(table.moveRowFromIndexPath, "The from index path should be missing by default")
        XCTAssertNil(table.moveRowToIndexPath, "The to index path should be missing by default")
        table.moveRow(at: indexPaths[0], to: indexPaths[1])
        XCTAssertTrue(table.moveRowCalled, "The table view should now indicate having had moveRow called")
        XCTAssertEqual(table.moveRowFromIndexPath!, indexPaths[0], "The from index path should be captured")
        XCTAssertEqual(table.moveRowToIndexPath!, indexPaths[1], "The to index path should be captured")
    }

}
