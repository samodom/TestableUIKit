//
//  UICollectionViewCalls.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/22/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit
import FoundationSwagger


public extension UICollectionView {

    //  MARK: - `reloadData`

    /// Spies on calls to `reloadData` and executes
    /// the provided context while the spy method is active
    /// - parameter context: Logic to execute while the spy method is active.
    public final func spyOnReloadData(in context: NullaryVoidClosure) {
        UICollectionViewSpyAssociations.reloadData.withAlternateImplementation(context: context)
        clearSpyAssociations(keys: UICollectionViewSpyCaptureKeys.reloadData)
    }


    /// Begins spying on calls to `reloadData`
    /// - note: Calls to this method should be balanced by calls to `endSpyingOnReloadData`
    public final func beginSpyingOnReloadData() {
        UICollectionViewSpyAssociations.reloadData.useAlternateImplementation()
    }


    /// Ends spying on calls to `reloadData`
    public final func endSpyingOnReloadData() {
        UICollectionViewSpyAssociations.reloadData.useOriginalImplementation()
        clearSpyAssociations(keys: UICollectionViewSpyCaptureKeys.reloadData)
    }


    /// Spy method that replaces the true implementation of `reloadData`
    public func spy_reloadData() {
        reloadDataCalled = true

        guard forwardsMethodCalls(for: UICollectionViewSpyAssociations.reloadData.originalSelector) else {
            return
        }

        spy_reloadData()
    }


    //  MARK: - `insertSections(_:)`

    /// Spies on calls to `insertSections(_:)` and executes
    /// the provided context while the spy method is active
    /// - parameter context: Logic to execute while the spy method is active.
    public final func spyOnInsertSections(in context: NullaryVoidClosure) {
        UICollectionViewSpyAssociations.insertSections.withAlternateImplementation(context: context)
        clearSpyAssociations(keys: UICollectionViewSpyCaptureKeys.insertSections)
    }


    /// Begins spying on calls to `insertSections(_:)`
    /// - note: Calls to this method should be balanced by calls to `endSpyingOnInsertSections`
    public final func beginSpyingOnInsertSections() {
        UICollectionViewSpyAssociations.insertSections.useAlternateImplementation()
    }


    /// Ends spying on calls to `insertSections(_:)`
    public final func endSpyingOnInsertSections() {
        UICollectionViewSpyAssociations.insertSections.useOriginalImplementation()
        clearSpyAssociations(keys: UICollectionViewSpyCaptureKeys.insertSections)
    }


    /// Spy method that replaces the true implementation of `insertSections(_:)`
    public func spy_insertSections(_ sections: IndexSet) {
        insertSectionsCalled = true
        insertSectionsSections = sections

        guard forwardsMethodCalls(for: UICollectionViewSpyAssociations.insertSections.originalSelector) else {
            return
        }
        
        spy_insertSections(sections)
    }


    //  MARK: - `deleteSections(_:)`

    /// Spies on calls to `deleteSections(_:)` and executes
    /// the provided context while the spy method is active
    /// - parameter context: Logic to execute while the spy method is active.
    public final func spyOnDeleteSections(in context: NullaryVoidClosure) {
        UICollectionViewSpyAssociations.deleteSections.withAlternateImplementation(context: context)
        clearSpyAssociations(keys: UICollectionViewSpyCaptureKeys.deleteSections)
    }


    /// Begins spying on calls to `deleteSections(_:)`
    /// - note: Calls to this method should be balanced by calls to `endSpyingOnDeleteSections`
    public final func beginSpyingOnDeleteSections() {
        UICollectionViewSpyAssociations.deleteSections.useAlternateImplementation()
    }


    /// Ends spying on calls to `deleteSections(_:)`
    public final func endSpyingOnDeleteSections() {
        UICollectionViewSpyAssociations.deleteSections.useOriginalImplementation()
        clearSpyAssociations(keys: UICollectionViewSpyCaptureKeys.deleteSections)
    }


    /// Spy method that replaces the true implementation of `deleteSections(_:)`
    public func spy_deleteSections(_ sections: IndexSet) {
        deleteSectionsCalled = true
        deleteSectionsSections = sections

        guard forwardsMethodCalls(for: UICollectionViewSpyAssociations.deleteSections.originalSelector) else {
            return
        }

        spy_deleteSections(sections)
    }


    //  MARK: - `reloadSections(_:)`

