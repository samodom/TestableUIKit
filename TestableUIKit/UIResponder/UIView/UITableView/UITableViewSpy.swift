//
//  UITableViewCalls.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/22/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit
import FoundationSwagger


public extension UITableView {

    //  MARK: - `reloadData`

    /// Spies on calls to `reloadData` and executes
    /// the provided context while the spy method is active
    /// - parameter context: Logic to execute while the spy method is active.
    public final func spyOnReloadData(in context: SpyExecutionContext) {
        UITableViewSpyAssociations.reloadData.withAlternateImplementation(context: context)
        clearSpyAssociations(keys: UITableViewSpyCaptureKeys.reloadData)
    }


    /// Begins spying on calls to `reloadData`
    /// - note: Calls to this method should be balanced by calls to `endSpyingOnReloadData`
    public final func beginSpyingOnReloadData() {
        UITableViewSpyAssociations.reloadData.useAlternateImplementation()
    }


    /// Ends spying on calls to `reloadData`
    public final func endSpyingOnReloadData() {
        UITableViewSpyAssociations.reloadData.useOriginalImplementation()
        clearSpyAssociations(keys: UITableViewSpyCaptureKeys.reloadData)
    }


    /// Spy method that replaces the true implementation of `reloadData`
    public func spy_reloadData() {
        reloadDataCalled = true

        guard forwardsMethodCalls(for: UITableViewSpyAssociations.reloadData.originalSelector) else {
            return
        }

        spy_reloadData()
    }


    //  MARK: - `beginUpdates`

    /// Spies on calls to `beginUpdates` and executes
    /// the provided context while the spy method is active
    /// - parameter context: Logic to execute while the spy method is active.
    public final func spyOnBeginUpdates(in context: SpyExecutionContext) {
        UITableViewSpyAssociations.beginUpdates.withAlternateImplementation(context: context)
        clearSpyAssociations(keys: UITableViewSpyCaptureKeys.beginUpdates)
    }


    /// Begins spying on calls to `beginUpdates`
    /// - note: Calls to this method should be balanced by calls to `endSpyingOnBeginUpdates`
    public final func beginSpyingOnBeginUpdates() {
        UITableViewSpyAssociations.beginUpdates.useAlternateImplementation()
    }


    /// Ends spying on calls to `beginUpdates`
    public final func endSpyingOnBeginUpdates() {
        UITableViewSpyAssociations.beginUpdates.useOriginalImplementation()
        clearSpyAssociations(keys: UITableViewSpyCaptureKeys.beginUpdates)
    }


    /// Spy method that replaces the true implementation of `beginUpdates`
    public func spy_beginUpdates() {
        beginUpdatesCalled = true

        guard forwardsMethodCalls(for: UITableViewSpyAssociations.beginUpdates.originalSelector) else {
            return
        }

        spy_beginUpdates()
    }


    //  MARK: - `endUpdates`

    /// Spies on calls to `endUpdates` and executes
    /// the provided context while the spy method is active
    /// - parameter context: Logic to execute while the spy method is active.
    public final func spyOnEndUpdates(in context: SpyExecutionContext) {
        UITableViewSpyAssociations.endUpdates.withAlternateImplementation(context: context)
        clearSpyAssociations(keys: UITableViewSpyCaptureKeys.endUpdates)
    }


    /// Begins spying on calls to `endUpdates`
    /// - note: Calls to this method should be balanced by calls to `endSpyingOnEndUpdates`
    public final func beginSpyingOnEndUpdates() {
        UITableViewSpyAssociations.endUpdates.useAlternateImplementation()
    }


    /// Ends spying on calls to `endUpdates`
    public final func endSpyingOnEndUpdates() {
        UITableViewSpyAssociations.endUpdates.useOriginalImplementation()
        clearSpyAssociations(keys: UITableViewSpyCaptureKeys.endUpdates)
    }


    /// Spy method that replaces the true implementation of `endUpdates`
    public func spy_endUpdates() {
        endUpdatesCalled = true

        guard forwardsMethodCalls(for: UITableViewSpyAssociations.endUpdates.originalSelector) else {
            return
        }

        spy_endUpdates()
    }


    //  MARK: - `insertSections(_:with:)`

    /// Spies on calls to `insertSections(_:with:)` and executes
    /// the provided context while the spy method is active
    /// - parameter context: Logic to execute while the spy method is active.
    public final func spyOnInsertSections(in context: SpyExecutionContext) {
        UITableViewSpyAssociations.insertSections.withAlternateImplementation(context: context)
        clearSpyAssociations(keys: UITableViewSpyCaptureKeys.insertSections)
    }


