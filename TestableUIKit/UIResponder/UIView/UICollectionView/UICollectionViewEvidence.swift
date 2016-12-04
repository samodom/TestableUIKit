//
//  UICollectionView.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/22/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit
import FoundationSwagger


public extension UICollectionView {

    //  MARK: - `reloadData`

    /// Indicates whether the `reloadData` method has been called on this object.
    public final var reloadDataCalled: Bool {
        get {
            return booleanAssociation(
                for: UICollectionViewSpyCaptureKeys.reloadDataCalled,
                defaultValue: false
            )
        }
        set {
            let key = UICollectionViewSpyCaptureKeys.reloadDataCalled
            guard newValue else {
                return removeAssociation(for: key)
            }

            associate(newValue, with: key)
        }
    }


    //  MARK: - `insertSections(_:)`

    /// Indicates whether the `insertSections(_:)` method has been called on this object.
    public final var insertSectionsCalled: Bool {
        get {
            return booleanAssociation(
                for: UICollectionViewSpyCaptureKeys.insertSectionsCalled,
                defaultValue: false
            )
        }
        set {
            let key = UICollectionViewSpyCaptureKeys.insertSectionsCalled
            guard newValue else {
                return removeAssociation(for: key)
            }

            associate(newValue, with: key)
        }
    }


    /// Provides the index set of sections that was passed to the `insertSections(_:)` method, if called.
    public final var insertSectionsSections: IndexSet? {
        get {
            return association(for: UICollectionViewSpyCaptureKeys.insertSectionsSections) as? IndexSet
        }
        set {
            let key = UICollectionViewSpyCaptureKeys.insertSectionsSections
            guard let sections = newValue else {
                return removeAssociation(for: key)
            }

            associate(sections, with: key)
        }
    }


    //  MARK: - `deleteSections(_:)`

    /// Indicates whether the `deleteSections(_:)` method has been called on this object.
    public final var deleteSectionsCalled: Bool {
        get {
            return booleanAssociation(
                for: UICollectionViewSpyCaptureKeys.deleteSectionsCalled,
                defaultValue: false
            )
        }
        set {
            let key = UICollectionViewSpyCaptureKeys.deleteSectionsCalled
            guard newValue else {
                return removeAssociation(for: key)
            }

            associate(newValue, with: key)
        }
    }


    /// Provides the index set of sections that was passed to the `deleteSections(_:)` method, if called.
    public final var deleteSectionsSections: IndexSet? {
        get {
            return association(for: UICollectionViewSpyCaptureKeys.deleteSectionsSections) as? IndexSet
        }
        set {
            let key = UICollectionViewSpyCaptureKeys.deleteSectionsSections
            guard let sections = newValue else {
                return removeAssociation(for: key)
            }

            associate(sections, with: key)
        }
    }


    //  MARK: - `reloadSections(_:)`

    /// Indicates whether the `reloadSections(_:)` method has been called on this object.
    public final var reloadSectionsCalled: Bool {
        get {
            return booleanAssociation(
                for: UICollectionViewSpyCaptureKeys.reloadSectionsCalled,
                defaultValue: false
            )
        }
        set {
            let key = UICollectionViewSpyCaptureKeys.reloadSectionsCalled
            guard newValue else {
                return removeAssociation(for: key)
            }

            associate(newValue, with: key)
        }
    }


    /// Provides the index set of sections that was passed to the `reloadSections(_:)` method, if called.
    public final var reloadSectionsSections: IndexSet? {
        get {
            return association(for: UICollectionViewSpyCaptureKeys.reloadSectionsSections) as? IndexSet
        }
        set {
            let key = UICollectionViewSpyCaptureKeys.reloadSectionsSections
            guard let sections = newValue else {
                return removeAssociation(for: key)
            }

            associate(sections, with: key)
        }
    }


    //  MARK: - `moveSection(_:toSection:)`

    /// Indicates whether the `moveSection(_:toSection:)` method has been called on this object.
    public final var moveSectionCalled: Bool {
        get {
            return booleanAssociation(
                for: UICollectionViewSpyCaptureKeys.moveSectionCalled,
                defaultValue: false
            )
        }
        set {
            let key = UICollectionViewSpyCaptureKeys.moveSectionCalled
            guard newValue else {
                return removeAssociation(for: key)
            }

            associate(newValue, with: key)
        }
    }


    /// Provides the source section index that was passed to the `moveSection(_:toSection:)` method, if called.
    public final var moveSectionFromSection: Int? {
        get {
            return integerAssociation(for: UICollectionViewSpyCaptureKeys.moveSectionFromSection)
        }
        set {
            let key = UICollectionViewSpyCaptureKeys.moveSectionFromSection
            guard let section = newValue else {
                return removeAssociation(for: key)
            }

            associate(section, with: key)
        }
    }


