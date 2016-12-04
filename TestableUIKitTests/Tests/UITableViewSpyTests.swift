//
//  UITableViewSpyTests.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/22/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import XCTest
import TestableUIKit


class UITableViewSpyTests: SpyTestCase {

    let tableView = TestingTableView()
    let sections: IndexSet = [2, 3]
    let rows = [
        IndexPath(row: 1, section: 1),
        IndexPath(row: 2, section: 0)
    ]
    let animation = UITableViewRowAnimation.middle

    override func setUp() {
        super.setUp()

        tableView.rowCountsBySection = [2, 1]
        UIApplication.rootView.addSubview(tableView)
    }

    override func tearDown() {
        tableView.removeFromSuperview()

        super.tearDown()
    }

    func testMethodCallForwarding() {
        XCTAssertTrue(tableView.forwardsMethodCallsByDefault, "By default this spy should forward its method")
        UITableViewSpyAssociations.allAssociations.forEach { association in
            let selector = association.originalSelector
            XCTAssertTrue(tableView.forwardsMethodCalls(for: selector),
                          "By default `UITableView` should forward spied calls to `\(selector)`")
        }
    }


    //  MARK: - `reloadData`

    func testReloadDataCallWithContext() {
        association = UITableViewSpyAssociations.reloadData
        inspectImplementations()

        XCTAssertFalse(tableView.reloadDataCalled,
                       "By default the table view should not indicate having had `reloadData` called")

        tableView.spyOnReloadData {
            contextExecuted = true
            validateMethodsAreSwizzled()

            tableView.reloadData()
            XCTAssertTrue(tableView.reloadDataCalled,
                          "The table view should now indicate having had `reloadData` called")
        }

        XCTAssertTrue(contextExecuted, "The context should be executed")
        validateMethodsAreNotSwizzled()
        XCTAssertFalse(tableView.reloadDataCalled,
                       "The flag should be cleared after spying is complete")
    }

    func testReloadDataCallWithoutContext() {
        association = UITableViewSpyAssociations.reloadData
        inspectImplementations()

        XCTAssertFalse(tableView.reloadDataCalled,
                       "By default the table view should not indicate having had `reloadData` called")

        tableView.beginSpyingOnReloadData()
        validateMethodsAreSwizzled()

        tableView.reloadData()
        XCTAssertTrue(tableView.reloadDataCalled,
                      "The table view should now indicate having had `reloadData` called")

        tableView.endSpyingOnReloadData()
        validateMethodsAreNotSwizzled()
        XCTAssertFalse(tableView.reloadDataCalled,
                       "The flag should be cleared after spying is complete")
    }


    //  MARK: - `beginUpdates`

    func testBeginUpdatesCallWithContext() {
        association = UITableViewSpyAssociations.beginUpdates
        inspectImplementations()

        XCTAssertFalse(tableView.beginUpdatesCalled,
                       "By default the table view should not indicate having had `beginUpdates` called")

        tableView.spyOnBeginUpdates {
            contextExecuted = true
            validateMethodsAreSwizzled()

            tableView.beginUpdates()
            XCTAssertTrue(tableView.beginUpdatesCalled,
                          "The table view should now indicate having had `beginUpdates` called")
        }

        XCTAssertTrue(contextExecuted, "The context should be executed")
        validateMethodsAreNotSwizzled()
        XCTAssertFalse(tableView.beginUpdatesCalled,
                       "The flag should be cleared after spying is complete")
    }

    func testBeginUpdatesCallWithoutContext() {
        association = UITableViewSpyAssociations.beginUpdates
        inspectImplementations()

        XCTAssertFalse(tableView.beginUpdatesCalled,
                       "By default the table view should not indicate having had `beginUpdates` called")

        tableView.beginSpyingOnBeginUpdates()
        validateMethodsAreSwizzled()

        tableView.beginUpdates()
        XCTAssertTrue(tableView.beginUpdatesCalled,
                      "The table view should now indicate having had `beginUpdates` called")

        tableView.endSpyingOnBeginUpdates()
        validateMethodsAreNotSwizzled()
        XCTAssertFalse(tableView.beginUpdatesCalled,
                       "The flag should be cleared after spying is complete")
    }