    /// Begins spying on calls to `insertSections(_:with:)`
    /// - note: Calls to this method should be balanced by calls to `endSpyingOnInsertSections`
    public final func beginSpyingOnInsertSections() {
        UITableViewSpyAssociations.insertSections.useAlternateImplementation()
    }


    /// Ends spying on calls to `insertSections(_:with:)`
    public final func endSpyingOnInsertSections() {
        UITableViewSpyAssociations.insertSections.useOriginalImplementation()
        clearSpyAssociations(keys: UITableViewSpyCaptureKeys.insertSections)
    }


    /// Spy method that replaces the true implementation of `insertSections(_:with:)`
    public func spy_insertSections(_ sections: IndexSet, with animation: UITableViewRowAnimation) {
        insertSectionsCalled = true
        insertSectionsSections = sections
        insertSectionsAnimation = animation

        guard forwardsMethodCalls(for: UITableViewSpyAssociations.insertSections.originalSelector) else {
            return
        }
        
        spy_insertSections(sections, with: animation)
    }


    //  MARK: - `deleteSections(_:with:)`

    /// Spies on calls to `deleteSections(_:with:)` and executes
    /// the provided context while the spy method is active
    /// - parameter context: Logic to execute while the spy method is active.
    public final func spyOnDeleteSections(in context: SpyExecutionContext) {
        UITableViewSpyAssociations.deleteSections.withAlternateImplementation(context: context)
        clearSpyAssociations(keys: UITableViewSpyCaptureKeys.deleteSections)
    }


    /// Begins spying on calls to `deleteSections(_:with:)`
    /// - note: Calls to this method should be balanced by calls to `endSpyingOnDeleteSections`
    public final func beginSpyingOnDeleteSections() {
        UITableViewSpyAssociations.deleteSections.useAlternateImplementation()
    }


    /// Ends spying on calls to `deleteSections(_:with:)`
    public final func endSpyingOnDeleteSections() {
        UITableViewSpyAssociations.deleteSections.useOriginalImplementation()
        clearSpyAssociations(keys: UITableViewSpyCaptureKeys.deleteSections)
    }


    /// Spy method that replaces the true implementation of `deleteSections(_:with:)`
    public func spy_deleteSections(_ sections: IndexSet, with animation: UITableViewRowAnimation) {
        deleteSectionsCalled = true
        deleteSectionsSections = sections
        deleteSectionsAnimation = animation

        guard forwardsMethodCalls(for: UITableViewSpyAssociations.deleteSections.originalSelector) else {
            return
        }

        spy_deleteSections(sections, with: animation)
    }


    //  MARK: - `reloadSections(_:with:)`

    /// Spies on calls to `reloadSections(_:with:)` and executes
    /// the provided context while the spy method is active
    /// - parameter context: Logic to execute while the spy method is active.
    public final func spyOnReloadSections(in context: SpyExecutionContext) {
        UITableViewSpyAssociations.reloadSections.withAlternateImplementation(context: context)
        clearSpyAssociations(keys: UITableViewSpyCaptureKeys.reloadSections)
    }


    /// Begins spying on calls to `reloadSections(_:with:)`
    /// - note: Calls to this method should be balanced by calls to `endSpyingOnReloadSections`
    public final func beginSpyingOnReloadSections() {
        UITableViewSpyAssociations.reloadSections.useAlternateImplementation()
    }


    /// Ends spying on calls to `reloadSections(_:with:)`
    public final func endSpyingOnReloadSections() {
        UITableViewSpyAssociations.reloadSections.useOriginalImplementation()
        clearSpyAssociations(keys: UITableViewSpyCaptureKeys.reloadSections)
    }


    /// Spy method that replaces the true implementation of `reloadSections(_:with:)`
    public func spy_reloadSections(_ sections: IndexSet, with animation: UITableViewRowAnimation) {
        reloadSectionsCalled = true
        reloadSectionsSections = sections
        reloadSectionsAnimation = animation

        guard forwardsMethodCalls(for: UITableViewSpyAssociations.reloadSections.originalSelector) else {
            return
        }

        spy_reloadSections(sections, with: animation)
    }


    //  MARK: - `moveSection(_:toSection:)`

