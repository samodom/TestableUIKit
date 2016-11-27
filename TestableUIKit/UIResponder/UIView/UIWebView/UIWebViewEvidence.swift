//
//  UIWebViewEvidence.swift
//  TestableUIKit
//
//  Created by Sam Odom on 11/23/16.
//  Copyright © 2016 Swagger Soft. All rights reserved.
//

import FoundationSwagger


public extension UIWebView {

    /// Indicates whether the `load(_:mimeType:textEncodingName:baseURL:)` method has been called on this object.
    public final var loadDataCalled: Bool {
        get {
            return booleanAssociation(for: UIWebViewSpyCaptureKeys.loadDataCalled, defaultValue: false)
        }
        set {
            let key = UIWebViewSpyCaptureKeys.loadDataCalled
            guard newValue else {
                return removeAssociation(for: key)
            }

            associate(newValue, with: key)
        }
    }


    /// Provides the data that was passed to the `load(_:mimeType:textEncodingName:baseURL:)`
    /// method, if called.
    public final var loadDataData: Data? {
        get {
            return associatedData(for: UIWebViewSpyCaptureKeys.loadDataData)
        }
        set {
            let key = UIWebViewSpyCaptureKeys.loadDataData
            guard let data = newValue else {
                return removeStoredAssociation(for: key)
            }

            associateData(data, with: key)
        }
    }


    /// Provides the MIME type that was passed to the `load(_:mimeType:textEncodingName:baseURL:)`
    /// method, if called.
    public final var loadDataMimeType: String? {
        get {
            return association(for: UIWebViewSpyCaptureKeys.loadDataMimeType) as? String
        }
        set {
            let key = UIWebViewSpyCaptureKeys.loadDataMimeType
            guard let type = newValue else {
                return removeAssociation(for: key)
            }

            associate(type, with: key)
        }
    }


    /// Provides the text encoding name that was passed to the `load(_:mimeType:textEncodingName:baseURL:)`
    /// method, if called.
    public final var loadDataTextEncodingName: String? {
        get {
            return association(for: UIWebViewSpyCaptureKeys.loadDataTextEncodingName) as? String
        }
        set {
            let key = UIWebViewSpyCaptureKeys.loadDataTextEncodingName
            guard let name = newValue else {
                return removeAssociation(for: key)
            }

            associate(name, with: key)
        }
    }


    /// Provides the base URL that was passed to the `load(_:mimeType:textEncodingName:baseURL:)`
    /// method, if called.
    public final var loadDataBaseUrl: URL? {
        get {
            return association(for: UIWebViewSpyCaptureKeys.loadDataBaseUrl) as? URL
        }
        set {
            let key = UIWebViewSpyCaptureKeys.loadDataBaseUrl
            guard let url = newValue else {
                return removeAssociation(for: key)
            }

            associate(url, with: key)
        }
    }


    /// Indicates whether the `loadHTMLString(_:baseURL:)` method has been called on this object.
    public final var loadHtmlStringCalled: Bool {
        get {
            return booleanAssociation(
                for: UIWebViewSpyCaptureKeys.loadHtmlStringCalled,
                defaultValue: false
            )
        }
        set {
            let key = UIWebViewSpyCaptureKeys.loadHtmlStringCalled
            guard newValue else {
                return removeAssociation(for: key)
            }

            associate(newValue, with: key)
        }
    }


    /// Provides the HTML string that was passed to the `loadHTMLString(_:baseURL:)` method, if called.
    public final var loadHtmlStringString: String? {
        get {
            return stringAssociation(for: UIWebViewSpyCaptureKeys.loadHtmlStringString)
        }
        set {
            let key = UIWebViewSpyCaptureKeys.loadHtmlStringString
            guard let string = newValue else {
                return removeAssociation(for: key)
            }

            associate(string, with: key)
        }
    }


    /// Provides the base URL that was passed to the `loadHTMLString(_:baseURL:)` method, if called.
    public final var loadHtmlStringBaseUrl: URL? {
        get {
            return urlAssociation(for: UIWebViewSpyCaptureKeys.loadHtmlStringBaseUrl)
        }
        set {
            let key = UIWebViewSpyCaptureKeys.loadHtmlStringBaseUrl
            guard let url = newValue else {
                return removeAssociation(for: key)
            }

            associate(url, with: key)
        }
    }


    /// Indicates whether the `loadRequest(_:)` method has been called on this object.
    public final var loadRequestCalled: Bool {
        get {
            return booleanAssociation(
                for: UIWebViewSpyCaptureKeys.loadRequestCalled,
                defaultValue: false
            )
        }
        set {
            let key = UIWebViewSpyCaptureKeys.loadRequestCalled
            guard newValue else {
                return removeAssociation(for: key)
            }

            associate(newValue, with: key)
        }
    }


    /// Provides the HTML string that was passed to the `loadHTMLString(_:baseURL:)` method, if called.
    public final var loadRequestRequest: URLRequest? {
        get {
            return association(for: UIWebViewSpyCaptureKeys.loadRequestRequest) as? URLRequest
        }
        set {
            let key = UIWebViewSpyCaptureKeys.loadRequestRequest
            guard let request = newValue else {
                return removeAssociation(for: key)
            }

            associate(request, with: key)
        }
    }


    /// Indicates whether the `stopLoading` method has been called on this object.
    public final var stopLoadingCalled: Bool {
        get {
            return booleanAssociation(
                for: UIWebViewSpyCaptureKeys.stopLoadingCalled,
                defaultValue: false
            )
        }
        set {
            let key = UIWebViewSpyCaptureKeys.stopLoadingCalled
            guard newValue else {
                return removeAssociation(for: key)
            }

            associate(newValue, with: key)
        }
    }


    /// Indicates whether the `reload` method has been called on this object.
    public final var reloadCalled: Bool {
        get {
            return booleanAssociation(
                for: UIWebViewSpyCaptureKeys.reloadCalled,
                defaultValue: false
            )
        }
        set {
            let key = UIWebViewSpyCaptureKeys.reloadCalled
            guard newValue else {
                return removeAssociation(for: key)
            }

            associate(newValue, with: key)
        }
    }


    /// Indicates whether the `goBack` method has been called on this object.
    public final var goBackCalled: Bool {
        get {
            return booleanAssociation(
                for: UIWebViewSpyCaptureKeys.goBackCalled,
                defaultValue: false
            )
        }
        set {
            let key = UIWebViewSpyCaptureKeys.goBackCalled
            guard newValue else {
                return removeAssociation(for: key)
            }

            associate(newValue, with: key)
        }
    }


    /// Indicates whether the `goForward` method has been called on this object.
    public final var goForwardCalled: Bool {
        get {
            return booleanAssociation(
                for: UIWebViewSpyCaptureKeys.goForwardCalled,
                defaultValue: false
            )
        }
        set {
            let key = UIWebViewSpyCaptureKeys.goForwardCalled
            guard newValue else {
                return removeAssociation(for: key)
            }

            associate(newValue, with: key)
        }
    }

}