    /// Spies on calls to `reloadSections(_:)` and executes
    /// the provided context while the spy method is active
    /// - parameter context: Logic to execute while the spy method is active.
    public final func spyOnReloadSections(in context: NullaryVoidClosure) {
        UICollectionViewSpyAssociations.reloadSections.withAlternateImplementation(context: context)
        clearSpyAssociations(keys: UICollectionViewSpyCaptureKeys.reloadSections)
    }


    /// Begins spying on calls to `reloadSections(_:)`
    /// - note: Calls to this method should be balanced by calls to `endSpyingOnReloadSections`
    public final func beginSpyingOnReloadSections() {
        UICollectionViewSpyAssociations.reloadSections.useAlternateImplementation()
    }


    /// Ends spying on calls to `reloadSections(_:)`
    public final func endSpyingOnReloadSections() {
        UICollectionViewSpyAssociations.reloadSections.useOriginalImplementation()
        clearSpyAssociations(keys: UICollectionViewSpyCaptureKeys.reloadSections)
    }


    /// Spy method that replaces the true implementation of `reloadSections(_:)`
    public func spy_reloadSections(_ sections: IndexSet) {
        reloadSectionsCalled = true
        reloadSectionsSections = sections

        guard forwardsMethodCalls(for: UICollectionViewSpyAssociations.reloadSections.originalSelector) else {
            return
        }

        spy_reloadSections(sections)
    }


    //  MARK: - `moveSection(_:toSection:)`

    /// Spies on calls to `moveSection(_:toSection:)` and executes
    /// the provided context while the spy method is active
    /// - parameter context: Logic to execute while the spy method is active.
    public final func spyOnMoveSection(in context: NullaryVoidClosure) {
        UICollectionViewSpyAssociations.moveSection.withAlternateImplementation(context: context)
        clearSpyAssociations(keys: UICollectionViewSpyCaptureKeys.moveSection)
    }


    /// Begins spying on calls to `moveSection(_:toSection:)`
    /// - note: Calls to this method should be balanced by calls to `endSpyingOnMoveSection`
    public final func beginSpyingOnMoveSection() {
        UICollectionViewSpyAssociations.moveSection.useAlternateImplementation()
    }


    /// Ends spying on calls to `moveSection(_:toSection:)`
    public final func endSpyingOnMoveSection() {
        UICollectionViewSpyAssociations.moveSection.useOriginalImplementation()
        clearSpyAssociations(keys: UICollectionViewSpyCaptureKeys.moveSection)
    }


    /// Spy method that replaces the true implementation of `moveSection(_:toSection:)`
    public func spy_moveSection(_ source: Int, toSection destination: Int) {
        moveSectionCalled = true
        moveSectionFromSection = source
        moveSectionToSection = destination

        guard forwardsMethodCalls(for: UICollectionViewSpyAssociations.moveSection.originalSelector) else {
            return
        }

        spy_moveSection(source, toSection: destination)
    }


    //  MARK: - `insertItems(at:)`

    /// Spies on calls to `insertItems(at:)` and executes
    /// the provided context while the spy method is active
    /// - parameter context: Logic to execute while the spy method is active.
    public final func spyOnInsertItems(in context: NullaryVoidClosure) {
        UICollectionViewSpyAssociations.insertItems.withAlternateImplementation(context: context)
        clearSpyAssociations(keys: UICollectionViewSpyCaptureKeys.insertItems)
    }


    /// Begins spying on calls to `insertItems(at:)`
    /// - note: Calls to this method should be balanced by calls to `endSpyingOnInsertItems`
    public final func beginSpyingOnInsertItems() {
        UICollectionViewSpyAssociations.insertItems.useAlternateImplementation()
    }


    /// Ends spying on calls to `insertItems(at:)`
    public final func endSpyingOnInsertItems() {
        UICollectionViewSpyAssociations.insertItems.useOriginalImplementation()
        clearSpyAssociations(keys: UICollectionViewSpyCaptureKeys.insertItems)
    }


    /// Spy method that replaces the true implementation of `insertItems(at:)`
    public func spy_insertItems(at items: [IndexPath]) {
        insertItemsCalled = true
        insertItemsItems = items

        guard forwardsMethodCalls(for: UICollectionViewSpyAssociations.insertItems.originalSelector) else {
            return
        }

        spy_insertItems(at: items)
    }


    //  MARK: - `deleteItems(at:)`