    /// Spies on calls to `moveSection(_:toSection:)` and executes
    /// the provided context while the spy method is active
    /// - parameter context: Logic to execute while the spy method is active.
    public final func spyOnMoveSection(in context: SpyExecutionContext) {
        UITableViewSpyAssociations.moveSection.withAlternateImplementation(context: context)
        clearSpyAssociations(keys: UITableViewSpyCaptureKeys.moveSection)
    }


    /// Begins spying on calls to `moveSection(_:toSection:)`
    /// - note: Calls to this method should be balanced by calls to `endSpyingOnMoveSection`
    public final func beginSpyingOnMoveSection() {
        UITableViewSpyAssociations.moveSection.useAlternateImplementation()
    }


    /// Ends spying on calls to `moveSection(_:toSection:)`
    public final func endSpyingOnMoveSection() {
        UITableViewSpyAssociations.moveSection.useOriginalImplementation()
        clearSpyAssociations(keys: UITableViewSpyCaptureKeys.moveSection)
    }


    /// Spy method that replaces the true implementation of `moveSection(_:toSection:)`
    public func spy_moveSection(_ source: Int, toSection destination: Int) {
        moveSectionCalled = true
        moveSectionFromSection = source
        moveSectionToSection = destination

        guard forwardsMethodCalls(for: UITableViewSpyAssociations.moveSection.originalSelector) else {
            return
        }

        spy_moveSection(source, toSection: destination)
    }


    //  MARK: - `reloadSectionIndexTitles`

    /// Spies on calls to `reloadSectionIndexTitles` and executes
    /// the provided context while the spy method is active
    /// - parameter context: Logic to execute while the spy method is active.
    public final func spyOnReloadSectionIndexTitles(in context: SpyExecutionContext) {
        UITableViewSpyAssociations.reloadSectionIndexTitles.withAlternateImplementation(context: context)
        clearSpyAssociations(keys: UITableViewSpyCaptureKeys.reloadSectionIndexTitles)
    }


    /// Begins spying on calls to `reloadSectionIndexTitles`
    /// - note: Calls to this method should be balanced by calls to `endSpyingOnReloadSectionIndexTitles`
    public final func beginSpyingOnReloadSectionIndexTitles() {
        UITableViewSpyAssociations.reloadSectionIndexTitles.useAlternateImplementation()
    }


    /// Ends spying on calls to `reloadSectionIndexTitles`
    public final func endSpyingOnReloadSectionIndexTitles() {
        UITableViewSpyAssociations.reloadSectionIndexTitles.useOriginalImplementation()
        clearSpyAssociations(keys: UITableViewSpyCaptureKeys.reloadSectionIndexTitles)
    }


    /// Spy method that replaces the true implementation of `reloadSectionIndexTitles`
    public func spy_reloadSectionIndexTitles() {
        reloadSectionIndexTitlesCalled = true

        guard forwardsMethodCalls(for: UITableViewSpyAssociations.reloadSectionIndexTitles.originalSelector) else {
            return
        }

        spy_reloadSectionIndexTitles()
    }
    

    //  MARK: - `insertRows(at:with:)`

    /// Spies on calls to `insertRows(at:with:)` and executes
    /// the provided context while the spy method is active
    /// - parameter context: Logic to execute while the spy method is active.
    public final func spyOnInsertRows(in context: SpyExecutionContext) {
        UITableViewSpyAssociations.insertRows.withAlternateImplementation(context: context)
        clearSpyAssociations(keys: UITableViewSpyCaptureKeys.insertRows)
    }


    /// Begins spying on calls to `insertRows(at:with:)`
    /// - note: Calls to this method should be balanced by calls to `endSpyingOnInsertRows`
    public final func beginSpyingOnInsertRows() {
        UITableViewSpyAssociations.insertRows.useAlternateImplementation()
    }


    /// Ends spying on calls to `insertRows(at:with:)`
    public final func endSpyingOnInsertRows() {
        UITableViewSpyAssociations.insertRows.useOriginalImplementation()
        clearSpyAssociations(keys: UITableViewSpyCaptureKeys.insertRows)
    }


    /// Spy method that replaces the true implementation of `insertRows(at:with:)`
    public func spy_insertRows(at rows: [IndexPath], with animation: UITableViewRowAnimation) {
        insertRowsCalled = true
        insertRowsRows = rows
        insertRowsAnimation = animation

        guard forwardsMethodCalls(for: UITableViewSpyAssociations.insertRows.originalSelector) else {
            return
        }

        spy_insertRows(at: rows, with: animation)
    }


    //  MARK: - `deleteRows(at:with:)`

