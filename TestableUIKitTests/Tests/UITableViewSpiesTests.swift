//
//  UITableViewSpiesTests.swift
//  TestableUIKit
//
//  Created by Sam Odom on 2/21/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//

import XCTest
import TestableUIKit


class UITableViewSpiesTests: XCTestCase {

    let tableView = TestTableView()

    let animation = UITableViewRowAnimation.middle
    var sections: IndexSet = [2, 3]
    var rows = [
        IndexPath(row: 1, section: 1),
        IndexPath(row: 2, section: 0)
    ]

    override func setUp() {
        super.setUp()

        tableView.rowCountsBySection = [2, 1]
    }


    // MARK: - `reloadData`

    func testReloadDataControllerForwardingBehavior() {
        XCTAssertEqual(UITableView.ReloadDataSpyController.forwardingBehavior, .always,
                       "Spies on `reloadData` should always forward their method invocations")
    }

    func testSpyingOnReloadData() {
        tableView.reloadDataTestMethodCalled = false
        let spy = UITableView.ReloadDataSpyController.createSpy(on: tableView)!

        XCTAssertFalse(tableView.reloadDataCalled,
                       "By default the table view should not indicate having been asked to reload its data")

        spy.beginSpying()

        tableView.reloadData()
        XCTAssertTrue(tableView.reloadDataCalled,
                      "The table view should indicate having been asked to reload its data")
        XCTAssertTrue(tableView.reloadDataTestMethodCalled,
                      "The spy method should forward the invocation to the original method")

        spy.endSpying()

        XCTAssertFalse(tableView.reloadDataCalled,
                       "The flag should be cleared after spying is complete")
    }


    // MARK: - `beginUpdates`

    func testBeginUpdatesControllerForwardingBehavior() {
        XCTAssertEqual(UITableView.BeginUpdatesSpyController.forwardingBehavior, .always,
                       "Spies on `beginUpdates` should always forward their method invocations")
    }

    func testSpyingOnBeginUpdates() {
        tableView.beginUpdatesTestMethodCalled = false
        let spy = UITableView.BeginUpdatesSpyController.createSpy(on: tableView)!

        XCTAssertFalse(tableView.beginUpdatesCalled,
                       "By default the table view should not indicate having been asked to begin updates")

        spy.beginSpying()

        tableView.beginUpdates()
        XCTAssertTrue(tableView.beginUpdatesCalled,
                      "The table view should indicate having been asked to begin updates")
        XCTAssertTrue(tableView.beginUpdatesTestMethodCalled,
                      "The spy method should forward the invocation to the original method")

        spy.endSpying()

        XCTAssertFalse(tableView.beginUpdatesCalled,
                       "The flag should be cleared after spying is complete")
    }


    // MARK: - `endUpdates`

    func testEndUpdatesControllerForwardingBehavior() {
        XCTAssertEqual(UITableView.EndUpdatesSpyController.forwardingBehavior, .always,
                       "Spies on `endUpdates` should always forward their method invocations")
    }

    func testSpyingOnEndUpdates() {
        tableView.endUpdatesTestMethodCalled = false
        let spy = UITableView.EndUpdatesSpyController.createSpy(on: tableView)!

        XCTAssertFalse(tableView.endUpdatesCalled,
                       "By default the table view should not indicate having been asked to end updates")

        spy.beginSpying()

        tableView.endUpdates()
        XCTAssertTrue(tableView.endUpdatesCalled,
                      "The table view should indicate having been asked to end updates")
        XCTAssertTrue(tableView.endUpdatesTestMethodCalled,
                      "The spy method should forward the invocation to the original method")

        spy.endSpying()

        XCTAssertFalse(tableView.endUpdatesCalled,
                       "The flag should be cleared after spying is complete")
    }


    //  MARK: - `insertSections(_:with:)`

    func testInsertSectionsControllerForwardingBehavior() {
        XCTAssertEqual(UITableView.InsertSectionsSpyController.forwardingBehavior, .always,
                       "Spies on `insertSections(_:with:)` should always forward their method invocations")
    }

