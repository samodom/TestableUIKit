//
//  UIWebViewSpyCaptureKeys.swift
//  TestableUIKit
//
//  Created by Sam Odom on 11/26/16.
//  Copyright © 2016 Swagger Soft. All rights reserved.
//

import FoundationSwagger

enum UIWebViewSpyCaptureKeys {

    private static let calledSuffix = "Called"
    private static let baseUrlSuffix = "BaseUrl"


    /// `load(_:mimeType:textEncodingName:baseURL:)`
    static let loadData: [SpyKey] = [
        loadDataCalled, loadDataData, loadDataMimeType,
        loadDataTextEncodingName, loadDataBaseUrl
    ]

    private static let loadDataBase = "loadData"
    static let loadDataCalled = ObjectAssociationKey(loadDataBase + calledSuffix)
    static let loadDataMimeType = ObjectAssociationKey(loadDataBase + "MimeType")
    static let loadDataTextEncodingName = ObjectAssociationKey(loadDataBase + "TextEncodingName")
    static let loadDataBaseUrl = ObjectAssociationKey(loadDataBase + baseUrlSuffix)
    private static let loadDataDataString = loadDataBase + "Data"
    static let loadDataData = ComplexObjectAssociationKey(
        simpleKey: ObjectAssociationKey(loadDataDataString),
        fileKey: loadDataDataString
    )


    /// `loadHTMLString(_:baseURL:)`
    static let loadHtmlString = [loadHtmlStringCalled, loadHtmlStringString, loadHtmlStringBaseUrl]
    private static let loadHtmlStringBase = "loadHtmlString"
    static let loadHtmlStringCalled = ObjectAssociationKey(loadHtmlStringBase + calledSuffix)
    static let loadHtmlStringString = ObjectAssociationKey(loadHtmlStringBase + "String")
    static let loadHtmlStringBaseUrl = ObjectAssociationKey(loadHtmlStringBase + baseUrlSuffix)


    /// `loadRequest(_:)`
    static let loadRequest = [loadRequestCalled, loadRequestRequest]
    private static let loadRequestBase = "loadRequest"
    static let loadRequestCalled = ObjectAssociationKey(loadRequestBase + calledSuffix)
    static let loadRequestRequest = ObjectAssociationKey(loadRequestBase + "Request")


    /// `stopLoading`
    static let stopLoading = [stopLoadingCalled]
    static let stopLoadingCalled = ObjectAssociationKey("stopLoadingCalled")


    /// `reload`
    static let reload = [reloadCalled]
    static let reloadCalled = ObjectAssociationKey("reloadCalled")


    /// `goBack`
    static let goBack = [goBackCalled]
    static let goBackCalled = ObjectAssociationKey("goBackCalled")


    /// `goForward`
    static let goForward = [goForwardCalled]
    static let goForwardCalled = ObjectAssociationKey("goForwardCalled")

}
