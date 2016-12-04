//
//  UITableViewMethodAssociations.swift
//  TestableUIKit
//
//  Created by Sam Odom on 11/28/16.
//  Copyright © 2016 Swagger Soft. All rights reserved.
//

import FoundationSwagger


fileprivate enum UITableViewOriginalSelectors {
    static let reloadData = #selector(UITableView.reloadData)
    static let beginUpdates = #selector(UITableView.beginUpdates)
    static let endUpdates = #selector(UITableView.endUpdates)
    static let insertSections = #selector(UITableView.insertSections(_:with:))
    static let deleteSections = #selector(UITableView.deleteSections(_:with:))
    static let reloadSections = #selector(UITableView.reloadSections(_:with:))
    static let moveSection = #selector(UITableView.moveSection(_:toSection:))
    static let reloadSectionIndexTitles = #selector(UITableView.reloadSectionIndexTitles)
    static let insertRows = #selector(UITableView.insertRows(at:with:))
    static let deleteRows = #selector(UITableView.deleteRows(at:with:))
    static let reloadRows = #selector(UITableView.reloadRows(at:with:))
    static let moveRow = #selector(UITableView.moveRow(at:to:))
}

fileprivate enum UITableViewSpySelectors {
    static let reloadData = #selector(UITableView.spy_reloadData)
    static let beginUpdates = #selector(UITableView.spy_beginUpdates)
    static let endUpdates = #selector(UITableView.spy_endUpdates)
    static let insertSections = #selector(UITableView.spy_insertSections(_:with:))
    static let deleteSections = #selector(UITableView.spy_deleteSections(_:with:))
    static let reloadSections = #selector(UITableView.spy_reloadSections(_:with:))
    static let moveSection = #selector(UITableView.spy_moveSection(_:toSection:))
    static let reloadSectionIndexTitles = #selector(UITableView.spy_reloadSectionIndexTitles)
    static let insertRows = #selector(UITableView.spy_insertRows(at:with:))
    static let deleteRows = #selector(UITableView.spy_deleteRows(at:with:))
    static let reloadRows = #selector(UITableView.spy_reloadRows(at:with:))
    static let moveRow = #selector(UITableView.spy_moveRow(at:to:))
}


public enum UITableViewSpyAssociations {

    public static let reloadData = MethodAssociation(
        forClass: UITableView.self,
        ofType: .instance,
        originalSelector: UITableViewOriginalSelectors.reloadData,
        alternateSelector: UITableViewSpySelectors.reloadData
    )

    public static let beginUpdates = MethodAssociation(
        forClass: UITableView.self,
        ofType: .instance,
        originalSelector: UITableViewOriginalSelectors.beginUpdates,
        alternateSelector: UITableViewSpySelectors.beginUpdates
    )

    public static let endUpdates = MethodAssociation(
        forClass: UITableView.self,
        ofType: .instance,
        originalSelector: UITableViewOriginalSelectors.endUpdates,
        alternateSelector: UITableViewSpySelectors.endUpdates
    )

    public static let insertSections = MethodAssociation(
        forClass: UITableView.self,
        ofType: .instance,
        originalSelector: UITableViewOriginalSelectors.insertSections,
        alternateSelector: UITableViewSpySelectors.insertSections
    )

    public static let deleteSections = MethodAssociation(
        forClass: UITableView.self,
        ofType: .instance,
        originalSelector: UITableViewOriginalSelectors.deleteSections,
        alternateSelector: UITableViewSpySelectors.deleteSections
    )

    public static let reloadSections = MethodAssociation(
        forClass: UITableView.self,
        ofType: .instance,
        originalSelector: UITableViewOriginalSelectors.reloadSections,
        alternateSelector: UITableViewSpySelectors.reloadSections
    )

    public static let moveSection = MethodAssociation(
        forClass: UITableView.self,
        ofType: .instance,
        originalSelector: UITableViewOriginalSelectors.moveSection,
        alternateSelector: UITableViewSpySelectors.moveSection
    )

    public static let reloadSectionIndexTitles = MethodAssociation(
        forClass: UITableView.self,
        ofType: .instance,
        originalSelector: UITableViewOriginalSelectors.reloadSectionIndexTitles,
        alternateSelector: UITableViewSpySelectors.reloadSectionIndexTitles
    )

    public static let insertRows = MethodAssociation(
        forClass: UITableView.self,
        ofType: .instance,
        originalSelector: UITableViewOriginalSelectors.insertRows,
        alternateSelector: UITableViewSpySelectors.insertRows
    )

    public static let deleteRows = MethodAssociation(
        forClass: UITableView.self,
        ofType: .instance,
        originalSelector: UITableViewOriginalSelectors.deleteRows,
        alternateSelector: UITableViewSpySelectors.deleteRows
    )

    public static let reloadRows = MethodAssociation(
        forClass: UITableView.self,
        ofType: .instance,
        originalSelector: UITableViewOriginalSelectors.reloadRows,
        alternateSelector: UITableViewSpySelectors.reloadRows
    )

    public static let moveRow = MethodAssociation(
        forClass: UITableView.self,
        ofType: .instance,
        originalSelector: UITableViewOriginalSelectors.moveRow,
        alternateSelector: UITableViewSpySelectors.moveRow
    )

}