    //  MARK: - `endUpdates`

    func testEndUpdatesCallWithContext() {
        association = UITableViewSpyAssociations.endUpdates
        inspectImplementations()

        XCTAssertFalse(tableView.endUpdatesCalled,
                       "By default the table view should not indicate having had `endUpdates` called")

        tableView.spyOnEndUpdates {
            contextExecuted = true
            validateMethodsAreSwizzled()

            tableView.endUpdates()
            XCTAssertTrue(tableView.endUpdatesCalled,
                          "The table view should now indicate having had `endUpdates` called")
        }

        XCTAssertTrue(contextExecuted, "The context should be executed")
        validateMethodsAreNotSwizzled()
        XCTAssertFalse(tableView.endUpdatesCalled,
                       "The flag should be cleared after spying is complete")
    }

    func testEndUpdatesCallWithoutContext() {
        association = UITableViewSpyAssociations.endUpdates
        inspectImplementations()

        XCTAssertFalse(tableView.endUpdatesCalled,
                       "By default the table view should not indicate having had `endUpdates` called")

        tableView.beginSpyingOnEndUpdates()
        validateMethodsAreSwizzled()

        tableView.endUpdates()
        XCTAssertTrue(tableView.endUpdatesCalled,
                      "The table view should now indicate having had `endUpdates` called")

        tableView.endSpyingOnEndUpdates()
        validateMethodsAreNotSwizzled()
        XCTAssertFalse(tableView.endUpdatesCalled,
                       "The flag should be cleared after spying is complete")
    }


    //  MARK: - `insertSections(_:with:)`

