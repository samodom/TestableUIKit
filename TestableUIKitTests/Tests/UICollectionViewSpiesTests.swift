//
//  UICollectionViewSpiesTests.swift
//  TestableUIKit
//
//  Created by Sam Odom on 2/21/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//

import XCTest
import TestableUIKit


class UICollectionViewSpiesTests: XCTestCase {

    let collectionView = TestCollectionView(
        frame: SampleFrame,
        collectionViewLayout: UICollectionViewFlowLayout()
    )

    var sections: IndexSet = [2, 3]
    var items = [
        IndexPath(item: 1, section: 1),
        IndexPath(item: 2, section: 0)
    ]

    override func setUp() {
        super.setUp()

        collectionView.itemCountsBySection = [3, 2]
        UIApplication.rootView.addSubview(collectionView)
    }

    override func tearDown() {
        collectionView.removeFromSuperview()

        super.tearDown()
    }


    // MARK: - `reloadData`

    func testReloadDataControllerForwardingBehavior() {
        XCTAssertEqual(UICollectionView.ReloadDataSpyController.forwardingBehavior, .always,
                       "Spies on `reloadData` should always forward their method invocations")
    }

    func testSpyingOnReloadData() {
        collectionView.reloadDataTestMethodCalled = false
        let spy = UICollectionView.ReloadDataSpyController.createSpy(on: collectionView)!

        XCTAssertFalse(collectionView.reloadDataCalled,
                       "By default the collection view should not indicate having been asked to reload its data")

        spy.beginSpying()

        collectionView.reloadData()
        XCTAssertTrue(collectionView.reloadDataCalled,
                      "The collection view should indicate having been asked to reload its data")
        XCTAssertTrue(collectionView.reloadDataTestMethodCalled,
                      "The spy method should forward the invocation to the original method")

        spy.endSpying()

        XCTAssertFalse(collectionView.reloadDataCalled,
                       "The flag should be cleared after spying is complete")
    }


    // MARK: - `performBatchUpdates(_:completion:)`