    func testInsertSectionsSpy() {
        XCTAssertFalse(tableView.insertSectionsCalled,
                       "By default the table view should not indicate having had sections inserted")
        XCTAssertNil(tableView.insertSectionsSections,
                     "By default the sections should be empty")
        XCTAssertNil(tableView.insertSectionsAnimation,
                     "By default the animation type should be empty")

        let spy = UITableView.InsertSectionsSpyController.createSpy(on: tableView)!
        spy.beginSpying()

        tableView.beginUpdates()
        tableView.rowCountsBySection.append(contentsOf: [1, 1])
        tableView.insertSections(sections, with: animation)
        tableView.endUpdates()

        XCTAssertTrue(tableView.insertSectionsCalled,
                      "A table view being spied upon should indicate having had `insertSections(_:with:)` called on it")
        XCTAssertEqual(tableView.insertSectionsSections!, sections,
                       "The inserted sections should be captured")
        XCTAssertEqual(tableView.insertSectionsAnimation!, animation,
                       "The animation type should be captured")
        XCTAssertEqual(tableView.numberOfSections, 4,
                       "The spy method should always forward the method call to the original implementation")

        spy.endSpying()

        XCTAssertFalse(tableView.insertSectionsCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(tableView.insertSectionsSections,
                     "The sections should be cleared after spying is complete")
        XCTAssertNil(tableView.insertSectionsAnimation,
                     "The animation type should be cleared after spying is complete")
    }


    //  MARK: - `deleteSections(_:with:)`

    func testDeleteSectionsControllerForwardingBehavior() {
        XCTAssertEqual(UITableView.DeleteSectionsSpyController.forwardingBehavior, .always,
                       "Spies on `deleteSections(_:with:)` should always forward their method invocations")
    }

    func testDeleteSectionsSpy() {
        XCTAssertFalse(tableView.deleteSectionsCalled,
                       "By default the table view should not indicate having had sections deleted")
        XCTAssertNil(tableView.deleteSectionsSections,
                     "By default the sections should be empty")
        XCTAssertNil(tableView.deleteSectionsAnimation,
                     "By default the animation type should be empty")

        let spy = UITableView.DeleteSectionsSpyController.createSpy(on: tableView)!

        tableView.rowCountsBySection.append(contentsOf: [1, 1])
        tableView.reloadData()

        spy.beginSpying()

        tableView.beginUpdates()
        tableView.rowCountsBySection.removeLast(2)
        tableView.deleteSections(sections, with: animation)
        tableView.endUpdates()

        XCTAssertTrue(tableView.deleteSectionsCalled,
                      "A table view being spied upon should indicate having had `deleteSections(_:with:)` called on it")
        XCTAssertEqual(tableView.deleteSectionsSections!, sections,
                       "The deleted sections should be captured")
        XCTAssertEqual(tableView.deleteSectionsAnimation!, animation,
                       "The animation type should be captured")
        XCTAssertEqual(tableView.numberOfSections, 2,
                       "The spy method should always forward the method call to the original implementation")

        spy.endSpying()

        XCTAssertFalse(tableView.deleteSectionsCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(tableView.deleteSectionsSections,
                     "The sections should be cleared after spying is complete")
        XCTAssertNil(tableView.deleteSectionsAnimation,
                     "The animation type should be cleared after spying is complete")
    }


    //  MARK: - `reloadSections(_:with:)`

    func testReloadSectionsControllerForwardingBehavior() {
        XCTAssertEqual(UITableView.ReloadSectionsSpyController.forwardingBehavior, .always,
                       "Spies on `reloadSections(_:with:)` should always forward their method invocations")
    }

    func testReloadSectionsSpy() {
        tableView.reloadSectionsTestMethodCalled = false
        XCTAssertFalse(tableView.reloadSectionsCalled,
                       "By default the table view should not indicate having had sections reloaded")
        XCTAssertNil(tableView.reloadSectionsSections,
                     "By default the sections should be empty")
        XCTAssertNil(tableView.reloadSectionsAnimation,
                     "By default the animation type should be empty")

        sections = [1, 1]
        let spy = UITableView.ReloadSectionsSpyController.createSpy(on: tableView)!

        spy.beginSpying()

        tableView.reloadSections(sections, with: animation)

        XCTAssertTrue(tableView.reloadSectionsCalled,
                      "A table view being spied upon should indicate having had `reloadSections(_:with:)` called on it")
        XCTAssertEqual(tableView.reloadSectionsSections!, sections,
                       "The reloaded sections should be captured")
        XCTAssertEqual(tableView.reloadSectionsAnimation!, animation,
                       "The animation type should be captured")
        XCTAssertTrue(tableView.reloadSectionsTestMethodCalled,
                      "The spy method should always forward the method call to the original implementation")

        spy.endSpying()

        XCTAssertFalse(tableView.reloadSectionsCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(tableView.reloadSectionsSections,
                     "The sections should be cleared after spying is complete")
        XCTAssertNil(tableView.reloadSectionsAnimation,
                     "The animation type should be cleared after spying is complete")
    }


    //  MARK: - `moveSection(_:toSection:)`

    func testMoveSectionControllerForwardingBehavior() {
        XCTAssertEqual(UITableView.MoveSectionSpyController.forwardingBehavior, .always,
                       "Spies on `moveSection(_:toSection:)` should always forward their method invocations")
    }

    func testMoveSectionSpy() {
        XCTAssertFalse(tableView.moveSectionCalled,
                       "By default the table view should not indicate having had a section moved")
        XCTAssertNil(tableView.moveSectionFromSection,
                     "By default the source section should be empty")
        XCTAssertNil(tableView.moveSectionToSection,
                     "By default the destination section should be empty")

        let spy = UITableView.MoveSectionSpyController.createSpy(on: tableView)!

        let initialRowCounts = tableView.rowCountsBySection
        let fromSection = 1
        let toSection = 0

        spy.beginSpying()

        tableView.beginUpdates()
        tableView.rowCountsBySection = initialRowCounts.reversed()
        tableView.moveSection(fromSection, toSection: toSection)
        tableView.endUpdates()

        XCTAssertTrue(tableView.moveSectionCalled,
                      "A table view being spied upon should indicate having had `moveSection(_:toSection:)` called on it")
        XCTAssertEqual(tableView.moveSectionFromSection!, fromSection,
                       "The source section should be captured")
        XCTAssertEqual(tableView.moveSectionToSection!, toSection,
                       "The destination section should be captured")
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), initialRowCounts.reversed()[0],
                      "The spy method should always forward the method call to the original implementation")
        XCTAssertEqual(tableView.numberOfRows(inSection: 1), initialRowCounts.reversed()[1],
                       "The spy method should always forward the method call to the original implementation")

        spy.endSpying()

        XCTAssertFalse(tableView.moveSectionCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(tableView.moveSectionFromSection,
                     "The source section should be cleared after spying is complete")
        XCTAssertNil(tableView.moveSectionToSection,
                     "The destination section should be cleared after spying is complete")
    }


    // MARK: - `reloadSectionIndexTitles`

    func testReloadSectionIndexTitlesControllerForwardingBehavior() {
        XCTAssertEqual(UITableView.ReloadSectionIndexTitlesSpyController.forwardingBehavior, .always,
                       "Spies on `reloadSectionIndexTitles` should always forward their method invocations")
    }

    func testSpyingOnReloadSectionIndexTitles() {
        tableView.reloadSectionIndexTitlesTestMethodCalled = false
        let spy = UITableView.ReloadSectionIndexTitlesSpyController.createSpy(on: tableView)!

        XCTAssertFalse(tableView.reloadSectionIndexTitlesCalled,
                       "By default the table view should not indicate having been asked to reload its section index titles")

        spy.beginSpying()

        tableView.reloadSectionIndexTitles()
        XCTAssertTrue(tableView.reloadSectionIndexTitlesCalled,
                      "The table view should indicate having been asked to reload its section index titles")
        XCTAssertTrue(tableView.reloadSectionIndexTitlesTestMethodCalled,
                      "The spy method should forward the invocation to the original method")

        spy.endSpying()

        XCTAssertFalse(tableView.reloadSectionIndexTitlesCalled,
                       "The flag should be cleared after spying is complete")
    }


    //  MARK: - `insertRows(at:with:)`

    func testInsertRowsControllerForwardingBehavior() {
        XCTAssertEqual(UITableView.InsertRowsSpyController.forwardingBehavior, .always,
                       "Spies on `insertRows(at:with:)` should always forward their method invocations")
    }

    func testInsertRowsSpy() {
        XCTAssertFalse(tableView.insertRowsCalled,
                       "By default the table view should not indicate having had rows inserted")
        XCTAssertNil(tableView.insertRowsIndexPaths,
                     "By default the rows should be empty")
        XCTAssertNil(tableView.insertRowsAnimation,
                     "By default the animation type should be empty")

        let spy = UITableView.InsertRowsSpyController.createSpy(on: tableView)!
        spy.beginSpying()

        tableView.beginUpdates()
        tableView.rowCountsBySection = [4, 3]
        tableView.insertRows(at: rows, with: animation)
        tableView.endUpdates()

        XCTAssertTrue(tableView.insertRowsCalled,
                      "A table view being spied upon should indicate having had `insertRows(at:with:)` called on it")
        XCTAssertEqual(tableView.insertRowsIndexPaths!, rows,
                       "The inserted rows should be captured")
        XCTAssertEqual(tableView.insertRowsAnimation!, animation,
                       "The animation type should be captured")
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 4,
                       "The spy method should always forward the method call to the original implementation")
        XCTAssertEqual(tableView.numberOfRows(inSection: 1), 3,
                       "The spy method should always forward the method call to the original implementation")

        spy.endSpying()

        XCTAssertFalse(tableView.insertRowsCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(tableView.insertRowsIndexPaths,
                     "The rows should be cleared after spying is complete")
        XCTAssertNil(tableView.insertRowsAnimation,
                     "The animation type should be cleared after spying is complete")
    }


    //  MARK: - `deleteRows(at:with:)`

    func testDeleteRowsControllerForwardingBehavior() {
        XCTAssertEqual(UITableView.DeleteRowsSpyController.forwardingBehavior, .always,
                       "Spies on `deleteRows(at:with:)` should always forward their method invocations")
    }

    func testDeleteRowsSpy() {
        XCTAssertFalse(tableView.deleteRowsCalled,
                       "By default the table view should not indicate having had rows deleted")
        XCTAssertNil(tableView.deleteRowsIndexPaths,
                     "By default the rows should be empty")
        XCTAssertNil(tableView.deleteRowsAnimation,
                     "By default the animation type should be empty")

        tableView.rowCountsBySection = [4, 3]
        tableView.reloadData()

        let spy = UITableView.DeleteRowsSpyController.createSpy(on: tableView)!
        spy.beginSpying()

        tableView.beginUpdates()
        tableView.deleteRows(at: rows, with: animation)
        tableView.endUpdates()

        XCTAssertTrue(tableView.deleteRowsCalled,
                      "A table view being spied upon should indicate having had `deleteRows(at:with:)` called on it")
        XCTAssertEqual(tableView.deleteRowsIndexPaths!, rows,
                       "The inserted rows should be captured")
        XCTAssertEqual(tableView.deleteRowsAnimation!, animation,
                       "The animation type should be captured")
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 4,
                       "The spy method should always forward the method call to the original implementation")
        XCTAssertEqual(tableView.numberOfRows(inSection: 1), 3,
                       "The spy method should always forward the method call to the original implementation")

        spy.endSpying()

        XCTAssertFalse(tableView.deleteRowsCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(tableView.deleteRowsIndexPaths,
                     "The rows should be cleared after spying is complete")
        XCTAssertNil(tableView.deleteRowsAnimation,
                     "The animation type should be cleared after spying is complete")
    }


    //  MARK: - `reloadRows(at:with:)`

    func testReloadRowsControllerForwardingBehavior() {
        XCTAssertEqual(UITableView.ReloadRowsSpyController.forwardingBehavior, .always,
                       "Spies on `reloadRows(at:with:)` should always forward their method invocations")
    }

    func testReloadRowsSpy() {
        tableView.reloadRowsTestMethodCalled = false
        XCTAssertFalse(tableView.reloadRowsCalled,
                       "By default the table view should not indicate having had rows reloaded")
        XCTAssertNil(tableView.reloadRowsIndexPaths,
                     "By default the rows should be empty")
        XCTAssertNil(tableView.reloadRowsAnimation,
                     "By default the animation type should be empty")

        let spy = UITableView.ReloadRowsSpyController.createSpy(on: tableView)!
        spy.beginSpying()

        rows = [
            IndexPath(row: 0, section: 1),
            IndexPath(row: 1, section: 0)
        ]

        tableView.beginUpdates()
        tableView.reloadRows(at: rows, with: animation)
        tableView.endUpdates()

        XCTAssertTrue(tableView.reloadRowsCalled,
                      "A table view being spied upon should indicate having had `reloadRows(at:with:)` called on it")
        XCTAssertEqual(tableView.reloadRowsIndexPaths!, rows,
                       "The inserted rows should be captured")
        XCTAssertEqual(tableView.reloadRowsAnimation!, animation,
                       "The animation type should be captured")
        XCTAssertTrue(tableView.reloadRowsTestMethodCalled,
                      "The spy method should always forward the method call to the original implementation")

        spy.endSpying()

        XCTAssertFalse(tableView.reloadRowsCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(tableView.reloadRowsIndexPaths,
                     "The rows should be cleared after spying is complete")
        XCTAssertNil(tableView.reloadRowsAnimation,
                     "The animation type should be cleared after spying is complete")
    }


    //  MARK: - `moveRow(at:to:)`

    func testMoveRowControllerForwardingBehavior() {
        XCTAssertEqual(UITableView.MoveRowSpyController.forwardingBehavior, .always,
                       "Spies on `moveRow(at:to:)` should always forward their method invocations")
    }

    func testMoveRowSpy() {
        XCTAssertFalse(tableView.moveSectionCalled,
                       "By default the table view should not indicate having had a section moved")
        XCTAssertNil(tableView.moveSectionFromSection,
                     "By default the sections should be empty")
        XCTAssertNil(tableView.moveSectionToSection,
                     "By default the animation type should be empty")

        let fromRow = IndexPath(row: 0, section: 1)
        let toRow = IndexPath(row: 1, section: 0)

        let spy = UITableView.MoveRowSpyController.createSpy(on: tableView)!

        spy.beginSpying()

        tableView.beginUpdates()
        tableView.rowCountsBySection = [4, 1]
        tableView.moveRow(at: fromRow, to: toRow)
        tableView.endUpdates()

        XCTAssertTrue(tableView.moveRowCalled,
                      "A table view being spied upon should indicate having had `moveRow(at:to:)` called on it")
        XCTAssertEqual(tableView.moveRowFromRow!, fromRow,
                       "The source row should be captured")
        XCTAssertEqual(tableView.moveRowToRow!, toRow,
                       "The destination row should be captured")
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 4,
                       "The spy method should always forward the method call to the original implementation")
        XCTAssertEqual(tableView.numberOfRows(inSection: 1), 1,
                       "The spy method should always forward the method call to the original implementation")

        spy.endSpying()

        XCTAssertFalse(tableView.moveRowCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(tableView.moveRowFromRow,
                     "The source row should be cleared after spying is complete")
        XCTAssertNil(tableView.moveRowToRow,
                     "The destination row should be cleared after spying is complete")
    }

}
