//
//  UIWebViewLoadSpy.swift
//  TestableUIKit
//
//  Created by Sam Odom on 2/21/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//


import UIKit
import TestSwagger
import FoundationSwagger


public extension UIWebView {

    private static let loadCalledKeyString = UUIDKeyString()
    private static let loadCalledKey =
        ObjectAssociationKey(loadCalledKeyString)
    private static let loadCalledReference =
        SpyEvidenceReference(key: loadCalledKey)

    private static let loadDataKeyString = UUIDKeyString()
    private static let loadDataKey =
        ObjectAssociationKey(loadDataKeyString)
    private static let loadDataReference =
        SpyEvidenceReference(key: loadDataKey)

    private static let loadMimeTypeKeyString = UUIDKeyString()
    private static let loadMimeTypeKey =
        ObjectAssociationKey(loadMimeTypeKeyString)
    private static let loadMimeTypeReference =
        SpyEvidenceReference(key: loadMimeTypeKey)

    private static let loadTextEncodingNameKeyString = UUIDKeyString()
    private static let loadTextEncodingNameKey =
        ObjectAssociationKey(loadTextEncodingNameKeyString)
    private static let loadTextEncodingNameReference =
        SpyEvidenceReference(key: loadTextEncodingNameKey)

    private static let loadHtmlStringKeyString = UUIDKeyString()
    private static let loadHtmlStringKey =
        ObjectAssociationKey(loadHtmlStringKeyString)
    private static let loadHtmlStringReference =
        SpyEvidenceReference(key: loadHtmlStringKey)

    private static let loadRequestKeyString = UUIDKeyString()
    private static let loadRequestKey =
        ObjectAssociationKey(loadRequestKeyString)
    private static let loadRequestReference =
        SpyEvidenceReference(key: loadRequestKey)

    private static let loadBaseUrlKeyString = UUIDKeyString()
    private static let loadBaseUrlKey =
        ObjectAssociationKey(loadBaseUrlKeyString)
    private static let loadBaseUrlReference =
        SpyEvidenceReference(key: loadBaseUrlKey)

    private static let loadDataCoselectors = SpyCoselectors(
        methodType: .instance,
        original: #selector(UIWebView.load(_:mimeType:textEncodingName:baseURL:)),
        spy: #selector(UIWebView.spy_load(_:mimeType:textEncodingName:baseURL:))
    )

    private static let loadHtmlStringCoselectors = SpyCoselectors(
        methodType: .instance,
        original: #selector(UIWebView.loadHTMLString(_:baseURL:)),
        spy: #selector(UIWebView.spy_loadHtmlString(_:baseURL:))
    )

    private static let loadRequestCoselectors = SpyCoselectors(
        methodType: .instance,
        original: #selector(UIWebView.loadRequest(_:)),
        spy: #selector(UIWebView.spy_loadRequest(_:))
    )


    /// Spy controller for ensuring that a web view has had
    /// `load(_:mimeType:textEncodingName:baseURL:)`, `loadHTMLString(_:baseURL:)` or
    /// `loadRequest(_:)` called on it.
    public enum LoadSpyController: SpyController {
        public static let rootSpyableClass: AnyClass = UIWebView.self
        public static let vector = SpyVector.direct
        public static let coselectors: Set = [
            loadDataCoselectors,
            loadHtmlStringCoselectors,
            loadRequestCoselectors
        ]
        public static let evidence: Set = [
            loadCalledReference,
            loadDataReference,
            loadMimeTypeReference,
            loadTextEncodingNameReference,
            loadHtmlStringReference,
            loadRequestReference,
            loadBaseUrlReference
        ]
        public static let forwardsInvocations = false
    }


    /// Spy method that replaces the true implementation of `load(_:mimeType:textEncodingName:baseURL:)`
    dynamic public func spy_load(
        _ data: Data,
        mimeType: String,
        textEncodingName: String,
        baseURL: URL
        ) {

        loadCalled = true
        loadData = data
        loadMimeType = mimeType
        loadTextEncodingName = textEncodingName
        loadBaseUrl = baseURL
    }


    /// Spy method that replaces the true implementation of `loadHTMLString(_:baseURL:)`
    dynamic public func spy_loadHtmlString(
        _ htmlString: String,
        baseURL: URL
        ) {

        loadCalled = true
        loadHtmlString = htmlString
        loadBaseUrl = baseURL
    }


    /// Spy method that replaces the true implementation of `loadRequest(_:)`
    dynamic public func spy_loadRequest(_ request: URLRequest) {
        loadCalled = true
        loadRequest = request
    }


    /// Indicates whether the `load(_:mimeType:textEncodingName:baseURL:)`,
    /// `loadHTMLString(_:baseURL:)` or `loadRequest(_:)` method has been called on this object.
    public final var loadCalled: Bool {
        get {
            return loadEvidence(with: UIWebView.loadCalledReference) as? Bool ?? false
        }
        set {
            saveEvidence(newValue, with: UIWebView.loadCalledReference)
        }
    }


    /// Provides the data passed to `load(_:mimeType:textEncodingName:baseURL:)` if called.
    public final var loadData: Data? {
        get {
            return loadEvidence(with: UIWebView.loadDataReference) as? Data
        }
        set {
            let reference = UIWebView.loadDataReference
            guard let data = newValue else {
                return removeEvidence(with: reference)
            }

            saveEvidence(data, with: reference)
        }
    }


    /// Provides the MIME type passed to `load(_:mimeType:textEncodingName:baseURL:)` if called.
    public final var loadMimeType: String? {
        get {
            return loadEvidence(with: UIWebView.loadMimeTypeReference) as? String
        }
        set {
            let reference = UIWebView.loadMimeTypeReference
            guard let mimeType = newValue else {
                return removeEvidence(with: reference)
            }
            
            saveEvidence(mimeType, with: reference)
        }
    }


    /// Provides the name of the text encoding passed to
    /// `load(_:mimeType:textEncodingName:baseURL:)` if called.
    public final var loadTextEncodingName: String? {
        get {
            return loadEvidence(with: UIWebView.loadTextEncodingNameReference) as? String
        }
        set {
            let reference = UIWebView.loadTextEncodingNameReference
            guard let name = newValue else {
                return removeEvidence(with: reference)
            }

            saveEvidence(name, with: reference)
        }
    }


    /// Provides the HTML string passed to `loadHTMLString(_:baseURL:)` if called.
    public final var loadHtmlString: String? {
        get {
            return loadEvidence(with: UIWebView.loadHtmlStringReference) as? String
        }
        set {
            let reference = UIWebView.loadHtmlStringReference
            guard let string = newValue else {
                return removeEvidence(with: reference)
            }

            saveEvidence(string, with: reference)
        }
    }


    /// Provides the request passed to `loadRequest(_:)` if called.
    public final var loadRequest: URLRequest? {
        get {
            return loadEvidence(with: UIWebView.loadRequestReference) as? URLRequest
        }
        set {
            let reference = UIWebView.loadRequestReference
            guard let request = newValue else {
                return removeEvidence(with: reference)
            }

            saveEvidence(request, with: reference)
        }
    }


    /// Provides the base URL passed to `load(_:mimeType:textEncodingName:baseURL:)` or
    /// `loadHTMLString(_:baseURL:)` if called.
    public final var loadBaseUrl: URL? {
        get {
            return loadEvidence(with: UIWebView.loadBaseUrlReference) as? URL
        }
        set {
            let reference = UIWebView.loadBaseUrlReference
            guard let url = newValue else {
                return removeEvidence(with: reference)
            }

            saveEvidence(url, with: reference)
        }
    }

}