    func testSpyingOnPerformBatchUpdatesWithoutForwarding() {
        XCTAssertFalse(collectionView.performBatchUpdatesCalled,
                       "By default the collection view should not indicate having been asked to perform batch updates")
        XCTAssertNil(collectionView.performBatchUpdatesUpdates,
                     "By default there should be no updates closure")
        XCTAssertNil(collectionView.performBatchUpdatesCompletion,
                     "By default there should be no completion handler")

        var updatesClosureInvoked = false
        let updates = {
            updatesClosureInvoked = true
        }

        var completionHandlerInvoked = false
        let completion: (Bool) -> Void = { success in
            completionHandlerInvoked = true
        }

        UICollectionView.PerformBatchUpdatesSpyController.forwardingBehavior = .custom(false)
        let spy = UICollectionView.PerformBatchUpdatesSpyController.createSpy(on: collectionView)!

        spy.beginSpying()

        collectionView.performBatchUpdates(updates, completion: completion)

        XCTAssertTrue(collectionView.performBatchUpdatesCalled,
                      "The collection view should indicate having been asked to perform batch updates")
        XCTAssertFalse(updatesClosureInvoked,
                       "The spy method should not forward the invocation to the original method")
        XCTAssertFalse(completionHandlerInvoked,
                       "The spy method should not forward the invocation to the original method")

        collectionView.performBatchUpdatesUpdates!()
        XCTAssertTrue(updatesClosureInvoked, "The updates closure should be captured")

        collectionView.performBatchUpdatesCompletion!(true)
        XCTAssertTrue(completionHandlerInvoked, "The completion handler should be captured")

        spy.endSpying()

        XCTAssertFalse(collectionView.performBatchUpdatesCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(collectionView.performBatchUpdatesUpdates,
                     "The updates closure should be cleared after spying is complete")
        XCTAssertNil(collectionView.performBatchUpdatesCompletion,
                     "The completion handler should be cleared after spying is complete")
    }

    func testSpyingOnPerformBatchUpdatesWithForwarding() {
        collectionView.performBatchUpdatesTestMethodCalled = false
        XCTAssertFalse(collectionView.performBatchUpdatesCalled,
                       "By default the collection view should not indicate having been asked to perform batch updates")
        XCTAssertNil(collectionView.performBatchUpdatesUpdates,
                     "By default there should be no updates closure")
        XCTAssertNil(collectionView.performBatchUpdatesCompletion,
                     "By default there should be no completion handler")

        UICollectionView.PerformBatchUpdatesSpyController.forwardingBehavior = .custom(true)
        let spy = UICollectionView.PerformBatchUpdatesSpyController.createSpy(on: collectionView)!

        spy.beginSpying()

        collectionView.performBatchUpdates({}, completion: { _ in })

        XCTAssertTrue(collectionView.performBatchUpdatesCalled,
                      "The collection view should indicate having been asked to perform batch updates")
        XCTAssertTrue(collectionView.performBatchUpdatesTestMethodCalled,
                      "The spy method should forward the invocation to the original method")

        XCTAssertNil(collectionView.performBatchUpdatesUpdates,
                     "The updates closure should not have been captured")
        XCTAssertNil(collectionView.performBatchUpdatesCompletion,
                     "The updates closure should not have been captured")

        spy.endSpying()

        XCTAssertFalse(collectionView.performBatchUpdatesCalled,
                       "The flag should be cleared after spying is complete")
    }


    //  MARK: - `insertSections(_:)`

    func testInsertSectionsControllerForwardingBehavior() {
        XCTAssertEqual(UICollectionView.InsertSectionsSpyController.forwardingBehavior, .always,
                       "Spies on `insertSections(_:)` should always forward their method invocations")
    }

    func testInsertSectionsSpy() {
        XCTAssertFalse(collectionView.insertSectionsCalled,
                       "By default the collection view should not indicate having had sections inserted")
        XCTAssertNil(collectionView.insertSectionsSections,
                     "By default the sections should be empty")

        let spy = UICollectionView.InsertSectionsSpyController.createSpy(on: collectionView)!
        spy.beginSpying()

        collectionView.performBatchUpdates({ [collectionView, sections] in
            collectionView.itemCountsBySection.append(contentsOf: [1, 1])
            collectionView.insertSections(sections)
        })

        XCTAssertTrue(collectionView.insertSectionsCalled,
                      "A collection view being spied upon should indicate having had `insertSections(_:)` called on it")
        XCTAssertEqual(collectionView.insertSectionsSections!, sections,
                       "The inserted sections should be captured")
        XCTAssertEqual(collectionView.numberOfSections, 4,
                       "The spy method should always forward the method call to the original implementation")

        spy.endSpying()

        XCTAssertFalse(collectionView.insertSectionsCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(collectionView.insertSectionsSections,
                     "The sections should be cleared after spying is complete")
    }


    //  MARK: - `deleteSections(_:)`

    func testDeleteSectionsControllerForwardingBehavior() {
        XCTAssertEqual(UICollectionView.DeleteSectionsSpyController.forwardingBehavior, .always,
                       "Spies on `deleteSections(_:)` should always forward their method invocations")
    }

    func testDeleteSectionsSpy() {
        XCTAssertFalse(collectionView.deleteSectionsCalled,
                       "By default the collection view should not indicate having had sections deleted")
        XCTAssertNil(collectionView.deleteSectionsSections,
                     "By default the sections should be empty")

        let spy = UICollectionView.DeleteSectionsSpyController.createSpy(on: collectionView)!

        collectionView.itemCountsBySection.append(contentsOf: [1, 1])
        collectionView.reloadData()

        spy.beginSpying()

        collectionView.performBatchUpdates({ [collectionView, sections] in
            collectionView.itemCountsBySection.removeLast(2)
            collectionView.deleteSections(sections)
        })

        XCTAssertTrue(collectionView.deleteSectionsCalled,
                      "A collection view being spied upon should indicate having had `deleteSections(_:)` called on it")
        XCTAssertEqual(collectionView.deleteSectionsSections!, sections,
                       "The deleted sections should be captured")
        XCTAssertEqual(collectionView.numberOfSections, 2,
                       "The spy method should always forward the method call to the original implementation")

        spy.endSpying()

        XCTAssertFalse(collectionView.deleteSectionsCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(collectionView.deleteSectionsSections,
                     "The sections should be cleared after spying is complete")
    }


    //  MARK: - `reloadSections(_:)`

    func testReloadSectionsControllerForwardingBehavior() {
        XCTAssertEqual(UICollectionView.ReloadSectionsSpyController.forwardingBehavior, .always,
                       "Spies on `reloadSections(_:)` should always forward their method invocations")
    }

    func testReloadSectionsSpy() {
        collectionView.reloadSectionsTestMethodCalled = false
        XCTAssertFalse(collectionView.reloadSectionsCalled,
                       "By default the collection view should not indicate having had sections reloaded")
        XCTAssertNil(collectionView.reloadSectionsSections,
                     "By default the sections should be empty")

        sections = [1, 1]

        let spy = UICollectionView.ReloadSectionsSpyController.createSpy(on: collectionView)!
        spy.beginSpying()

        collectionView.reloadSections(sections)

        XCTAssertTrue(collectionView.reloadSectionsCalled,
                      "A collection view being spied upon should indicate having had `reloadSections(_:)` called on it")
        XCTAssertEqual(collectionView.reloadSectionsSections!, sections,
                       "The reloaded sections should be captured")
        XCTAssertTrue(collectionView.reloadSectionsTestMethodCalled,
                      "The spy method should always forward the method call to the original implementation")

        spy.endSpying()

        XCTAssertFalse(collectionView.reloadSectionsCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(collectionView.reloadSectionsSections,
                     "The sections should be cleared after spying is complete")
    }


    //  MARK: - `moveSection(_:toSection:)`

    func testMoveSectionControllerForwardingBehavior() {
        XCTAssertEqual(UICollectionView.MoveSectionSpyController.forwardingBehavior, .always,
                       "Spies on `moveSection(_:toSection:)` should always forward their method invocations")
    }

    func testMoveSectionSpy() {
        XCTAssertFalse(collectionView.moveSectionCalled,
                       "By default the collection view should not indicate having had a section moved")
        XCTAssertNil(collectionView.moveSectionFromSection,
                     "By default the source section should be empty")
        XCTAssertNil(collectionView.moveSectionToSection,
                     "By default the destination section should be empty")

        let spy = UICollectionView.MoveSectionSpyController.createSpy(on: collectionView)!

        let initialItemCounts = collectionView.itemCountsBySection
        let fromSection = 1
        let toSection = 0

        spy.beginSpying()

        collectionView.performBatchUpdates({ [collectionView, fromSection, toSection] in
            collectionView.itemCountsBySection = initialItemCounts.reversed()
            collectionView.moveSection(fromSection, toSection: toSection)
        })

        XCTAssertTrue(collectionView.moveSectionCalled,
                      "A collection view being spied upon should indicate having had `moveSection(_:toSection:)` called on it")
        XCTAssertEqual(collectionView.moveSectionFromSection!, fromSection,
                       "The source section should be captured")
        XCTAssertEqual(collectionView.moveSectionToSection!, toSection,
                       "The destination section should be captured")
        XCTAssertEqual(collectionView.numberOfItems(inSection: 0), initialItemCounts.reversed()[0],
                      "The spy method should always forward the method call to the original implementation")
        XCTAssertEqual(collectionView.numberOfItems(inSection: 1), initialItemCounts.reversed()[1],
                       "The spy method should always forward the method call to the original implementation")

        spy.endSpying()

        XCTAssertFalse(collectionView.moveSectionCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(collectionView.moveSectionFromSection,
                     "The source section should be cleared after spying is complete")
        XCTAssertNil(collectionView.moveSectionToSection,
                     "The destination section should be cleared after spying is complete")
    }


    //  MARK: - `insertItems(at:)`

    func testInsertItemsControllerForwardingBehavior() {
        XCTAssertEqual(UICollectionView.InsertItemsSpyController.forwardingBehavior, .always,
                       "Spies on `insertItems(at:)` should always forward their method invocations")
    }

    func testInsertItemsSpy() {
        XCTAssertFalse(collectionView.insertItemsCalled,
                       "By default the collection view should not indicate having had items inserted")
        XCTAssertNil(collectionView.insertItemsIndexPaths,
                     "By default the items should be empty")

        let spy = UICollectionView.InsertItemsSpyController.createSpy(on: collectionView)!
        spy.beginSpying()

        collectionView.performBatchUpdates({ [collectionView, items] in
            collectionView.itemCountsBySection = [4, 3]
            collectionView.insertItems(at: items)
        })

        XCTAssertTrue(collectionView.insertItemsCalled,
                      "A collection view being spied upon should indicate having had `insertItems(at:)` called on it")
        XCTAssertEqual(collectionView.insertItemsIndexPaths!, items,
                       "The inserted items should be captured")
        XCTAssertEqual(collectionView.numberOfItems(inSection: 0), 4,
                       "The spy method should always forward the method call to the original implementation")
        XCTAssertEqual(collectionView.numberOfItems(inSection: 1), 3,
                       "The spy method should always forward the method call to the original implementation")

        spy.endSpying()

        XCTAssertFalse(collectionView.insertItemsCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(collectionView.insertItemsIndexPaths,
                     "The items should be cleared after spying is complete")
    }


    //  MARK: - `deleteItems(at:)`

    func testDeleteItemsControllerForwardingBehavior() {
        XCTAssertEqual(UICollectionView.DeleteItemsSpyController.forwardingBehavior, .always,
                       "Spies on `deleteItems(at:)` should always forward their method invocations")
    }

    func testDeleteItemsSpy() {
        XCTAssertFalse(collectionView.deleteItemsCalled,
                       "By default the collection view should not indicate having had items deleted")
        XCTAssertNil(collectionView.deleteItemsIndexPaths,
                     "By default the items should be empty")

        collectionView.itemCountsBySection = [3, 2]
        collectionView.reloadData()

        let spy = UICollectionView.DeleteItemsSpyController.createSpy(on: collectionView)!
        spy.beginSpying()

        collectionView.performBatchUpdates({ [collectionView, items] in
            collectionView.itemCountsBySection = [2, 1]
            collectionView.deleteItems(at: items)
        })

        XCTAssertTrue(collectionView.deleteItemsCalled,
                      "A collection view being spied upon should indicate having had `deleteItems(at:)` called on it")
        XCTAssertEqual(collectionView.deleteItemsIndexPaths!, items,
                       "The inserted items should be captured")
        XCTAssertEqual(collectionView.numberOfItems(inSection: 0), 2,
                       "The spy method should always forward the method call to the original implementation")
        XCTAssertEqual(collectionView.numberOfItems(inSection: 1), 1,
                       "The spy method should always forward the method call to the original implementation")

        spy.endSpying()

        XCTAssertFalse(collectionView.deleteItemsCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(collectionView.deleteItemsIndexPaths,
                     "The items should be cleared after spying is complete")
    }


    //  MARK: - `reloadItems(at:)`

    func testReloadItemsControllerForwardingBehavior() {
        XCTAssertEqual(UICollectionView.ReloadItemsSpyController.forwardingBehavior, .always,
                       "Spies on `reloadItems(at:)` should always forward their method invocations")
    }

    func testReloadItemsSpy() {
        collectionView.reloadItemsTestMethodCalled = false
        XCTAssertFalse(collectionView.reloadItemsCalled,
                       "By default the collection view should not indicate having had items reloaded")
        XCTAssertNil(collectionView.reloadItemsIndexPaths,
                     "By default the items should be empty")

        let spy = UICollectionView.ReloadItemsSpyController.createSpy(on: collectionView)!
        spy.beginSpying()

        collectionView.reloadItems(at: items)

        XCTAssertTrue(collectionView.reloadItemsCalled,
                      "A collection view being spied upon should indicate having had `reloadItems(at:)` called on it")
        XCTAssertEqual(collectionView.reloadItemsIndexPaths!, items,
                       "The inserted items should be captured")
        XCTAssertTrue(collectionView.reloadItemsTestMethodCalled,
                      "The spy method should always forward the method call to the original implementation")

        spy.endSpying()

        XCTAssertFalse(collectionView.reloadItemsCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(collectionView.reloadItemsIndexPaths,
                     "The items should be cleared after spying is complete")
    }


    //  MARK: - `moveItem(at:to:)`

    func testMoveItemControllerForwardingBehavior() {
        XCTAssertEqual(UICollectionView.MoveItemSpyController.forwardingBehavior, .always,
                       "Spies on `moveItem(at:to:)` should always forward their method invocations")
    }

    func testMoveItemSpy() {
        XCTAssertFalse(collectionView.moveItemCalled,
                       "By default the collection view should not indicate having had an item moved")
        XCTAssertNil(collectionView.moveItemFromItem,
                     "By default the sections should be empty")
        XCTAssertNil(collectionView.moveItemToItem,
                     "By default the animation type should be empty")

        let fromItem = IndexPath(item: 0, section: 1)
        let toItem = IndexPath(item: 1, section: 0)

        let spy = UICollectionView.MoveItemSpyController.createSpy(on: collectionView)!

        spy.beginSpying()

        collectionView.performBatchUpdates({ [collectionView] in
            collectionView.itemCountsBySection = [4, 1]
            collectionView.moveItem(at: fromItem, to: toItem)
        })

        XCTAssertTrue(collectionView.moveItemCalled,
                      "A collection view being spied upon should indicate having had `moveItem(at:to:)` called on it")
        XCTAssertEqual(collectionView.moveItemFromItem!, fromItem,
                       "The source item should be captured")
        XCTAssertEqual(collectionView.moveItemToItem!, toItem,
                       "The destination item should be captured")
        XCTAssertEqual(collectionView.numberOfItems(inSection: 0), 4,
                       "The spy method should always forward the method call to the original implementation")
        XCTAssertEqual(collectionView.numberOfItems(inSection: 1), 1,
                       "The spy method should always forward the method call to the original implementation")

        spy.endSpying()

        XCTAssertFalse(collectionView.moveItemCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(collectionView.moveItemFromItem,
                     "The source item should be cleared after spying is complete")
        XCTAssertNil(collectionView.moveItemToItem,
                     "The destination item should be cleared after spying is complete")
    }

}
