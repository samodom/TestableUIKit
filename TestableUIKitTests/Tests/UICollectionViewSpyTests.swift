//
//  UICollectionViewSpyTests.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/22/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import XCTest
@testable import TestableUIKit

class UICollectionViewCallsTests: SpyTestCase {

    var collectionView: TestingCollectionView!
    let sections: IndexSet = [2, 3]
    let items = [
        IndexPath(item: 1, section: 1),
        IndexPath(item: 2, section: 0)
    ]

    override func setUp() {
        super.setUp()

        let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        collectionView = TestingCollectionView(frame: frame, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.itemCountsBySection = [2, 1]
        UIApplication.rootView.addSubview(collectionView)
    }

    override func tearDown() {
        collectionView.removeFromSuperview()

        super.tearDown()
    }


    func testMethodCallForwarding() {
        XCTAssertTrue(collectionView.forwardsMethodCallsByDefault, "By default this spy should forward its method")
        UICollectionViewSpyAssociations.allAssociations.forEach { association in
            let selector = association.originalSelector
            XCTAssertTrue(collectionView.forwardsMethodCalls(for: selector),
                          "By default `UICollectionView` should forward spied calls to `\(selector)`")
        }
    }


    //  MARK: - `reloadData`

    func testReloadDataCallWithContext() {
        association = UICollectionViewSpyAssociations.reloadData
        inspectImplementations()

        XCTAssertFalse(collectionView.reloadDataCalled,
                       "By default the collection view should not indicate having had `reloadData` called")

        collectionView.spyOnReloadData {
            contextExecuted = true
            validateMethodsAreSwizzled()

            collectionView.reloadData()
            XCTAssertTrue(collectionView.reloadDataCalled,
                          "The collection view should now indicate having had `reloadData` called")
        }

        XCTAssertTrue(contextExecuted, "The context should be executed")
        validateMethodsAreNotSwizzled()
        XCTAssertFalse(collectionView.reloadDataCalled,
                       "The flag should be cleared after spying is complete")
    }

    func testReloadDataCallWithoutContext() {
        association = UICollectionViewSpyAssociations.reloadData
        inspectImplementations()

        XCTAssertFalse(collectionView.reloadDataCalled,
                       "By default the collection view should not indicate having had `reloadData` called")

        collectionView.beginSpyingOnReloadData()
        validateMethodsAreSwizzled()

        collectionView.reloadData()
        XCTAssertTrue(collectionView.reloadDataCalled,
                      "The collection view should now indicate having had `reloadData` called")

        collectionView.endSpyingOnReloadData()
        validateMethodsAreNotSwizzled()
        XCTAssertFalse(collectionView.reloadDataCalled,
                       "The flag should be cleared after spying is complete")
    }


    //  MARK: - `insertSections(_:)`

    func testInsertSectionsCallWithContext() {
        association = UICollectionViewSpyAssociations.insertSections
        inspectImplementations()

        XCTAssertFalse(collectionView.insertSectionsCalled,
                       "By default the collection view should not indicate having had `insertSections(_:)` called")
        XCTAssertNil(collectionView.insertSectionsSections,
                     "By default the index set should be missing")

        collectionView.spyOnInsertSections {
            contextExecuted = true
            validateMethodsAreSwizzled()

            collectionView.performBatchUpdates({ [unowned self] in
                self.collectionView.itemCountsBySection.append(contentsOf: [1, 1])
                self.collectionView.insertSections(self.sections)
            })

            XCTAssertTrue(collectionView.insertSectionsCalled,
                          "The collection view should now indicate having had `insertSections(_:)` called")
            XCTAssertEqual(collectionView.insertSectionsSections, sections,
                           "The index set should be captured")
        }

        XCTAssertTrue(contextExecuted, "The context should be executed")
        validateMethodsAreNotSwizzled()
        XCTAssertFalse(collectionView.insertSectionsCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(collectionView.insertSectionsSections,
                     "The index set should be cleared after spying is complete")
    }

    func testInsertSectionsCallWithoutContext() {
        association = UICollectionViewSpyAssociations.insertSections
        inspectImplementations()

        XCTAssertFalse(collectionView.insertSectionsCalled,
                       "By default the collection view should not indicate having had `insertSections(_:)` called")
        XCTAssertNil(collectionView.insertSectionsSections,
                     "By default the index set should be missing")

        collectionView.beginSpyingOnInsertSections()
        validateMethodsAreSwizzled()

        collectionView.performBatchUpdates({ [unowned self] in
            self.collectionView.itemCountsBySection.append(contentsOf: [1, 1])
            self.collectionView.insertSections(self.sections)
        })

        XCTAssertTrue(collectionView.insertSectionsCalled,
                      "The collection view should now indicate having had `insertSections(_:)` called")
        XCTAssertEqual(collectionView.insertSectionsSections, sections,
                       "The index set should be captured")

        collectionView.endSpyingOnInsertSections()
        validateMethodsAreNotSwizzled()
        XCTAssertFalse(collectionView.insertSectionsCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(collectionView.insertSectionsSections,
                     "The index set should be cleared after spying is complete")
    }


    //  MARK: - `deleteSections(_:)`

    func testDeleteSectionsCallWithContext() {
        association = UICollectionViewSpyAssociations.deleteSections
        inspectImplementations()

        XCTAssertFalse(collectionView.deleteSectionsCalled,
                       "By default the collection view should not indicate having had `deleteSections(_:)` called")
        XCTAssertNil(collectionView.deleteSectionsSections,
                     "By default the index set should be missing")

        collectionView.spyOnDeleteSections {
            contextExecuted = true
            validateMethodsAreSwizzled()

            collectionView.itemCountsBySection.append(contentsOf: [1, 1])
            collectionView.reloadData()

            collectionView.performBatchUpdates({ [unowned self] in
                self.collectionView.itemCountsBySection.removeLast(2)
                self.collectionView.deleteSections(self.sections)
            })

            XCTAssertTrue(collectionView.deleteSectionsCalled,
                          "The collection view should now indicate having had `deleteSections(_:)` called")
            XCTAssertEqual(collectionView.deleteSectionsSections, sections,
                           "The index set should be captured")
        }

        XCTAssertTrue(contextExecuted, "The context should be executed")
        validateMethodsAreNotSwizzled()
        XCTAssertFalse(collectionView.deleteSectionsCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(collectionView.deleteSectionsSections,
                     "The index set should be cleared after spying is complete")
    }

    func testDeleteSectionsCallWithoutContext() {
        association = UICollectionViewSpyAssociations.deleteSections
        inspectImplementations()

        XCTAssertFalse(collectionView.deleteSectionsCalled,
                       "By default the collection view should not indicate having had `deleteSections(_:)` called")
        XCTAssertNil(collectionView.deleteSectionsSections, "By default the index set should be missing")

        collectionView.beginSpyingOnDeleteSections()
        validateMethodsAreSwizzled()

        collectionView.itemCountsBySection.append(contentsOf: [1, 1])
        collectionView.reloadData()

        collectionView.performBatchUpdates({ [unowned self] in
            self.collectionView.itemCountsBySection.removeLast(2)
            self.collectionView.deleteSections(self.sections)
        })

        XCTAssertTrue(collectionView.deleteSectionsCalled,
                      "The collection view should now indicate having had `deleteSections(_:)` called")
        XCTAssertEqual(collectionView.deleteSectionsSections, sections,
                       "The index set should be captured")

        collectionView.endSpyingOnDeleteSections()
        validateMethodsAreNotSwizzled()
        XCTAssertFalse(collectionView.deleteSectionsCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(collectionView.deleteSectionsSections,
                     "The index set should be cleared after spying is complete")
    }


    //  MARK: - `reloadSections(_:)`

    func testReloadSectionsCallWithContext() {
        association = UICollectionViewSpyAssociations.reloadSections
        inspectImplementations()

        XCTAssertFalse(collectionView.reloadSectionsCalled,
                       "By default the collection view should not indicate having had `reloadSections(_:)` called")
        XCTAssertNil(collectionView.reloadSectionsSections,
                     "By default the index set should be missing")

        collectionView.spyOnReloadSections {
            contextExecuted = true
            validateMethodsAreSwizzled()

            collectionView.itemCountsBySection.append(contentsOf: [1, 1])
            collectionView.reloadData()

            collectionView.reloadSections(sections)

            XCTAssertTrue(collectionView.reloadSectionsCalled,
                          "The collection view should now indicate having had `reloadSections(_:)` called")
            XCTAssertEqual(collectionView.reloadSectionsSections, sections,
                           "The index set should be captured")
        }

        XCTAssertTrue(contextExecuted, "The context should be executed")
        validateMethodsAreNotSwizzled()
        XCTAssertFalse(collectionView.reloadSectionsCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(collectionView.reloadSectionsSections,
                     "The index set should be cleared after spying is complete")
    }

    func testReloadSectionsCallWithoutContext() {
        association = UICollectionViewSpyAssociations.reloadSections
        inspectImplementations()

        XCTAssertFalse(collectionView.reloadSectionsCalled,
                       "By default the collection view should not indicate having had `reloadSections(_:)` called")
        XCTAssertNil(collectionView.reloadSectionsSections,
                     "By default the index set should be missing")

        collectionView.beginSpyingOnReloadSections()
        validateMethodsAreSwizzled()

        collectionView.itemCountsBySection.append(contentsOf: [1, 1])
        collectionView.reloadData()

        collectionView.reloadSections(sections)

        XCTAssertTrue(collectionView.reloadSectionsCalled,
                      "The collection view should now indicate having had `reloadSections(_:)` called")
        XCTAssertEqual(collectionView.reloadSectionsSections, sections,
                       "The index set should be captured")

        collectionView.endSpyingOnReloadSections()
        validateMethodsAreNotSwizzled()
        XCTAssertFalse(collectionView.reloadSectionsCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(collectionView.reloadSectionsSections,
                     "The index set should be cleared after spying is complete")
    }


    //  MARK: - `moveSection(_:toSection:)`

    func testMoveSectionCallWithContext() {
        association = UICollectionViewSpyAssociations.moveSection
        inspectImplementations()

        XCTAssertFalse(collectionView.moveSectionCalled,
                       "By default the collection view should not indicate having had `moveSections(_:toSection:)` called")
        XCTAssertNil(collectionView.moveSectionFromSection,
                     "By default the from section should be missing")

        collectionView.spyOnMoveSection {
            contextExecuted = true
            validateMethodsAreSwizzled()

            collectionView.performBatchUpdates({ [unowned self] in
                self.collectionView.itemCountsBySection.reverse()
                self.collectionView.moveSection(0, toSection: 1)
            })

            XCTAssertTrue(collectionView.moveSectionCalled,
                          "The collection view should now indicate having had `moveSection(_:toSection:)` called")
            XCTAssertEqual(collectionView.moveSectionFromSection, 0, "The from section should be captured")
        }

        XCTAssertTrue(contextExecuted, "The context should be executed")
        validateMethodsAreNotSwizzled()
        XCTAssertFalse(collectionView.moveSectionCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(collectionView.moveSectionFromSection,
                     "The from section should be cleared after spying is complete")
    }

    func testMoveSectionCallWithoutContext() {
        association = UICollectionViewSpyAssociations.moveSection
        inspectImplementations()

        XCTAssertFalse(collectionView.moveSectionCalled,
                       "By default the collection view should not indicate having had `moveSections(_:toSection:)` called")
        XCTAssertNil(collectionView.moveSectionFromSection, "By default the from section should be missing")

        collectionView.beginSpyingOnMoveSection()
        validateMethodsAreSwizzled()

        collectionView.performBatchUpdates({ [unowned self] in
            self.collectionView.itemCountsBySection.reverse()
            self.collectionView.moveSection(0, toSection: 1)
        })

        XCTAssertTrue(collectionView.moveSectionCalled,
                      "The collection view should now indicate having had `moveSection(_:toSection:)` called")
        XCTAssertEqual(collectionView.moveSectionFromSection, 0, "The from section should be captured")

        collectionView.endSpyingOnMoveSection()
        validateMethodsAreNotSwizzled()

        XCTAssertFalse(collectionView.moveSectionCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(collectionView.moveSectionFromSection,
                     "The from section should be cleared after spying is complete")
    }


    //  MARK: - `insertItems(at:)`

    func testInsertItemsCallWithContext() {
        association = UICollectionViewSpyAssociations.insertItems
        inspectImplementations()

        XCTAssertFalse(collectionView.insertItemsCalled,
                       "By default the collection view should not indicate having had `insertItems(at:)` called")
        XCTAssertNil(collectionView.insertItemsItems,
                     "By default the index paths should be missing")

        collectionView.spyOnInsertItems {
            contextExecuted = true
            validateMethodsAreSwizzled()

            collectionView.performBatchUpdates({ [unowned self] in
                self.collectionView.itemCountsBySection = [3, 2]
                self.collectionView.insertItems(at: self.items)
            })

            XCTAssertTrue(collectionView.insertItemsCalled,
                          "The collection view should now indicate having had `insertItems(at:)` called")
            XCTAssertEqual(collectionView.insertItemsItems!, items,
                           "The index paths should be captured")
        }

        XCTAssertTrue(contextExecuted, "The context should be executed")
        validateMethodsAreNotSwizzled()
        XCTAssertFalse(collectionView.insertItemsCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(collectionView.insertItemsItems,
                     "The index paths should be cleared after spying is complete")
    }

    func testInsertItemsCallWithoutContext() {
        association = UICollectionViewSpyAssociations.insertItems
        inspectImplementations()

        XCTAssertFalse(collectionView.insertItemsCalled,
                       "By default the collection view should not indicate having had `insertItems(at:)` called")
        XCTAssertNil(collectionView.insertItemsItems,
                     "By default the index paths should be missing")

        collectionView.beginSpyingOnInsertItems()
        validateMethodsAreSwizzled()

        collectionView.performBatchUpdates({ [unowned self] in
            self.collectionView.itemCountsBySection = [3, 2]
            self.collectionView.insertItems(at: self.items)
        })

        XCTAssertTrue(collectionView.insertItemsCalled,
                      "The collection view should now indicate having had `insertItems(at:)` called")
        XCTAssertEqual(collectionView.insertItemsItems!, items,
                       "The index paths should be captured")

        collectionView.endSpyingOnInsertItems()
        validateMethodsAreNotSwizzled()
        XCTAssertFalse(collectionView.insertItemsCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(collectionView.insertItemsItems,
                     "The index paths should be cleared after spying is complete")
    }


    //  MARK: - `deleteItems(at:)`

    func testDeleteItemsCallWithContext() {
        association = UICollectionViewSpyAssociations.deleteItems
        inspectImplementations()

        XCTAssertFalse(collectionView.deleteItemsCalled,
                       "By default the collection view should not indicate having had `deleteItems(at:)` called")
        XCTAssertNil(collectionView.deleteItemsItems,
                     "By default the index paths should be missing")

        collectionView.spyOnDeleteItems {
            contextExecuted = true
            validateMethodsAreSwizzled()

            collectionView.itemCountsBySection = [3, 2]
            collectionView.reloadData()

            collectionView.performBatchUpdates({ [unowned self] in
                self.collectionView.itemCountsBySection = [2, 1]
                self.collectionView.deleteItems(at: self.items)
            })

            XCTAssertTrue(collectionView.deleteItemsCalled,
                          "The collection view should now indicate having had `deleteItems(at:)` called")
            XCTAssertEqual(collectionView.deleteItemsItems!, items,
                           "The index paths should be captured")
        }

        XCTAssertTrue(contextExecuted, "The context should be executed")
        validateMethodsAreNotSwizzled()
        XCTAssertFalse(collectionView.deleteItemsCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(collectionView.deleteItemsItems,
                     "The index paths should be cleared after spying is complete")
    }

    func testDeleteItemsCallWithoutContext() {
        association = UICollectionViewSpyAssociations.deleteItems
        inspectImplementations()

        XCTAssertFalse(collectionView.deleteItemsCalled,
                       "By default the collection view should not indicate having had `deleteItems(at:)` called")
        XCTAssertNil(collectionView.deleteItemsItems,
                     "By default the index paths should be missing")

        collectionView.beginSpyingOnDeleteItems()
        validateMethodsAreSwizzled()

        collectionView.itemCountsBySection = [3, 2]
        collectionView.reloadData()

        collectionView.performBatchUpdates({ [unowned self] in
            self.collectionView.itemCountsBySection = [2, 1]
            self.collectionView.deleteItems(at: self.items)
        })

        XCTAssertTrue(collectionView.deleteItemsCalled,
                      "The collection view should now indicate having had `deleteItems(at:)` called")
        XCTAssertEqual(collectionView.deleteItemsItems!, items,
                       "The index paths should be captured")

        collectionView.endSpyingOnDeleteItems()
        validateMethodsAreNotSwizzled()
        XCTAssertFalse(collectionView.deleteItemsCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(collectionView.deleteItemsItems,
                     "The index paths should be cleared after spying is complete")
    }


    //  MARK: - `reloadItems(at:)`

    func testReloadItemsCallWithContext() {
        association = UICollectionViewSpyAssociations.reloadItems
        inspectImplementations()

        XCTAssertFalse(collectionView.reloadItemsCalled,
                       "By default the collection view should not indicate having had `reloadItems(at:)` called")
        XCTAssertNil(collectionView.reloadItemsItems,
                     "By default the index paths should be missing")

        collectionView.spyOnReloadItems {
            contextExecuted = true
            validateMethodsAreSwizzled()

            collectionView.itemCountsBySection = [3, 2]
            collectionView.reloadData()

            collectionView.reloadItems(at: items)

            XCTAssertTrue(collectionView.reloadItemsCalled,
                          "The collection view should now indicate having had `reloadItems(at:)` called")
            XCTAssertEqual(collectionView.reloadItemsItems!, items,
                           "The index paths should be captured")
        }

        XCTAssertTrue(contextExecuted, "The context should be executed")
        validateMethodsAreNotSwizzled()
        XCTAssertFalse(collectionView.reloadItemsCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(collectionView.reloadItemsItems,
                     "The index paths should be cleared after spying is complete")
    }

    func testReloadItemsCallWithoutContext() {
        association = UICollectionViewSpyAssociations.reloadItems
        inspectImplementations()

        XCTAssertFalse(collectionView.reloadItemsCalled,
                       "By default the collection view should not indicate having had `reloadItems(at:)` called")
        XCTAssertNil(collectionView.reloadItemsItems,
                     "By default the index paths should be missing")

        collectionView.beginSpyingOnReloadItems()
        validateMethodsAreSwizzled()

        collectionView.itemCountsBySection = [3, 2]
        collectionView.reloadData()

        collectionView.reloadItems(at: items)

        XCTAssertTrue(collectionView.reloadItemsCalled,
                      "The collection view should now indicate having had `reloadItems(at:)` called")
        XCTAssertEqual(collectionView.reloadItemsItems!, items,
                       "The index paths should be captured")

        collectionView.endSpyingOnReloadItems()
        validateMethodsAreNotSwizzled()
        XCTAssertFalse(collectionView.reloadItemsCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(collectionView.reloadItemsItems,
                     "The index paths should be cleared after spying is complete")
    }


    //  MARK: - `moveItem(at:to:)`

    func testMoveItemCallWithContext() {
        association = UICollectionViewSpyAssociations.moveItem
        inspectImplementations()

        XCTAssertFalse(collectionView.moveItemCalled,
                       "By default the collection view should not indicate having had `moveItem(at:to:)` called")
        XCTAssertNil(collectionView.moveItemFromItem,
                     "By default the from item should be missing")
        XCTAssertNil(collectionView.moveItemToItem,
                     "By default the to item should be missing")

        collectionView.spyOnMoveItem {
            contextExecuted = true
            validateMethodsAreSwizzled()

            collectionView.itemCountsBySection = [3, 2]
            collectionView.reloadData()

            collectionView.performBatchUpdates({ [unowned self] in
                self.collectionView.itemCountsBySection = [4, 1]
                self.collectionView.moveItem(at: self.items[0], to: self.items[1])
            })

            XCTAssertTrue(collectionView.moveItemCalled,
                          "The collection view should now indicate having had `moveItem(_:toItem:)` called")
            XCTAssertEqual(collectionView.moveItemFromItem, items[0], "The from item should be captured")
            XCTAssertEqual(collectionView.moveItemToItem, items[1], "The to item should be captured")
        }

        XCTAssertTrue(contextExecuted, "The context should be executed")
        validateMethodsAreNotSwizzled()
        XCTAssertFalse(collectionView.moveItemCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(collectionView.moveItemFromItem,
                     "The from item should be cleared after spying is complete")
        XCTAssertNil(collectionView.moveItemToItem,
                     "The to item should be cleared after spying is complete")
    }

    func testMoveItemCallWithoutContext() {
        association = UICollectionViewSpyAssociations.moveItem
        inspectImplementations()

        XCTAssertFalse(collectionView.moveItemCalled,
                       "By default the collection view should not indicate having had `moveItem(at:to:)` called")
        XCTAssertNil(collectionView.moveItemFromItem,
                     "By default the from item should be missing")
        XCTAssertNil(collectionView.moveItemToItem,
                     "By default the to item should be missing")

        collectionView.itemCountsBySection = [3, 2]
        collectionView.reloadData()

        collectionView.beginSpyingOnMoveItem()
        validateMethodsAreSwizzled()

        collectionView.performBatchUpdates({ [unowned self] in
            self.collectionView.itemCountsBySection = [4, 1]
            self.collectionView.moveItem(at: self.items[0], to: self.items[1])
        })

        XCTAssertTrue(collectionView.moveItemCalled,
                      "The collection view should now indicate having had `moveItem(_:toItem:)` called")
        XCTAssertEqual(collectionView.moveItemFromItem, items[0], "The from item should be captured")
        XCTAssertEqual(collectionView.moveItemToItem, items[1], "The to item should be captured")
        
        collectionView.endSpyingOnMoveItem()
        validateMethodsAreNotSwizzled()
        
        XCTAssertFalse(collectionView.moveItemCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(collectionView.moveItemFromItem,
                     "The from item should be cleared after spying is complete")
        XCTAssertNil(collectionView.moveItemToItem,
                     "The to item should be cleared after spying is complete")
    }
    
}


fileprivate extension UICollectionViewSpyAssociations {
    
    static let allAssociations = [
        UICollectionViewSpyAssociations.reloadData,
        UICollectionViewSpyAssociations.insertSections,
        UICollectionViewSpyAssociations.deleteSections,
        UICollectionViewSpyAssociations.reloadSections,
        UICollectionViewSpyAssociations.moveSection,
        UICollectionViewSpyAssociations.insertItems,
        UICollectionViewSpyAssociations.deleteItems,
        UICollectionViewSpyAssociations.reloadItems,
        UICollectionViewSpyAssociations.moveItem
    ]

}