    /// Spies on calls to `deleteRows(at:with:)` and executes
    /// the provided context while the spy method is active
    /// - parameter context: Logic to execute while the spy method is active.
    public final func spyOnDeleteRows(in context: SpyExecutionContext) {
        UITableViewSpyAssociations.deleteRows.withAlternateImplementation(context: context)
        clearSpyAssociations(keys: UITableViewSpyCaptureKeys.deleteRows)
    }


    /// Begins spying on calls to `deleteRows(at:with:)`
    /// - note: Calls to this method should be balanced by calls to `endSpyingOnDeleteRows`
    public final func beginSpyingOnDeleteRows() {
        UITableViewSpyAssociations.deleteRows.useAlternateImplementation()
    }


    /// Ends spying on calls to `deleteRows(at:with:)`
    public final func endSpyingOnDeleteRows() {
        UITableViewSpyAssociations.deleteRows.useOriginalImplementation()
        clearSpyAssociations(keys: UITableViewSpyCaptureKeys.deleteRows)
    }


    /// Spy method that replaces the true implementation of `deleteRows(at:with:)`
    public func spy_deleteRows(at rows: [IndexPath], with animation: UITableViewRowAnimation) {
        deleteRowsCalled = true
        deleteRowsRows = rows
        deleteRowsAnimation = animation

        guard forwardsMethodCalls(for: UITableViewSpyAssociations.deleteRows.originalSelector) else {
            return
        }

        spy_deleteRows(at: rows, with: animation)
    }


    //  MARK: - `reloadRows(at:with:)`

    /// Spies on calls to `reloadRows(at:with:)` and executes
    /// the provided context while the spy method is active
    /// - parameter context: Logic to execute while the spy method is active.
    public final func spyOnReloadRows(in context: SpyExecutionContext) {
        UITableViewSpyAssociations.reloadRows.withAlternateImplementation(context: context)
        clearSpyAssociations(keys: UITableViewSpyCaptureKeys.reloadRows)
    }


    /// Begins spying on calls to `reloadRows(at:with:)`
    /// - note: Calls to this method should be balanced by calls to `endSpyingOnReloadRows`
    public final func beginSpyingOnReloadRows() {
        UITableViewSpyAssociations.reloadRows.useAlternateImplementation()
    }


    /// Ends spying on calls to `reloadRows(at:with:)`
    public final func endSpyingOnReloadRows() {
        UITableViewSpyAssociations.reloadRows.useOriginalImplementation()
        clearSpyAssociations(keys: UITableViewSpyCaptureKeys.reloadRows)
    }


    /// Spy method that replaces the true implementation of `reloadRows(at:with:)`
    public func spy_reloadRows(at rows: [IndexPath], with animation: UITableViewRowAnimation) {
        reloadRowsCalled = true
        reloadRowsRows = rows
        reloadRowsAnimation = animation

        guard forwardsMethodCalls(for: UITableViewSpyAssociations.reloadRows.originalSelector) else {
            return
        }

        spy_reloadRows(at: rows, with: animation)
    }


    //  MARK: - `moveRow(at:to:)`

    /// Spies on calls to `moveRow(at:to:)` and executes
    /// the provided context while the spy method is active
    /// - parameter context: Logic to execute while the spy method is active.
    public final func spyOnMoveRow(in context: SpyExecutionContext) {
        UITableViewSpyAssociations.moveRow.withAlternateImplementation(context: context)
        clearSpyAssociations(keys: UITableViewSpyCaptureKeys.moveRow)
    }


    /// Begins spying on calls to `moveRow(at:to:)`
    /// - note: Calls to this method should be balanced by calls to `endSpyingOnMoveRow`
    public final func beginSpyingOnMoveRow() {
        UITableViewSpyAssociations.moveRow.useAlternateImplementation()
    }


    /// Ends spying on calls to `moveRow(at:to:)`
    public final func endSpyingOnMoveRow() {
        UITableViewSpyAssociations.moveRow.useOriginalImplementation()
        clearSpyAssociations(keys: UITableViewSpyCaptureKeys.moveRow)
    }


    /// Spy method that replaces the true implementation of `moveRow(at:to:)`
    public func spy_moveRow(at source: IndexPath, to destination: IndexPath) {
        moveRowCalled = true
        moveRowFromRow = source
        moveRowToRow = destination

        guard forwardsMethodCalls(for: UITableViewSpyAssociations.moveRow.originalSelector) else {
            return
        }

        spy_moveRow(at: source, to: destination)
    }

}
