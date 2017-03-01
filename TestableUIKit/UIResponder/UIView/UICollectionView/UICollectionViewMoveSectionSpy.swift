//
//  UICollectionViewMoveSectionSpy.swift
//  TestableUIKit
//
//  Created by Sam Odom on 2/21/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//


import UIKit
import TestSwagger
import FoundationSwagger


public extension UICollectionView {

    private static let moveSectionCalledKeyString = UUIDKeyString()
    private static let moveSectionCalledKey =
        ObjectAssociationKey(moveSectionCalledKeyString)
    private static let moveSectionCalledReference =
        SpyEvidenceReference(key: moveSectionCalledKey)

    private static let moveSectionFromSectionKeyString = UUIDKeyString()
    private static let moveSectionFromSectionKey =
        ObjectAssociationKey(moveSectionFromSectionKeyString)
    private static let moveSectionFromSectionReference =
        SpyEvidenceReference(key: moveSectionFromSectionKey)

    private static let moveSectionToSectionKeyString = UUIDKeyString()
    private static let moveSectionToSectionKey =
        ObjectAssociationKey(moveSectionToSectionKeyString)
    private static let moveSectionToSectionReference =
        SpyEvidenceReference(key: moveSectionToSectionKey)

    private static let moveSectionCoselectors = SpyCoselectors(
        methodType: .instance,
        original: #selector(UICollectionView.moveSection(_:toSection:)),
        spy: #selector(UICollectionView.spy_moveSection(_:toSection:))
    )


    /// Spy controller for ensuring that a collection view has had `moveSection(_:toSection:)` called on it.
    public enum MoveSectionSpyController: SpyController {
        public static let rootSpyableClass: AnyClass = UICollectionView.self
        public static let vector = SpyVector.direct
        public static let coselectors: Set = [moveSectionCoselectors]
        public static let evidence: Set = [
            moveSectionCalledReference,
            moveSectionFromSectionReference,
            moveSectionToSectionReference
        ]
        public static let forwardsInvocations = true
    }


    /// Spy method that replaces the true implementation of `moveSection(_:toSection:)`
    dynamic public func spy_moveSection(_ fromSection: Int, toSection: Int) {
        moveSectionCalled = true
        moveSectionFromSection = fromSection
        moveSectionToSection = toSection

        spy_moveSection(fromSection, toSection: toSection)
    }


    /// Indicates whether the `moveSection(_:toSection:)` method has been called on this object.
    public final var moveSectionCalled: Bool {
        get {
            return loadEvidence(with: UICollectionView.moveSectionCalledReference) as? Bool ?? false
        }
        set {
            saveEvidence(true, with: UICollectionView.moveSectionCalledReference)
        }
    }


    /// Provides the source section passed to `moveSection(_:toSection:)` if called.
    public final var moveSectionFromSection: Int? {
        get {
            return loadEvidence(with: UICollectionView.moveSectionFromSectionReference) as? Int
        }
        set {
            let reference = UICollectionView.moveSectionFromSectionReference
            guard let section = newValue else {
                return removeEvidence(with: reference)
            }

            saveEvidence(section, with: reference)
        }
    }


    /// Provides the destination section passed to `moveSection(_:toSection:)` if called.
    public final var moveSectionToSection: Int? {
        get {
            return loadEvidence(with: UICollectionView.moveSectionToSectionReference) as? Int
        }
        set {
            let reference = UICollectionView.moveSectionToSectionReference
            guard let section = newValue else {
                return removeEvidence(with: reference)
            }
            
            saveEvidence(section, with: reference)
        }
    }
    
}
