//
//  UICollectionViewMethodAssociations.swift
//  TestableUIKit
//
//  Created by Sam Odom on 11/28/16.
//  Copyright © 2016 Swagger Soft. All rights reserved.
//

import FoundationSwagger


fileprivate enum UICollectionViewOriginalSelectors {
    static let reloadData = #selector(UICollectionView.reloadData)
    static let insertSections = #selector(UICollectionView.insertSections(_:))
    static let deleteSections = #selector(UICollectionView.deleteSections(_:))
    static let reloadSections = #selector(UICollectionView.reloadSections(_:))
    static let moveSection = #selector(UICollectionView.moveSection(_:toSection:))
    static let insertItems = #selector(UICollectionView.insertItems(at:))
    static let deleteItems = #selector(UICollectionView.deleteItems(at:))
    static let reloadItems = #selector(UICollectionView.reloadItems(at:))
    static let moveItem = #selector(UICollectionView.moveItem(at:to:))
}

fileprivate enum UICollectionViewSpySelectors {
    static let reloadData = #selector(UICollectionView.spy_reloadData)
    static let insertSections = #selector(UICollectionView.spy_insertSections(_:))
    static let deleteSections = #selector(UICollectionView.spy_deleteSections(_:))
    static let reloadSections = #selector(UICollectionView.spy_reloadSections(_:))
    static let moveSection = #selector(UICollectionView.spy_moveSection(_:toSection:))
    static let insertItems = #selector(UICollectionView.spy_insertItems(at:))
    static let deleteItems = #selector(UICollectionView.spy_deleteItems(at:))
    static let reloadItems = #selector(UICollectionView.spy_reloadItems(at:))
    static let moveItem = #selector(UICollectionView.spy_moveItem(at:to:))
}


public enum UICollectionViewSpyAssociations {

    public static let reloadData = MethodAssociation(
        forClass: UICollectionView.self,
        ofType: .instance,
        originalSelector: UICollectionViewOriginalSelectors.reloadData,
        alternateSelector: UICollectionViewSpySelectors.reloadData
    )

    public static let insertSections = MethodAssociation(
        forClass: UICollectionView.self,
        ofType: .instance,
        originalSelector: UICollectionViewOriginalSelectors.insertSections,
        alternateSelector: UICollectionViewSpySelectors.insertSections
    )

    public static let deleteSections = MethodAssociation(
        forClass: UICollectionView.self,
        ofType: .instance,
        originalSelector: UICollectionViewOriginalSelectors.deleteSections,
        alternateSelector: UICollectionViewSpySelectors.deleteSections
    )

    public static let reloadSections = MethodAssociation(
        forClass: UICollectionView.self,
        ofType: .instance,
        originalSelector: UICollectionViewOriginalSelectors.reloadSections,
        alternateSelector: UICollectionViewSpySelectors.reloadSections
    )

    public static let moveSection = MethodAssociation(
        forClass: UICollectionView.self,
        ofType: .instance,
        originalSelector: UICollectionViewOriginalSelectors.moveSection,
        alternateSelector: UICollectionViewSpySelectors.moveSection
    )

    public static let insertItems = MethodAssociation(
        forClass: UICollectionView.self,
        ofType: .instance,
        originalSelector: UICollectionViewOriginalSelectors.insertItems,
        alternateSelector: UICollectionViewSpySelectors.insertItems
    )

    public static let deleteItems = MethodAssociation(
        forClass: UICollectionView.self,
        ofType: .instance,
        originalSelector: UICollectionViewOriginalSelectors.deleteItems,
        alternateSelector: UICollectionViewSpySelectors.deleteItems
    )

    public static let reloadItems = MethodAssociation(
        forClass: UICollectionView.self,
        ofType: .instance,
        originalSelector: UICollectionViewOriginalSelectors.reloadItems,
        alternateSelector: UICollectionViewSpySelectors.reloadItems
    )

    public static let moveItem = MethodAssociation(
        forClass: UICollectionView.self,
        ofType: .instance,
        originalSelector: UICollectionViewOriginalSelectors.moveItem,
        alternateSelector: UICollectionViewSpySelectors.moveItem
    )

}
