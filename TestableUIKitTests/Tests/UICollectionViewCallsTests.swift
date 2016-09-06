//
//  UICollectionViewCallsTests.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/22/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import XCTest
import TestableUIKit

class UICollectionViewCallsTests: XCTestCase {

    var collectionView: UICollectionView!
    let sectionIndexSet = NSIndexSet(index: 1)
    let indexPaths = [NSIndexPath(forItem: 1, inSection: 1), NSIndexPath(forItem: 2, inSection: 0)]

    override func setUp() {
        super.setUp()

        let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        collectionView = UICollectionView(frame: frame, collectionViewLayout: UICollectionViewFlowLayout())
    }

    func testShimMethodForwarding() {
        XCTAssertTrue(collectionView.shouldForwardByDefault, "This shim should forward methods by default")
        XCTAssertTrue(collectionView.shouldForwardMethodCallWithSelector("someSelector"), "The method should be forwarded by default")
        collectionView.setShouldForwardMethodCallWithSelector("someSelector", false)
        XCTAssertFalse(collectionView.shouldForwardMethodCallWithSelector("someSelector"), "The method should not be forwarded now")
        collectionView.setShouldForwardMethodCallWithSelector("someSelector", true)
        XCTAssertTrue(collectionView.shouldForwardMethodCallWithSelector("someSelector"), "The method should now be forwarded again")
    }

    func testReloadDataCall() {
        XCTAssertFalse(collectionView.reloadDataCalled, "The collection view should not indicate having had reloadData called by default")
        collectionView.reloadData()
        XCTAssertTrue(collectionView.reloadDataCalled, "The collection view should now indicate having had reloadData called")
    }

    //  MARK: Sections

    func testInsertSectionsCall() {
        collectionView.setShouldForwardMethodCallWithSelector("insertSections:", false)
        XCTAssertFalse(collectionView.insertSectionsCalled, "The collection view should not indicate having had insertSections called by default")
        XCTAssertNil(collectionView.insertSectionsIndexSet, "The index set should be missing by default")
        let indexSet = NSIndexSet(index: 1)
        collectionView.insertSections(indexSet)
        XCTAssertTrue(collectionView.insertSectionsCalled, "The collection view should now indicate having had insertSections called")
        XCTAssertEqual(collectionView.insertSectionsIndexSet!, indexSet, "The index set should be captured")
    }

    func testDeleteSectionsCall() {
        collectionView.setShouldForwardMethodCallWithSelector("deleteSections:", false)
        XCTAssertFalse(collectionView.deleteSectionsCalled, "The collection view should not indicate having had deleteSections called by default")
        XCTAssertNil(collectionView.deleteSectionsIndexSet, "The index set should be missing by default")
        collectionView.deleteSections(sectionIndexSet)
        XCTAssertTrue(collectionView.deleteSectionsCalled, "The collection view should now indicate having had deleteSections called")
        XCTAssertEqual(collectionView.deleteSectionsIndexSet!, sectionIndexSet, "The index set should be captured")
    }

    func testReloadSectionsCall() {
        collectionView.setShouldForwardMethodCallWithSelector("reloadSections:", false)
        XCTAssertFalse(collectionView.reloadSectionsCalled, "The collection view should not indicate having had reloadSections called by default")
        XCTAssertNil(collectionView.reloadSectionsIndexSet, "The index set should be missing by default")
        collectionView.reloadSections(sectionIndexSet)
        XCTAssertTrue(collectionView.reloadSectionsCalled, "The collection view should now indicate having had reloadSections called")
        XCTAssertEqual(collectionView.reloadSectionsIndexSet!, sectionIndexSet, "The index set should be captured")
    }

    func testMoveSectionCall() {
        collectionView.setShouldForwardMethodCallWithSelector("moveSection:toSection:", false)
        XCTAssertFalse(collectionView.moveSectionCalled, "The collection view should not indicate having had moveSection called by default")
        XCTAssertNil(collectionView.moveSectionFromIndex, "The from index should be missing by default")
        XCTAssertNil(collectionView.moveSectionToIndex, "The to index should be missing by default")
        collectionView.moveSection(2, toSection: 0)
        XCTAssertTrue(collectionView.moveSectionCalled, "The collection view should now indicate having had moveSection called")
        XCTAssertEqual(collectionView.moveSectionFromIndex!, 2, "The from index should be captured")
        XCTAssertEqual(collectionView.moveSectionToIndex!, 0, "The to index should be captured")
    }