    func testInsertSectionsCallWithContext() {
        association = UITableViewSpyAssociations.insertSections
        inspectImplementations()

        XCTAssertFalse(tableView.insertSectionsCalled,
                       "By default the table view should not indicate having had `insertSections(_:with:)` called")
        XCTAssertNil(tableView.insertSectionsSections,
                     "By default the index set should be missing")
        XCTAssertNil(tableView.insertSectionsAnimation,
                     "By default the animation should be missing")

        tableView.spyOnInsertSections {
            contextExecuted = true
            validateMethodsAreSwizzled()

            tableView.beginUpdates()
            tableView.rowCountsBySection.append(contentsOf: [1, 1])
            tableView.insertSections(sections, with: animation)
            tableView.endUpdates()

            XCTAssertTrue(tableView.insertSectionsCalled,
                          "The table view should now indicate having had `insertSections(_:with:)` called")
            XCTAssertEqual(tableView.insertSectionsSections, sections,
                           "The index set should be captured")
            XCTAssertEqual(tableView.insertSectionsAnimation, animation,
                           "The row animation should be captured")
        }

        XCTAssertTrue(contextExecuted, "The context should be executed")
        validateMethodsAreNotSwizzled()
        XCTAssertFalse(tableView.insertSectionsCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(tableView.insertSectionsSections,
                     "The index set should be cleared after spying is complete")
        XCTAssertNil(tableView.insertSectionsAnimation,
                     "The animation should be cleared after spying is complete")
    }

    func testInsertSectionsCallWithoutContext() {
        association = UITableViewSpyAssociations.insertSections
        inspectImplementations()

        XCTAssertFalse(tableView.insertSectionsCalled,
                       "By default the table view should not indicate having had `insertSections(_:with:)` called")
        XCTAssertNil(tableView.insertSectionsSections,
                     "By default the index set should be missing")
        XCTAssertNil(tableView.insertSectionsAnimation,
                     "By default the animation should be missing")

        tableView.beginSpyingOnInsertSections()
        validateMethodsAreSwizzled()

        tableView.beginUpdates()
        tableView.rowCountsBySection.append(contentsOf: [1, 1])
        tableView.insertSections(sections, with: animation)
        tableView.endUpdates()

        XCTAssertTrue(tableView.insertSectionsCalled,
                      "The table view should now indicate having had `insertSections(_:with:)` called")
        XCTAssertEqual(tableView.insertSectionsSections, sections,
                       "The index set should be captured")
        XCTAssertEqual(tableView.insertSectionsAnimation, animation,
                       "The row animation should be captured")

        tableView.endSpyingOnInsertSections()
        validateMethodsAreNotSwizzled()
        XCTAssertFalse(tableView.insertSectionsCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(tableView.insertSectionsSections,
                     "The index set should be cleared after spying is complete")
        XCTAssertNil(tableView.insertSectionsAnimation,
                     "The animation should be cleared after spying is complete")
    }


    //  MARK: - `deleteSections(_:with:)`

    func testDeleteSectionsCallWithContext() {
        association = UITableViewSpyAssociations.deleteSections
        inspectImplementations()

        XCTAssertFalse(tableView.deleteSectionsCalled,
                       "By default the table view should not indicate having had `deleteSections(_:with:)` called")
        XCTAssertNil(tableView.deleteSectionsSections,
                     "By default the index set should be missing")
        XCTAssertNil(tableView.deleteSectionsAnimation,
                     "By default the animation should be missing")

        tableView.spyOnDeleteSections {
            contextExecuted = true
            validateMethodsAreSwizzled()

            tableView.rowCountsBySection.append(contentsOf: [1, 1])
            tableView.reloadData()

            tableView.beginUpdates()
            tableView.rowCountsBySection.removeLast(2)
            tableView.deleteSections(sections, with: animation)
            tableView.endUpdates()

            XCTAssertTrue(tableView.deleteSectionsCalled,
                          "The table view should now indicate having had `deleteSections(_:with:)` called")
            XCTAssertEqual(tableView.deleteSectionsSections, sections,
                           "The index set should be captured")
            XCTAssertEqual(tableView.deleteSectionsAnimation, animation,
                           "The row animation should be captured")
        }

        XCTAssertTrue(contextExecuted, "The context should be executed")
        validateMethodsAreNotSwizzled()
        XCTAssertFalse(tableView.deleteSectionsCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(tableView.deleteSectionsSections,
                     "The index set should be cleared after spying is complete")
        XCTAssertNil(tableView.deleteSectionsAnimation,
                     "The animation should be cleared after spying is complete")
    }

    func testDeleteSectionsCallWithoutContext() {
        association = UITableViewSpyAssociations.deleteSections
        inspectImplementations()

        XCTAssertFalse(tableView.deleteSectionsCalled,
                       "By default the table view should not indicate having had `deleteSections(_:with:)` called")
        XCTAssertNil(tableView.deleteSectionsSections,
                     "By default the index set should be missing")
        XCTAssertNil(tableView.deleteSectionsAnimation,
                     "By default the animation should be missing")

        tableView.beginSpyingOnDeleteSections()
        validateMethodsAreSwizzled()

        tableView.rowCountsBySection.append(contentsOf: [1, 1])
        tableView.reloadData()

        tableView.beginUpdates()
        _ = tableView.rowCountsBySection.removeLast(2)
        tableView.deleteSections(sections, with: animation)
        tableView.endUpdates()

        XCTAssertTrue(tableView.deleteSectionsCalled,
                      "The table view should now indicate having had `deleteSections(_:with:)` called")
        XCTAssertEqual(tableView.deleteSectionsSections, sections,
                       "The index set should be captured")
        XCTAssertEqual(tableView.deleteSectionsAnimation, animation,
                       "The row animation should be captured")

        tableView.endSpyingOnDeleteSections()
        validateMethodsAreNotSwizzled()
        XCTAssertFalse(tableView.deleteSectionsCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(tableView.deleteSectionsSections,
                     "The index set should be cleared after spying is complete")
        XCTAssertNil(tableView.deleteSectionsAnimation,
                     "The animation should be cleared after spying is complete")
    }


    //  MARK: - `reloadSections(_:with:)`

    func testReloadSectionsCallWithContext() {
        association = UITableViewSpyAssociations.reloadSections
        inspectImplementations()

        XCTAssertFalse(tableView.reloadSectionsCalled,
                       "By default the table view should not indicate having had `reloadSections(_:with:)` called")
        XCTAssertNil(tableView.reloadSectionsSections,
                     "By default the index set should be missing")
        XCTAssertNil(tableView.reloadSectionsAnimation,
                     "By default the animation should be missing")

        tableView.spyOnReloadSections {
            contextExecuted = true
            validateMethodsAreSwizzled()

            tableView.rowCountsBySection.append(contentsOf: [1, 1])
            tableView.reloadData()

            tableView.beginUpdates()
            tableView.reloadSections(sections, with: animation)
            tableView.endUpdates()

            XCTAssertTrue(tableView.reloadSectionsCalled,
                          "The table view should now indicate having had `reloadSections(_:with:)` called")
            XCTAssertEqual(tableView.reloadSectionsSections, sections,
                           "The index set should be captured")
            XCTAssertEqual(tableView.reloadSectionsAnimation, animation,
                           "The row animation should be captured")
        }

        XCTAssertTrue(contextExecuted, "The context should be executed")
        validateMethodsAreNotSwizzled()
        XCTAssertFalse(tableView.reloadSectionsCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(tableView.reloadSectionsSections,
                     "The index set should be cleared after spying is complete")
        XCTAssertNil(tableView.reloadSectionsAnimation,
                     "The animation should be cleared after spying is complete")
    }

    func testReloadSectionsCallWithoutContext() {
        association = UITableViewSpyAssociations.reloadSections
        inspectImplementations()

        XCTAssertFalse(tableView.reloadSectionsCalled,
                       "By default the table view should not indicate having had `reloadSections(_:with:)` called")
        XCTAssertNil(tableView.reloadSectionsSections,
                     "By default the index set should be missing")
        XCTAssertNil(tableView.reloadSectionsAnimation,
                     "By default the animation should be missing")

        tableView.beginSpyingOnReloadSections()
        validateMethodsAreSwizzled()

        tableView.rowCountsBySection.append(contentsOf: [1, 1])
        tableView.reloadData()

        tableView.beginUpdates()
        tableView.reloadSections(sections, with: animation)
        tableView.endUpdates()

        XCTAssertTrue(tableView.reloadSectionsCalled,
                      "The table view should now indicate having had `reloadSections(_:with:)` called")
        XCTAssertEqual(tableView.reloadSectionsSections, sections,
                       "The index set should be captured")
        XCTAssertEqual(tableView.reloadSectionsAnimation, animation,
                       "The row animation should be captured")

        tableView.endSpyingOnReloadSections()
        validateMethodsAreNotSwizzled()
        XCTAssertFalse(tableView.reloadSectionsCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(tableView.reloadSectionsSections,
                     "The index set should be cleared after spying is complete")
        XCTAssertNil(tableView.reloadSectionsAnimation,
                     "The animation should be cleared after spying is complete")
    }


    //  MARK: - `moveSection(_:toSection:)`

    func testMoveSectionCallWithContext() {
        association = UITableViewSpyAssociations.moveSection
        inspectImplementations()

        XCTAssertFalse(tableView.moveSectionCalled,
                       "By default the table view should not indicate having had `moveSections(_:toSection:)` called")
        XCTAssertNil(tableView.moveSectionFromSection,
                     "By default the from section should be missing")
        XCTAssertNil(tableView.moveSectionToSection,
                     "By default the to section should be missing")

        tableView.spyOnMoveSection {
            contextExecuted = true
            validateMethodsAreSwizzled()

            tableView.beginUpdates()
            tableView.rowCountsBySection.reverse()
            tableView.moveSection(0, toSection: 1)
            tableView.endUpdates()

            XCTAssertTrue(tableView.moveSectionCalled,
                          "The table view should now indicate having had `moveSection(_:toSection:)` called")
            XCTAssertEqual(tableView.moveSectionFromSection, 0, "The from section should be captured")
            XCTAssertEqual(tableView.moveSectionToSection, 1, "The to section should be captured")
        }

        XCTAssertTrue(contextExecuted, "The context should be executed")
        validateMethodsAreNotSwizzled()
        XCTAssertFalse(tableView.moveSectionCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(tableView.moveSectionFromSection,
                     "The from section should be cleared after spying is complete")
        XCTAssertNil(tableView.moveSectionToSection,
                     "The to section should be cleared after spying is complete")
    }

    func testMoveSectionCallWithoutContext() {
        association = UITableViewSpyAssociations.moveSection
        inspectImplementations()

        XCTAssertFalse(tableView.moveSectionCalled,
                       "By default the table view should not indicate having had `moveSections(_:toSection:)` called")
        XCTAssertNil(tableView.moveSectionFromSection, "By default the from section should be missing")
        XCTAssertNil(tableView.moveSectionToSection, "By default the to section should be missing")

        tableView.beginSpyingOnMoveSection()
        validateMethodsAreSwizzled()

        tableView.beginUpdates()
        tableView.rowCountsBySection.reverse()
        tableView.moveSection(0, toSection: 1)
        tableView.endUpdates()

        XCTAssertTrue(tableView.moveSectionCalled,
                      "The table view should now indicate having had `moveSection(_:toSection:)` called")
        XCTAssertEqual(tableView.moveSectionFromSection, 0, "The from section should be captured")
        XCTAssertEqual(tableView.moveSectionToSection, 1, "The to section should be captured")

        tableView.endSpyingOnMoveSection()
        validateMethodsAreNotSwizzled()

        XCTAssertFalse(tableView.moveSectionCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(tableView.moveSectionFromSection,
                     "The from section should be cleared after spying is complete")
        XCTAssertNil(tableView.moveSectionToSection,
                     "The to section should be cleared after spying is complete")
    }
    

    //  MARK: - `reloadSectionIndexTitles`

    func testReloadSectionIndexTitlesCallWithContext() {
        association = UITableViewSpyAssociations.reloadSectionIndexTitles
        inspectImplementations()

        XCTAssertFalse(tableView.reloadSectionIndexTitlesCalled,
                       "By default the table view should not indicate having had `reloadSectionIndexTitles` called")

        tableView.spyOnReloadSectionIndexTitles {
            contextExecuted = true
            validateMethodsAreSwizzled()

            tableView.reloadSectionIndexTitles()
            XCTAssertTrue(tableView.reloadSectionIndexTitlesCalled,
                          "The table view should now indicate having had `reloadSectionIndexTitles` called")
        }

        XCTAssertTrue(contextExecuted, "The context should be executed")
        validateMethodsAreNotSwizzled()
        XCTAssertFalse(tableView.reloadSectionIndexTitlesCalled,
                       "The flag should be cleared after spying is complete")
    }

    func testReloadSectionIndexTitlesCallWithoutContext() {
        association = UITableViewSpyAssociations.reloadSectionIndexTitles
        inspectImplementations()

        XCTAssertFalse(tableView.reloadSectionIndexTitlesCalled,
                       "By default the table view should not indicate having had `reloadSectionIndexTitles` called")

        tableView.beginSpyingOnReloadSectionIndexTitles()
        validateMethodsAreSwizzled()

        tableView.reloadSectionIndexTitles()
        XCTAssertTrue(tableView.reloadSectionIndexTitlesCalled,
                      "The table view should now indicate having had `reloadSectionIndexTitles` called")

        tableView.endSpyingOnReloadSectionIndexTitles()
        validateMethodsAreNotSwizzled()
        XCTAssertFalse(tableView.reloadSectionIndexTitlesCalled,
                       "The flag should be cleared after spying is complete")
    }


    //  MARK: - `insertRows(at:with:)`

    func testInsertRowsCallWithContext() {
        association = UITableViewSpyAssociations.insertRows
        inspectImplementations()

        XCTAssertFalse(tableView.insertRowsCalled,
                       "By default the table view should not indicate having had `insertRows(at:with:)` called")
        XCTAssertNil(tableView.insertRowsRows,
                     "By default the index paths should be missing")
        XCTAssertNil(tableView.insertRowsAnimation,
                     "By default the animation should be missing")

        tableView.spyOnInsertRows {
            contextExecuted = true
            validateMethodsAreSwizzled()

            tableView.beginUpdates()
            tableView.rowCountsBySection = [3, 2]
            tableView.insertRows(at: rows, with: animation)
            tableView.endUpdates()

            XCTAssertTrue(tableView.insertRowsCalled,
                          "The table view should now indicate having had `insertRows(at:with:)` called")
            XCTAssertEqual(tableView.insertRowsRows!, rows,
                           "The index paths should be captured")
            XCTAssertEqual(tableView.insertRowsAnimation, animation,
                           "The row animation should be captured")
        }

        XCTAssertTrue(contextExecuted, "The context should be executed")
        validateMethodsAreNotSwizzled()
        XCTAssertFalse(tableView.insertRowsCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(tableView.insertRowsRows,
                     "The index paths should be cleared after spying is complete")
        XCTAssertNil(tableView.insertRowsAnimation,
                     "The animation should be cleared after spying is complete")
    }

    func testInsertRowsCallWithoutContext() {
        association = UITableViewSpyAssociations.insertRows
        inspectImplementations()

        XCTAssertFalse(tableView.insertRowsCalled,
                       "By default the table view should not indicate having had `insertRows(at:with:)` called")
        XCTAssertNil(tableView.insertRowsRows,
                     "By default the index paths should be missing")
        XCTAssertNil(tableView.insertRowsAnimation,
                     "By default the animation should be missing")

        tableView.beginSpyingOnInsertRows()
        validateMethodsAreSwizzled()

        tableView.beginUpdates()
        tableView.rowCountsBySection = [3, 2]
        tableView.insertRows(at: rows, with: animation)
        tableView.endUpdates()

        XCTAssertTrue(tableView.insertRowsCalled,
                      "The table view should now indicate having had `insertRows(at:with:)` called")
        XCTAssertEqual(tableView.insertRowsRows!, rows,
                       "The index paths should be captured")
        XCTAssertEqual(tableView.insertRowsAnimation, animation,
                       "The row animation should be captured")

        tableView.endSpyingOnInsertRows()
        validateMethodsAreNotSwizzled()
        XCTAssertFalse(tableView.insertRowsCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(tableView.insertRowsRows,
                     "The index paths should be cleared after spying is complete")
        XCTAssertNil(tableView.insertRowsAnimation,
                     "The animation should be cleared after spying is complete")
    }


    //  MARK: - `deleteRows(at:with:)`

    func testDeleteRowsCallWithContext() {
        association = UITableViewSpyAssociations.deleteRows
        inspectImplementations()

        XCTAssertFalse(tableView.deleteRowsCalled,
                       "By default the table view should not indicate having had `deleteRows(at:with:)` called")
        XCTAssertNil(tableView.deleteRowsRows,
                     "By default the index paths should be missing")
        XCTAssertNil(tableView.deleteRowsAnimation,
                     "By default the animation should be missing")

        tableView.spyOnDeleteRows {
            contextExecuted = true
            validateMethodsAreSwizzled()

            tableView.rowCountsBySection = [3, 2]
            tableView.reloadData()

            tableView.beginUpdates()
            tableView.rowCountsBySection = [2, 1]
            tableView.deleteRows(at: rows, with: animation)
            tableView.endUpdates()

            XCTAssertTrue(tableView.deleteRowsCalled,
                          "The table view should now indicate having had `deleteRows(at:with:)` called")
            XCTAssertEqual(tableView.deleteRowsRows!, rows,
                           "The index paths should be captured")
            XCTAssertEqual(tableView.deleteRowsAnimation, animation,
                           "The row animation should be captured")
        }

        XCTAssertTrue(contextExecuted, "The context should be executed")
        validateMethodsAreNotSwizzled()
        XCTAssertFalse(tableView.deleteRowsCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(tableView.deleteRowsRows,
                     "The index paths should be cleared after spying is complete")
        XCTAssertNil(tableView.deleteRowsAnimation,
                     "The animation should be cleared after spying is complete")
    }

    func testDeleteRowsCallWithoutContext() {
        association = UITableViewSpyAssociations.deleteRows
        inspectImplementations()

        XCTAssertFalse(tableView.deleteRowsCalled,
                       "By default the table view should not indicate having had `deleteRows(at:with:)` called")
        XCTAssertNil(tableView.deleteRowsRows,
                     "By default the index paths should be missing")
        XCTAssertNil(tableView.deleteRowsAnimation,
                     "By default the animation should be missing")

        tableView.beginSpyingOnDeleteRows()
        validateMethodsAreSwizzled()

        tableView.rowCountsBySection = [3, 2]
        tableView.reloadData()

        tableView.beginUpdates()
        tableView.rowCountsBySection = [2, 1]
        tableView.deleteRows(at: rows, with: animation)
        tableView.endUpdates()

        XCTAssertTrue(tableView.deleteRowsCalled,
                      "The table view should now indicate having had `deleteRows(at:with:)` called")
        XCTAssertEqual(tableView.deleteRowsRows!, rows,
                       "The index paths should be captured")
        XCTAssertEqual(tableView.deleteRowsAnimation, animation,
                       "The row animation should be captured")

        tableView.endSpyingOnDeleteRows()
        validateMethodsAreNotSwizzled()
        XCTAssertFalse(tableView.deleteRowsCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(tableView.deleteRowsRows,
                     "The index paths should be cleared after spying is complete")
        XCTAssertNil(tableView.deleteRowsAnimation,
                     "The animation should be cleared after spying is complete")
    }


    //  MARK: - `reloadRows(at:with:)`

    func testReloadRowsCallWithContext() {
        association = UITableViewSpyAssociations.reloadRows
        inspectImplementations()

        XCTAssertFalse(tableView.reloadRowsCalled,
                       "By default the table view should not indicate having had `reloadRows(at:with:)` called")
        XCTAssertNil(tableView.reloadRowsRows,
                     "By default the index paths should be missing")
        XCTAssertNil(tableView.reloadRowsAnimation,
                     "By default the animation should be missing")

        tableView.spyOnReloadRows {
            contextExecuted = true
            validateMethodsAreSwizzled()

            tableView.rowCountsBySection = [3, 2]
            tableView.reloadData()

            tableView.beginUpdates()
            tableView.reloadRows(at: rows, with: animation)
            tableView.endUpdates()

            XCTAssertTrue(tableView.reloadRowsCalled,
                          "The table view should now indicate having had `reloadRows(at:with:)` called")
            XCTAssertEqual(tableView.reloadRowsRows!, rows,
                           "The index paths should be captured")
            XCTAssertEqual(tableView.reloadRowsAnimation, animation,
                           "The row animation should be captured")
        }

        XCTAssertTrue(contextExecuted, "The context should be executed")
        validateMethodsAreNotSwizzled()
        XCTAssertFalse(tableView.reloadRowsCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(tableView.reloadRowsRows,
                     "The index paths should be cleared after spying is complete")
        XCTAssertNil(tableView.reloadRowsAnimation,
                     "The animation should be cleared after spying is complete")
    }

    func testReloadRowsCallWithoutContext() {
        association = UITableViewSpyAssociations.reloadRows
        inspectImplementations()

        XCTAssertFalse(tableView.reloadRowsCalled,
                       "By default the table view should not indicate having had `reloadRows(at:with:)` called")
        XCTAssertNil(tableView.reloadRowsRows,
                     "By default the index paths should be missing")
        XCTAssertNil(tableView.reloadRowsAnimation,
                     "By default the animation should be missing")

        tableView.beginSpyingOnReloadRows()
        validateMethodsAreSwizzled()

        tableView.rowCountsBySection = [3, 2]
        tableView.reloadData()

        tableView.beginUpdates()
        tableView.reloadRows(at: rows, with: animation)
        tableView.endUpdates()

        XCTAssertTrue(tableView.reloadRowsCalled,
                      "The table view should now indicate having had `reloadRows(at:with:)` called")
        XCTAssertEqual(tableView.reloadRowsRows!, rows,
                       "The index paths should be captured")
        XCTAssertEqual(tableView.reloadRowsAnimation, animation,
                       "The row animation should be captured")

        tableView.endSpyingOnReloadRows()
        validateMethodsAreNotSwizzled()
        XCTAssertFalse(tableView.reloadRowsCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(tableView.reloadRowsRows,
                     "The index paths should be cleared after spying is complete")
        XCTAssertNil(tableView.reloadRowsAnimation,
                     "The animation should be cleared after spying is complete")
    }


    //  MARK: - `moveRow(at:to:)`

    func testMoveRowCallWithContext() {
        association = UITableViewSpyAssociations.moveRow
        inspectImplementations()

        XCTAssertFalse(tableView.moveRowCalled,
                       "By default the table view should not indicate having had `moveRow(at:to:)` called")
        XCTAssertNil(tableView.moveRowFromRow,
                     "By default the from row should be missing")
        XCTAssertNil(tableView.moveRowToRow,
                     "By default the to row should be missing")

        tableView.spyOnMoveRow {
            contextExecuted = true
            validateMethodsAreSwizzled()

            tableView.rowCountsBySection = [3, 2]
            tableView.reloadData()

            tableView.beginUpdates()
            tableView.rowCountsBySection = [4, 1]
            tableView.moveRow(at: rows[0], to: rows[1])
            tableView.endUpdates()

            XCTAssertTrue(tableView.moveRowCalled,
                          "The table view should now indicate having had `moveRow(_:toRow:)` called")
            XCTAssertEqual(tableView.moveRowFromRow, rows[0], "The from row should be captured")
            XCTAssertEqual(tableView.moveRowToRow, rows[1], "The to row should be captured")
        }

        XCTAssertTrue(contextExecuted, "The context should be executed")
        validateMethodsAreNotSwizzled()
        XCTAssertFalse(tableView.moveRowCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(tableView.moveRowFromRow,
                     "The from row should be cleared after spying is complete")
        XCTAssertNil(tableView.moveRowToRow,
                     "The to row should be cleared after spying is complete")
    }

    func testMoveRowCallWithoutContext() {
        association = UITableViewSpyAssociations.moveRow
        inspectImplementations()

        XCTAssertFalse(tableView.moveRowCalled,
                       "By default the table view should not indicate having had `moveRow(at:to:)` called")
        XCTAssertNil(tableView.moveRowFromRow,
                     "By default the from row should be missing")
        XCTAssertNil(tableView.moveRowToRow,
                     "By default the to row should be missing")

        tableView.rowCountsBySection = [3, 2]
        tableView.reloadData()

        tableView.beginSpyingOnMoveRow()
        validateMethodsAreSwizzled()

        tableView.beginUpdates()
        tableView.rowCountsBySection = [4, 1]
        tableView.moveRow(at: rows[0], to: rows[1])
        tableView.endUpdates()

        XCTAssertTrue(tableView.moveRowCalled,
                      "The table view should now indicate having had `moveRow(_:toRow:)` called")
        XCTAssertEqual(tableView.moveRowFromRow, rows[0], "The from row should be captured")
        XCTAssertEqual(tableView.moveRowToRow, rows[1], "The to row should be captured")

        tableView.endSpyingOnMoveRow()
        validateMethodsAreNotSwizzled()

        XCTAssertFalse(tableView.moveRowCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(tableView.moveRowFromRow,
                     "The from row should be cleared after spying is complete")
        XCTAssertNil(tableView.moveRowToRow,
                     "The to row should be cleared after spying is complete")
    }

}


fileprivate extension UITableViewSpyAssociations {

    static let allAssociations = [
        UITableViewSpyAssociations.reloadData,
        UITableViewSpyAssociations.beginUpdates,
        UITableViewSpyAssociations.endUpdates,
        UITableViewSpyAssociations.insertSections,
        UITableViewSpyAssociations.deleteSections,
        UITableViewSpyAssociations.reloadSections,
        UITableViewSpyAssociations.moveSection,
        UITableViewSpyAssociations.reloadSectionIndexTitles,
        UITableViewSpyAssociations.insertRows,
        UITableViewSpyAssociations.deleteRows,
        UITableViewSpyAssociations.reloadRows,
        UITableViewSpyAssociations.moveRow
    ]

}