    /// Spies on calls to `deleteItems(at:)` and executes
    /// the provided context while the spy method is active
    /// - parameter context: Logic to execute while the spy method is active.
    public final func spyOnDeleteItems(in context: NullaryVoidClosure) {
        UICollectionViewSpyAssociations.deleteItems.withAlternateImplementation(context: context)
        clearSpyAssociations(keys: UICollectionViewSpyCaptureKeys.deleteItems)
    }


    /// Begins spying on calls to `deleteItems(at:)`
    /// - note: Calls to this method should be balanced by calls to `endSpyingOnDeleteItems`
    public final func beginSpyingOnDeleteItems() {
        UICollectionViewSpyAssociations.deleteItems.useAlternateImplementation()
    }


    /// Ends spying on calls to `deleteItems(at:)`
    public final func endSpyingOnDeleteItems() {
        UICollectionViewSpyAssociations.deleteItems.useOriginalImplementation()
        clearSpyAssociations(keys: UICollectionViewSpyCaptureKeys.deleteItems)
    }


    /// Spy method that replaces the true implementation of `deleteItems(at:)`
    public func spy_deleteItems(at items: [IndexPath]) {
        deleteItemsCalled = true
        deleteItemsItems = items

        guard forwardsMethodCalls(for: UICollectionViewSpyAssociations.deleteItems.originalSelector) else {
            return
        }

        spy_deleteItems(at: items)
    }


    //  MARK: - `reloadItems(at:)`

    /// Spies on calls to `reloadItems(at:)` and executes
    /// the provided context while the spy method is active
    /// - parameter context: Logic to execute while the spy method is active.
    public final func spyOnReloadItems(in context: NullaryVoidClosure) {
        UICollectionViewSpyAssociations.reloadItems.withAlternateImplementation(context: context)
        clearSpyAssociations(keys: UICollectionViewSpyCaptureKeys.reloadItems)
    }


    /// Begins spying on calls to `reloadItems(at:)`
    /// - note: Calls to this method should be balanced by calls to `endSpyingOnReloadItems`
    public final func beginSpyingOnReloadItems() {
        UICollectionViewSpyAssociations.reloadItems.useAlternateImplementation()
    }


    /// Ends spying on calls to `reloadItems(at:)`
    public final func endSpyingOnReloadItems() {
        UICollectionViewSpyAssociations.reloadItems.useOriginalImplementation()
        clearSpyAssociations(keys: UICollectionViewSpyCaptureKeys.reloadItems)
    }


    /// Spy method that replaces the true implementation of `reloadItems(at:)`
    public func spy_reloadItems(at items: [IndexPath]) {
        reloadItemsCalled = true
        reloadItemsItems = items

        guard forwardsMethodCalls(for: UICollectionViewSpyAssociations.reloadItems.originalSelector) else {
            return
        }

        spy_reloadItems(at: items)
    }


    //  MARK: - `moveItem(at:to:)`

    /// Spies on calls to `moveItem(at:to:)` and executes
    /// the provided context while the spy method is active
    /// - parameter context: Logic to execute while the spy method is active.
    public final func spyOnMoveItem(in context: NullaryVoidClosure) {
        UICollectionViewSpyAssociations.moveItem.withAlternateImplementation(context: context)
        clearSpyAssociations(keys: UICollectionViewSpyCaptureKeys.moveItem)
    }


    /// Begins spying on calls to `moveItem(at:to:)`
    /// - note: Calls to this method should be balanced by calls to `endSpyingOnMoveItem`
    public final func beginSpyingOnMoveItem() {
        UICollectionViewSpyAssociations.moveItem.useAlternateImplementation()
    }


    /// Ends spying on calls to `moveItem(at:to:)`
    public final func endSpyingOnMoveItem() {
        UICollectionViewSpyAssociations.moveItem.useOriginalImplementation()
        clearSpyAssociations(keys: UICollectionViewSpyCaptureKeys.moveItem)
    }


    /// Spy method that replaces the true implementation of `moveItem(at:to:)`
    public func spy_moveItem(at source: IndexPath, to destination: IndexPath) {
        moveItemCalled = true
        moveItemFromItem = source
        moveItemToItem = destination

        guard forwardsMethodCalls(for: UICollectionViewSpyAssociations.moveItem.originalSelector) else {
            return
        }

        spy_moveItem(at: source, to: destination)
    }

}