    /// Provides the destination section index that was passed to the `moveSection(_:toSection:)` method, if called.
    public final var moveSectionToSection: Int? {
        get {
            return integerAssociation(for: UICollectionViewSpyCaptureKeys.moveSectionToSection)
        }
        set {
            let key = UICollectionViewSpyCaptureKeys.moveSectionToSection
            guard let section = newValue else {
                return removeAssociation(for: key)
            }

            associate(section, with: key)
        }
    }


    //  MARK: - `insertItems(at:)`

    /// Indicates whether the `insertItems(at:)` method has been called on this object.
    public final var insertItemsCalled: Bool {
        get {
            return booleanAssociation(
                for: UICollectionViewSpyCaptureKeys.insertItemsCalled,
                defaultValue: false
            )
        }
        set {
            let key = UICollectionViewSpyCaptureKeys.insertItemsCalled
            guard newValue else {
                return removeAssociation(for: key)
            }

            associate(newValue, with: key)
        }
    }


    /// Provides the index paths of rows that were passed to the `insertItems(at:)` method, if called.
    public final var insertItemsItems: [IndexPath]? {
        get {
            return association(for: UICollectionViewSpyCaptureKeys.insertItemsItems) as? [IndexPath]
        }
        set {
            let key = UICollectionViewSpyCaptureKeys.insertItemsItems
            guard let rows = newValue else {
                return removeAssociation(for: key)
            }

            associate(rows, with: key)
        }
    }


    //  MARK: - `deleteItems(at:)`

    /// Indicates whether the `deleteItems(at:)` method has been called on this object.
    public final var deleteItemsCalled: Bool {
        get {
            return booleanAssociation(
                for: UICollectionViewSpyCaptureKeys.deleteItemsCalled,
                defaultValue: false
            )
        }
        set {
            let key = UICollectionViewSpyCaptureKeys.deleteItemsCalled
            guard newValue else {
                return removeAssociation(for: key)
            }

            associate(newValue, with: key)
        }
    }


    /// Provides the index paths of rows that were passed to the `deleteItems(at:)` method, if called.
    public final var deleteItemsItems: [IndexPath]? {
        get {
            return association(for: UICollectionViewSpyCaptureKeys.deleteItemsItems) as? [IndexPath]
        }
        set {
            let key = UICollectionViewSpyCaptureKeys.deleteItemsItems
            guard let rows = newValue else {
                return removeAssociation(for: key)
            }

            associate(rows, with: key)
        }
    }


    //  MARK: - `reloadItems(at:)`

    /// Indicates whether the `reloadItems(at:)` method has been called on this object.
    public final var reloadItemsCalled: Bool {
        get {
            return booleanAssociation(
                for: UICollectionViewSpyCaptureKeys.reloadItemsCalled,
                defaultValue: false
            )
        }
        set {
            let key = UICollectionViewSpyCaptureKeys.reloadItemsCalled
            guard newValue else {
                return removeAssociation(for: key)
            }

            associate(newValue, with: key)
        }
    }


    /// Provides the index paths of rows that were passed to the `reloadItems(at:)` method, if called.
    public final var reloadItemsItems: [IndexPath]? {
        get {
            return association(for: UICollectionViewSpyCaptureKeys.reloadItemsItems) as? [IndexPath]
        }
        set {
            let key = UICollectionViewSpyCaptureKeys.reloadItemsItems
            guard let rows = newValue else {
                return removeAssociation(for: key)
            }

            associate(rows, with: key)
        }
    }


    //  MARK: - `moveItem(at:to:)

    /// Indicates whether the `moveItem(at:to:) method has been called on this object.
    public final var moveItemCalled: Bool {
        get {
            return booleanAssociation(
                for: UICollectionViewSpyCaptureKeys.moveItemCalled,
                defaultValue: false
            )
        }
        set {
            let key = UICollectionViewSpyCaptureKeys.moveItemCalled
            guard newValue else {
                return removeAssociation(for: key)
            }

            associate(newValue, with: key)
        }
    }


    /// Provides the source row index path that was passed to the `moveItem(at:to:) method, if called.
    public final var moveItemFromItem: IndexPath? {
        get {
            return association(for: UICollectionViewSpyCaptureKeys.moveItemFromItem) as? IndexPath
        }
        set {
            let key = UICollectionViewSpyCaptureKeys.moveItemFromItem
            guard let section = newValue else {
                return removeAssociation(for: key)
            }

            associate(section, with: key)
        }
    }


    /// Provides the destination row index path that was passed to the `moveItem(at:to:) method, if called.
    public final var moveItemToItem: IndexPath? {
        get {
            return association(for: UICollectionViewSpyCaptureKeys.moveItemToItem) as? IndexPath
        }
        set {
            let key = UICollectionViewSpyCaptureKeys.moveItemToItem
            guard let section = newValue else {
                return removeAssociation(for: key)
            }

            associate(section, with: key)
        }
    }

}
