//
//  UITableView.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/22/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit
import FoundationSwagger


public extension UITableView {

    //  MARK: - `reloadData`

    /// Indicates whether the `reloadData` method has been called on this object.
    public final var reloadDataCalled: Bool {
        get {
            return booleanAssociation(
                for: UITableViewSpyCaptureKeys.reloadDataCalled,
                defaultValue: false
            )
        }
        set {
            let key = UITableViewSpyCaptureKeys.reloadDataCalled
            guard newValue else {
                return removeAssociation(for: key)
            }

            associate(newValue, with: key)
        }
    }


    //  MARK: - `beginUpdates`

    /// Indicates whether the `beginUpdates` method has been called on this object.
    public final var beginUpdatesCalled: Bool {
        get {
            return booleanAssociation(
                for: UITableViewSpyCaptureKeys.beginUpdatesCalled,
                defaultValue: false
            )
        }
        set {
            let key = UITableViewSpyCaptureKeys.beginUpdatesCalled
            guard newValue else {
                return removeAssociation(for: key)
            }

            associate(newValue, with: key)
        }
    }


    //  MARK: - `endUpdates`

    /// Indicates whether the `endUpdates` method has been called on this object.
    public final var endUpdatesCalled: Bool {
        get {
            return booleanAssociation(
                for: UITableViewSpyCaptureKeys.endUpdatesCalled,
                defaultValue: false
            )
        }
        set {
            let key = UITableViewSpyCaptureKeys.endUpdatesCalled
            guard newValue else {
                return removeAssociation(for: key)
            }

            associate(newValue, with: key)
        }
    }


    //  MARK: - `insertSections(_:with:)`

    /// Indicates whether the `insertSections(_:with:)` method has been called on this object.
    public final var insertSectionsCalled: Bool {
        get {
            return booleanAssociation(
                for: UITableViewSpyCaptureKeys.insertSectionsCalled,
                defaultValue: false
            )
        }
        set {
            let key = UITableViewSpyCaptureKeys.insertSectionsCalled
            guard newValue else {
                return removeAssociation(for: key)
            }

            associate(newValue, with: key)
        }
    }


    /// Provides the index set of sections that was passed to the `insertSections(_:with:)` method, if called.
    public final var insertSectionsSections: IndexSet? {
        get {
            return association(for: UITableViewSpyCaptureKeys.insertSectionsSections) as? IndexSet
        }
        set {
            let key = UITableViewSpyCaptureKeys.insertSectionsSections
            guard let sections = newValue else {
                return removeAssociation(for: key)
            }

            associate(sections, with: key)
        }
    }


    /// Provides the row animation that was passed to `insertSections(_:with:)` method, if called.
    public final var insertSectionsAnimation: UITableViewRowAnimation? {
        get {
            return association(for: UITableViewSpyCaptureKeys.insertSectionsAnimation) as? UITableViewRowAnimation
        }
        set {
            let key = UITableViewSpyCaptureKeys.insertSectionsAnimation
            guard let animation = newValue else {
                return removeAssociation(for: key)
            }

            associate(animation, with: key)
        }
    }


    //  MARK: - `deleteSections(_:with:)`

    /// Indicates whether the `deleteSections(_:with:)` method has been called on this object.
    public final var deleteSectionsCalled: Bool {
        get {
            return booleanAssociation(
                for: UITableViewSpyCaptureKeys.deleteSectionsCalled,
                defaultValue: false
            )
        }
        set {
            let key = UITableViewSpyCaptureKeys.deleteSectionsCalled
            guard newValue else {
                return removeAssociation(for: key)
            }

            associate(newValue, with: key)
        }
    }


    /// Provides the index set of sections that was passed to the `deleteSections(_:with:)` method, if called.
    public final var deleteSectionsSections: IndexSet? {
        get {
            return association(for: UITableViewSpyCaptureKeys.deleteSectionsSections) as? IndexSet
        }
        set {
            let key = UITableViewSpyCaptureKeys.deleteSectionsSections
            guard let sections = newValue else {
                return removeAssociation(for: key)
            }

            associate(sections, with: key)
        }
    }


    /// Provides the row animation that was passed to `deleteSections(_:with:)` method, if called.
    public final var deleteSectionsAnimation: UITableViewRowAnimation? {
        get {
            return association(for: UITableViewSpyCaptureKeys.deleteSectionsAnimation) as? UITableViewRowAnimation
        }
        set {
            let key = UITableViewSpyCaptureKeys.deleteSectionsAnimation
            guard let animation = newValue else {
                return removeAssociation(for: key)
            }

            associate(animation, with: key)
        }
    }
    

    //  MARK: - `reloadSections(_:with:)`

