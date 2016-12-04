//
//  UITableViewSpyCaptureKeys.swift
//  TestableUIKit
//
//  Created by Sam Odom on 11/28/16.
//  Copyright © 2016 Swagger Soft. All rights reserved.
//

import FoundationSwagger

enum UITableViewSpyCaptureKeys {

    //  MARK: - `reloadData`

    static let reloadData = [reloadDataCalled]
    private static let reloadDataCalledString = UUIDKeyString()
    static let reloadDataCalled = ObjectAssociationKey(reloadDataCalledString)


    //  MARK: - `beginUpdates`

    static let beginUpdates = [beginUpdatesCalled]
    private static let beginUpdatesCalledString = UUIDKeyString()
    static let beginUpdatesCalled = ObjectAssociationKey(beginUpdatesCalledString)


    //  MARK: - `endUpdates`

    static let endUpdates = [endUpdatesCalled]
    private static let endUpdatesCalledString = UUIDKeyString()
    static let endUpdatesCalled = ObjectAssociationKey(endUpdatesCalledString)


    //  MARK: - `insertSections(_:with:)`

    static let insertSections = [insertSectionsCalled, insertSectionsSections, insertSectionsAnimation]
    private static let insertSectionsCalledString = UUIDKeyString()
    private static let insertSectionsSectionsString = UUIDKeyString()
    private static let insertSectionsAnimationString = UUIDKeyString()
    static let insertSectionsCalled = ObjectAssociationKey(insertSectionsCalledString)
    static let insertSectionsSections = ObjectAssociationKey(insertSectionsSectionsString)
    static let insertSectionsAnimation = ObjectAssociationKey(insertSectionsAnimationString)


    //  MARK: - `deleteSections(_:with:)`

    static let deleteSections = [deleteSectionsCalled, deleteSectionsSections, deleteSectionsAnimation]
    private static let deleteSectionsCalledString = UUIDKeyString()
    private static let deleteSectionsSectionsString = UUIDKeyString()
    private static let deleteSectionsAnimationString = UUIDKeyString()
    static let deleteSectionsCalled = ObjectAssociationKey(deleteSectionsCalledString)
    static let deleteSectionsSections = ObjectAssociationKey(deleteSectionsSectionsString)
    static let deleteSectionsAnimation = ObjectAssociationKey(deleteSectionsAnimationString)


    //  MARK: - `reloadSections(_:with:)`

    static let reloadSections = [reloadSectionsCalled, reloadSectionsSections, reloadSectionsAnimation]
    private static let reloadSectionsCalledString = UUIDKeyString()
    private static let reloadSectionsSectionsString = UUIDKeyString()
    private static let reloadSectionsAnimationString = UUIDKeyString()
    static let reloadSectionsCalled = ObjectAssociationKey(reloadSectionsCalledString)
    static let reloadSectionsSections = ObjectAssociationKey(reloadSectionsSectionsString)
    static let reloadSectionsAnimation = ObjectAssociationKey(reloadSectionsAnimationString)


    //  MARK: - `moveSection(_:toSection:)`

    static let moveSection = [moveSectionCalled, moveSectionFromSection, moveSectionToSection]
    private static let moveSectionCalledString = UUIDKeyString()
    private static let moveSectionFromSectionString = UUIDKeyString()
    private static let moveSectionToSectionString = UUIDKeyString()
    static let moveSectionCalled = ObjectAssociationKey(moveSectionCalledString)
    static let moveSectionFromSection = ObjectAssociationKey(moveSectionFromSectionString)
    static let moveSectionToSection = ObjectAssociationKey(moveSectionToSectionString)


    //  MARK: - `reloadSectionIndexTitles`

    static let reloadSectionIndexTitles = [reloadSectionIndexTitlesCalled]
    private static let reloadSectionIndexTitlesCalledString = UUIDKeyString()
    static let reloadSectionIndexTitlesCalled = ObjectAssociationKey(reloadSectionIndexTitlesCalledString)


    //  MARK: - `insertRows(at:with:)`

    static let insertRows = [insertRowsCalled, insertRowsRows, insertRowsAnimation]
    private static let insertRowsCalledString = UUIDKeyString()
    private static let insertRowsRowsString = UUIDKeyString()
    private static let insertRowsAnimationString = UUIDKeyString()
    static let insertRowsCalled = ObjectAssociationKey(insertRowsCalledString)
    static let insertRowsRows = ObjectAssociationKey(insertRowsRowsString)
    static let insertRowsAnimation = ObjectAssociationKey(insertRowsAnimationString)


    //  MARK: - `deleteRows(at:with:)`

    static let deleteRows = [deleteRowsCalled, deleteRowsRows, deleteRowsAnimation]
    private static let deleteRowsCalledString = UUIDKeyString()
    private static let deleteRowsRowsString = UUIDKeyString()
    private static let deleteRowsAnimationString = UUIDKeyString()
    static let deleteRowsCalled = ObjectAssociationKey(deleteRowsCalledString)
    static let deleteRowsRows = ObjectAssociationKey(deleteRowsRowsString)
    static let deleteRowsAnimation = ObjectAssociationKey(deleteRowsAnimationString)


    //  MARK: - `reloadRows(at:with:)`

    static let reloadRows = [reloadRowsCalled, reloadRowsRows, reloadRowsAnimation]
    private static let reloadRowsCalledString = UUIDKeyString()
    private static let reloadRowsRowsString = UUIDKeyString()
    private static let reloadRowsAnimationString = UUIDKeyString()
    static let reloadRowsCalled = ObjectAssociationKey(reloadRowsCalledString)
    static let reloadRowsRows = ObjectAssociationKey(reloadRowsRowsString)
    static let reloadRowsAnimation = ObjectAssociationKey(reloadRowsAnimationString)


    //  MARK: - `moveRow(at:to:)`

    static let moveRow = [moveRowCalled, moveRowFromRow, moveRowToRow]
    private static let moveRowCalledString = UUIDKeyString()
    private static let moveRowFromRowString = UUIDKeyString()
    private static let moveRowToRowString = UUIDKeyString()
    static let moveRowCalled = ObjectAssociationKey(moveRowCalledString)
    static let moveRowFromRow = ObjectAssociationKey(moveRowFromRowString)
    static let moveRowToRow = ObjectAssociationKey(moveRowToRowString)

}
