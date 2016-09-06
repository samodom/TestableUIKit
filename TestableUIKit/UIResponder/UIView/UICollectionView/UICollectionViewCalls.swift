//
//  UICollectionViewCalls.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/22/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

public extension TestableUIKit.UICollectionView {

    public override func reloadData() {
        reloadDataCalled = true

        let selector = UICollectionViewTestableSelectors.ReloadData
        if UICollectionView.shouldForwardMethodCallWithSelector(selector) {
            super.reloadData()
        }
    }

    //  MARK: Sections

    public override func insertSections(sections: NSIndexSet) {
        insertSectionsCalled = true
        insertSectionsIndexSet = sections

        let selector = UICollectionViewTestableSelectors.InsertSections
        if UICollectionView.shouldForwardMethodCallWithSelector(selector) {
            super.insertSections(sections)
        }
    }

    public override func deleteSections(sections: NSIndexSet) {
        deleteSectionsCalled = true
        deleteSectionsIndexSet = sections

        let selector = UICollectionViewTestableSelectors.DeleteSections
        if UICollectionView.shouldForwardMethodCallWithSelector(selector) {
            super.deleteSections(sections)
        }
    }

    public override func reloadSections(sections: NSIndexSet) {
        reloadSectionsCalled = true
        reloadSectionsIndexSet = sections

        let selector = UICollectionViewTestableSelectors.ReloadSections
        if UICollectionView.shouldForwardMethodCallWithSelector(selector) {
            super.reloadSections(sections)
        }
    }

    public override func moveSection(section: Int, toSection newSection: Int) {
        moveSectionCalled = true
        moveSectionFromIndex = section
        moveSectionToIndex = newSection

        let selector = UICollectionViewTestableSelectors.MoveSection
        if UICollectionView.shouldForwardMethodCallWithSelector(selector) {
            super.moveSection(section, toSection: newSection)
        }
    }

    //  MARK: Items

    public override func insertItemsAtIndexPaths(indexPaths: [NSIndexPath]) {
        insertItemsCalled = true
        insertItemsIndexPaths = indexPaths

        let selector = UICollectionViewTestableSelectors.InsertItems
        if UICollectionView.shouldForwardMethodCallWithSelector(selector) {
            super.insertItemsAtIndexPaths(indexPaths)
        }
    }

    public override func deleteItemsAtIndexPaths(indexPaths: [NSIndexPath]) {
        deleteItemsCalled = true
        deleteItemsIndexPaths = indexPaths

        let selector = UICollectionViewTestableSelectors.DeleteItems
        if UICollectionView.shouldForwardMethodCallWithSelector(selector) {
            super.deleteItemsAtIndexPaths(indexPaths)
        }
    }

    public override func reloadItemsAtIndexPaths(indexPaths: [NSIndexPath]) {
        reloadItemsCalled = true
        reloadItemsIndexPaths = indexPaths

        let selector = UICollectionViewTestableSelectors.ReloadItems
        if UICollectionView.shouldForwardMethodCallWithSelector(selector) {
            super.reloadItemsAtIndexPaths(indexPaths)
        }
    }

    public override func moveItemAtIndexPath(indexPath: NSIndexPath, toIndexPath newIndexPath: NSIndexPath) {
        moveItemCalled = true
        moveItemFromIndexPath = indexPath
        moveItemToIndexPath = newIndexPath

        let selector = UICollectionViewTestableSelectors.MoveItem
        if UICollectionView.shouldForwardMethodCallWithSelector(selector) {
            super.moveItemAtIndexPath(indexPath, toIndexPath: newIndexPath)
        }
    }

}