    /// Indicates whether the `reloadSections(_:with:)` method has been called on this object.
    public final var reloadSectionsCalled: Bool {
        get {
            return booleanAssociation(
                for: UITableViewSpyCaptureKeys.reloadSectionsCalled,
                defaultValue: false
            )
        }
        set {
            let key = UITableViewSpyCaptureKeys.reloadSectionsCalled
            guard newValue else {
                return removeAssociation(for: key)
            }

            associate(newValue, with: key)
        }
    }


    /// Provides the index set of sections that was passed to the `reloadSections(_:with:)` method, if called.
    public final var reloadSectionsSections: IndexSet? {
        get {
            return association(for: UITableViewSpyCaptureKeys.reloadSectionsSections) as? IndexSet
        }
        set {
            let key = UITableViewSpyCaptureKeys.reloadSectionsSections
            guard let sections = newValue else {
                return removeAssociation(for: key)
            }

            associate(sections, with: key)
        }
    }


    /// Provides the row animation that was passed to `reloadSections(_:with:)` method, if called.
    public final var reloadSectionsAnimation: UITableViewRowAnimation? {
        get {
            return association(for: UITableViewSpyCaptureKeys.reloadSectionsAnimation) as? UITableViewRowAnimation
        }
        set {
            let key = UITableViewSpyCaptureKeys.reloadSectionsAnimation
            guard let animation = newValue else {
                return removeAssociation(for: key)
            }

            associate(animation, with: key)
        }
    }


    //  MARK: - `moveSection(_:toSection:)`

    /// Indicates whether the `moveSection(_:toSection:)` method has been called on this object.
    public final var moveSectionCalled: Bool {
        get {
            return booleanAssociation(
                for: UITableViewSpyCaptureKeys.moveSectionCalled,
                defaultValue: false
            )
        }
        set {
            let key = UITableViewSpyCaptureKeys.moveSectionCalled
            guard newValue else {
                return removeAssociation(for: key)
            }

            associate(newValue, with: key)
        }
    }


    /// Provides the source section index that was passed to the `moveSection(_:toSection:)` method, if called.
    public final var moveSectionFromSection: Int? {
        get {
            return integerAssociation(for: UITableViewSpyCaptureKeys.moveSectionFromSection)
        }
        set {
            let key = UITableViewSpyCaptureKeys.moveSectionFromSection
            guard let section = newValue else {
                return removeAssociation(for: key)
            }

            associate(section, with: key)
        }
    }


    /// Provides the destination section index that was passed to the `moveSection(_:toSection:)` method, if called.
    public final var moveSectionToSection: Int? {
        get {
            return integerAssociation(for: UITableViewSpyCaptureKeys.moveSectionToSection)
        }
        set {
            let key = UITableViewSpyCaptureKeys.moveSectionToSection
            guard let section = newValue else {
                return removeAssociation(for: key)
            }

            associate(section, with: key)
        }
    }


    //  MARK: - `reloadSectionIndexTitles`

    /// Indicates whether the `reloadSectionIndexTitles` method has been called on this object.
    public final var reloadSectionIndexTitlesCalled: Bool {
        get {
            return booleanAssociation(
                for: UITableViewSpyCaptureKeys.reloadSectionIndexTitlesCalled,
                defaultValue: false
            )
        }
        set {
            let key = UITableViewSpyCaptureKeys.reloadSectionIndexTitlesCalled
            guard newValue else {
                return removeAssociation(for: key)
            }

            associate(newValue, with: key)
        }
    }


    //  MARK: - `insertRows(at:with:)`

    /// Indicates whether the `insertRows(at:with:)` method has been called on this object.
    public final var insertRowsCalled: Bool {
        get {
            return booleanAssociation(
                for: UITableViewSpyCaptureKeys.insertRowsCalled,
                defaultValue: false
            )
        }
        set {
            let key = UITableViewSpyCaptureKeys.insertRowsCalled
            guard newValue else {
                return removeAssociation(for: key)
            }

            associate(newValue, with: key)
        }
    }


    /// Provides the index paths of rows that were passed to the `insertRows(at:with:)` method, if called.
    public final var insertRowsRows: [IndexPath]? {
        get {
            return association(for: UITableViewSpyCaptureKeys.insertRowsRows) as? [IndexPath]
        }
        set {
            let key = UITableViewSpyCaptureKeys.insertRowsRows
            guard let rows = newValue else {
                return removeAssociation(for: key)
            }

            associate(rows, with: key)
        }
    }


