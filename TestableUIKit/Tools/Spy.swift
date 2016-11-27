//
//  Spy.swift
//  TestableUIKit
//
//  Created by Sam Odom on 11/21/16.
//  Copyright © 2016 Swagger Soft. All rights reserved.
//

import FoundationSwagger

public protocol Spy: ObjectAssociating {}

extension Spy {

    func clearSpyAssociations(keys: [SpyKey]) {
        keys.forEach { key in
            removeAssociation(for: key.simpleKey)
            if let complexKey = key as? ComplexObjectAssociationKey {
                removeStoredAssociation(for: complexKey)
            }
        }
    }

    func associateData(_ data: Data, with key: ComplexObjectAssociationKey) {
        let url = storageUrl(for: key)
        do {
            try data.write(to: url)
        }
        catch {
            print(error)
        }
    }

    func associatedData(for key: ComplexObjectAssociationKey) -> Data? {
        let url = storageUrl(for: key)
        return try? Data(contentsOf: url)
    }

    func removeStoredAssociation(for key: ComplexObjectAssociationKey) {
        let url = storageUrl(for: key)
        try? FileManager.default.removeItem(at: url)
    }

    private func storageUrl(for key: ComplexObjectAssociationKey) -> URL {
        let baseUrl = DocumentsDirectoryURL.appendingPathComponent("associations")
        do {
            try FileManager.default.createDirectory(at: baseUrl, withIntermediateDirectories: true)
        }
        catch {
            fatalError(error.localizedDescription)
        }

        return baseUrl.appendingPathComponent(key.fileKey)
    }

}