    //  MARK: Items

    func testInsertItemsCall() {
        collectionView.setShouldForwardMethodCallWithSelector("insertItemsAtIndexPaths:", false)
        XCTAssertFalse(collectionView.insertItemsCalled, "The table view should not indicate having had insertItems called by default")
        XCTAssertNil(collectionView.insertItemsIndexPaths, "The index paths should be missing by default")
        collectionView.insertItemsAtIndexPaths(indexPaths)
        XCTAssertTrue(collectionView.insertItemsCalled, "The table view should now indicate having had insertItems called")
        XCTAssertEqual(collectionView.insertItemsIndexPaths!.count, 2, "The index paths should be captured")
        XCTAssertEqual(collectionView.insertItemsIndexPaths![0], indexPaths[0], "The index paths should be captured")
        XCTAssertEqual(collectionView.insertItemsIndexPaths![1], indexPaths[1], "The index paths should be captured")
    }

    func testDeleteItemsCall() {
        collectionView.setShouldForwardMethodCallWithSelector("deleteItemsAtIndexPaths:", false)
        XCTAssertFalse(collectionView.deleteItemsCalled, "The table view should not indicate having had deleteItems called by default")
        XCTAssertNil(collectionView.deleteItemsIndexPaths, "The index paths should be missing by default")
        collectionView.deleteItemsAtIndexPaths(indexPaths)
        XCTAssertTrue(collectionView.deleteItemsCalled, "The table view should now indicate having had deleteItems called")
        XCTAssertEqual(collectionView.deleteItemsIndexPaths!.count, 2, "The index paths should be captured")
        XCTAssertEqual(collectionView.deleteItemsIndexPaths![0], indexPaths[0], "The index paths should be captured")
        XCTAssertEqual(collectionView.deleteItemsIndexPaths![1], indexPaths[1], "The index paths should be captured")
    }

    func testReloadItemsCall() {
        collectionView.setShouldForwardMethodCallWithSelector("reloadItemsAtIndexPaths:", false)
        XCTAssertFalse(collectionView.reloadItemsCalled, "The table view should not indicate having had reloadItems called by default")
        XCTAssertNil(collectionView.reloadItemsIndexPaths, "The index paths should be missing by default")
        collectionView.reloadItemsAtIndexPaths(indexPaths)
        XCTAssertTrue(collectionView.reloadItemsCalled, "The table view should now indicate having had reloadItems called")
        XCTAssertEqual(collectionView.reloadItemsIndexPaths!.count, 2, "The index paths should be captured")
        XCTAssertEqual(collectionView.reloadItemsIndexPaths![0], indexPaths[0], "The index paths should be captured")
        XCTAssertEqual(collectionView.reloadItemsIndexPaths![1], indexPaths[1], "The index paths should be captured")
    }

    func testMoveItemCall() {
        collectionView.setShouldForwardMethodCallWithSelector("moveItemAtIndexPath:toIndexPath:", false)
        XCTAssertFalse(collectionView.moveItemCalled, "The table view should not indicate having had moveItem called by default")
        XCTAssertNil(collectionView.moveItemFromIndexPath, "The from index path should be missing by default")
        XCTAssertNil(collectionView.moveItemToIndexPath, "The to index path should be missing by default")
        collectionView.moveItemAtIndexPath(indexPaths[0], toIndexPath: indexPaths[1])
        XCTAssertTrue(collectionView.moveItemCalled, "The table view should now indicate having had moveItem called")
        XCTAssertEqual(collectionView.moveItemFromIndexPath!, indexPaths[0], "The from index path should be captured")
        XCTAssertEqual(collectionView.moveItemToIndexPath!, indexPaths[1], "The to index path should be captured")
    }

}