    /// Provides the row animation that was passed to `insertRows(at:with:)` method, if called.
    public final var insertRowsAnimation: UITableViewRowAnimation? {
        get {
            return association(for: UITableViewSpyCaptureKeys.insertRowsAnimation) as? UITableViewRowAnimation
        }
        set {
            let key = UITableViewSpyCaptureKeys.insertRowsAnimation
            guard let animation = newValue else {
                return removeAssociation(for: key)
            }

            associate(animation, with: key)
        }
    }


    //  MARK: - `deleteRows(at:with:)`

    /// Indicates whether the `deleteRows(at:with:)` method has been called on this object.
    public final var deleteRowsCalled: Bool {
        get {
            return booleanAssociation(
                for: UITableViewSpyCaptureKeys.deleteRowsCalled,
                defaultValue: false
            )
        }
        set {
            let key = UITableViewSpyCaptureKeys.deleteRowsCalled
            guard newValue else {
                return removeAssociation(for: key)
            }

            associate(newValue, with: key)
        }
    }


    /// Provides the index paths of rows that were passed to the `deleteRows(at:with:)` method, if called.
    public final var deleteRowsRows: [IndexPath]? {
        get {
            return association(for: UITableViewSpyCaptureKeys.deleteRowsRows) as? [IndexPath]
        }
        set {
            let key = UITableViewSpyCaptureKeys.deleteRowsRows
            guard let rows = newValue else {
                return removeAssociation(for: key)
            }

            associate(rows, with: key)
        }
    }


    /// Provides the row animation that was passed to `deleteRows(at:with:)` method, if called.
    public final var deleteRowsAnimation: UITableViewRowAnimation? {
        get {
            return association(for: UITableViewSpyCaptureKeys.deleteRowsAnimation) as? UITableViewRowAnimation
        }
        set {
            let key = UITableViewSpyCaptureKeys.deleteRowsAnimation
            guard let animation = newValue else {
                return removeAssociation(for: key)
            }

            associate(animation, with: key)
        }
    }


    //  MARK: - `reloadRows(at:with:)`

    /// Indicates whether the `reloadRows(at:with:)` method has been called on this object.
    public final var reloadRowsCalled: Bool {
        get {
            return booleanAssociation(
                for: UITableViewSpyCaptureKeys.reloadRowsCalled,
                defaultValue: false
            )
        }
        set {
            let key = UITableViewSpyCaptureKeys.reloadRowsCalled
            guard newValue else {
                return removeAssociation(for: key)
            }

            associate(newValue, with: key)
        }
    }


    /// Provides the index paths of rows that were passed to the `reloadRows(at:with:)` method, if called.
    public final var reloadRowsRows: [IndexPath]? {
        get {
            return association(for: UITableViewSpyCaptureKeys.reloadRowsRows) as? [IndexPath]
        }
        set {
            let key = UITableViewSpyCaptureKeys.reloadRowsRows
            guard let rows = newValue else {
                return removeAssociation(for: key)
            }

            associate(rows, with: key)
        }
    }


    /// Provides the row animation that was passed to `reloadRows(at:with:)` method, if called.
    public final var reloadRowsAnimation: UITableViewRowAnimation? {
        get {
            return association(for: UITableViewSpyCaptureKeys.reloadRowsAnimation) as? UITableViewRowAnimation
        }
        set {
            let key = UITableViewSpyCaptureKeys.reloadRowsAnimation
            guard let animation = newValue else {
                return removeAssociation(for: key)
            }

            associate(animation, with: key)
        }
    }


    //  MARK: - `moveRow(at:to:)

    /// Indicates whether the `moveRow(at:to:) method has been called on this object.
    public final var moveRowCalled: Bool {
        get {
            return booleanAssociation(
                for: UITableViewSpyCaptureKeys.moveRowCalled,
                defaultValue: false
            )
        }
        set {
            let key = UITableViewSpyCaptureKeys.moveRowCalled
            guard newValue else {
                return removeAssociation(for: key)
            }

            associate(newValue, with: key)
        }
    }


    /// Provides the source row index path that was passed to the `moveRow(at:to:) method, if called.
    public final var moveRowFromRow: IndexPath? {
        get {
            return association(for: UITableViewSpyCaptureKeys.moveRowFromRow) as? IndexPath
        }
        set {
            let key = UITableViewSpyCaptureKeys.moveRowFromRow
            guard let section = newValue else {
                return removeAssociation(for: key)
            }

            associate(section, with: key)
        }
    }


    /// Provides the destination row index path that was passed to the `moveRow(at:to:) method, if called.
    public final var moveRowToRow: IndexPath? {
        get {
            return association(for: UITableViewSpyCaptureKeys.moveRowToRow) as? IndexPath
        }
        set {
            let key = UITableViewSpyCaptureKeys.moveRowToRow
            guard let section = newValue else {
                return removeAssociation(for: key)
            }

            associate(section, with: key)
        }
    }

}
