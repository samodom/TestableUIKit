//
//  UICollectionViewSpyCaptureKeys.swift
//  TestableUIKit
//
//  Created by Sam Odom on 11/28/16.
//  Copyright © 2016 Swagger Soft. All rights reserved.
//

import FoundationSwagger

enum UICollectionViewSpyCaptureKeys {

    //  MARK: - `reloadData`

    static let reloadData = [reloadDataCalled]
    private static let reloadDataCalledString = UUIDKeyString()
    static let reloadDataCalled = ObjectAssociationKey(reloadDataCalledString)


    //  MARK: - `insertSections(_:)`

    static let insertSections = [insertSectionsCalled, insertSectionsSections]
    private static let insertSectionsCalledString = UUIDKeyString()
    private static let insertSectionsSectionsString = UUIDKeyString()
    static let insertSectionsCalled = ObjectAssociationKey(insertSectionsCalledString)
    static let insertSectionsSections = ObjectAssociationKey(insertSectionsSectionsString)


    //  MARK: - `deleteSections(_:)`

    static let deleteSections = [deleteSectionsCalled, deleteSectionsSections]
    private static let deleteSectionsCalledString = UUIDKeyString()
    private static let deleteSectionsSectionsString = UUIDKeyString()
    static let deleteSectionsCalled = ObjectAssociationKey(deleteSectionsCalledString)
    static let deleteSectionsSections = ObjectAssociationKey(deleteSectionsSectionsString)


    //  MARK: - `reloadSections(_:)`

    static let reloadSections = [reloadSectionsCalled, reloadSectionsSections]
    private static let reloadSectionsCalledString = UUIDKeyString()
    private static let reloadSectionsSectionsString = UUIDKeyString()
    static let reloadSectionsCalled = ObjectAssociationKey(reloadSectionsCalledString)
    static let reloadSectionsSections = ObjectAssociationKey(reloadSectionsSectionsString)


    //  MARK: - `moveSection(_:toSection:)`

    static let moveSection = [moveSectionCalled, moveSectionFromSection]
    private static let moveSectionCalledString = UUIDKeyString()
    private static let moveSectionFromSectionString = UUIDKeyString()
    private static let moveSectionToSectionString = UUIDKeyString()
    static let moveSectionCalled = ObjectAssociationKey(moveSectionCalledString)
    static let moveSectionFromSection = ObjectAssociationKey(moveSectionFromSectionString)
    static let moveSectionToSection = ObjectAssociationKey(moveSectionToSectionString)


    //  MARK: - `insertItems(at:)`

    static let insertItems = [insertItemsCalled, insertItemsItems]
    private static let insertItemsCalledString = UUIDKeyString()
    private static let insertItemsItemsString = UUIDKeyString()
    static let insertItemsCalled = ObjectAssociationKey(insertItemsCalledString)
    static let insertItemsItems = ObjectAssociationKey(insertItemsItemsString)


    //  MARK: - `deleteItems(at:)`

    static let deleteItems = [deleteItemsCalled, deleteItemsItems]
    private static let deleteItemsCalledString = UUIDKeyString()
    private static let deleteItemsItemsString = UUIDKeyString()
    static let deleteItemsCalled = ObjectAssociationKey(deleteItemsCalledString)
    static let deleteItemsItems = ObjectAssociationKey(deleteItemsItemsString)


    //  MARK: - `reloadItems(at:)`

    static let reloadItems = [reloadItemsCalled, reloadItemsItems]
    private static let reloadItemsCalledString = UUIDKeyString()
    private static let reloadItemsItemsString = UUIDKeyString()
    static let reloadItemsCalled = ObjectAssociationKey(reloadItemsCalledString)
    static let reloadItemsItems = ObjectAssociationKey(reloadItemsItemsString)


    //  MARK: - `moveItem(at:to:)`

    static let moveItem = [moveItemCalled, moveItemFromItem, moveItemToItem]
    private static let moveItemCalledString = UUIDKeyString()
    private static let moveItemFromItemString = UUIDKeyString()
    private static let moveItemToItemString = UUIDKeyString()
    static let moveItemCalled = ObjectAssociationKey(moveItemCalledString)
    static let moveItemFromItem = ObjectAssociationKey(moveItemFromItemString)
    static let moveItemToItem = ObjectAssociationKey(moveItemToItemString)

}
