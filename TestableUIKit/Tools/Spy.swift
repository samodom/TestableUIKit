//
//  Spy.swift
//  TestableUIKit
//
//  Created by Sam Odom on 11/21/16.
//  Copyright © 2016 Swagger Soft. All rights reserved.
//

import FoundationSwagger

public protocol Spy: ObjectAssociating {}

protocol SpyKey {}

extension ObjectAssociationKey: SpyKey {}

typealias ObjectAssociationFilename = String
extension ObjectAssociationFilename: SpyKey {}


func UUIDKeyString() -> [CChar] {
    return NSUUID().uuidString.cString(using: .utf8)!
}


extension Spy {

    func clearSpyAssociations(keys: [SpyKey]) {
        keys.forEach { spyKey in
            switch spyKey {
            case let key as ObjectAssociationKey:
                removeAssociation(for: key)

            case let filename as ObjectAssociationFilename:
                removeStoredAssociation(for: filename)

            default:
                print("Attempting to clear a spy association with an unknown key type")
            }
        }
    }

    func associateData(_ data: Data, with filename: ObjectAssociationFilename) {
        let url = storageUrl(for: filename)
        do {
            try data.write(to: url)
        }
        catch {
            print(error)
        }
    }

    func associatedData(for filename: ObjectAssociationFilename) -> Data? {
        let url = storageUrl(for: filename)
        return try? Data(contentsOf: url)
    }

    func removeStoredAssociation(for filename: ObjectAssociationFilename) {
        let url = storageUrl(for: filename)
        try? FileManager.default.removeItem(at: url)
    }

    private func storageUrl(for filename: ObjectAssociationFilename) -> URL {
        let baseUrl = DocumentsDirectoryURL.appendingPathComponent("associations")
        do {
            try FileManager.default.createDirectory(at: baseUrl, withIntermediateDirectories: true)
        }
        catch {
            fatalError(error.localizedDescription)
        }

        return baseUrl.appendingPathComponent(filename)
    }

}
