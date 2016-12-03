//
//  UIWebViewSpyCaptureKeys.swift
//  TestableUIKit
//
//  Created by Sam Odom on 11/26/16.
//  Copyright © 2016 Swagger Soft. All rights reserved.
//

import FoundationSwagger

enum UIWebViewSpyCaptureKeys {

    /// `load(_:mimeType:textEncodingName:baseURL:)`

    static let loadData: [SpyKey] = [
        loadDataCalled, loadDataData, loadDataMimeType,
        loadDataTextEncodingName, loadDataBaseUrl
    ]
    private static let loadDataCalledString = UUIDKeyString()
    private static let loadDataMimeTypeString = UUIDKeyString()
    private static let loadDataTextEncodingNameString = UUIDKeyString()
    private static let loadDataBaseUrlString = UUIDKeyString()
    private static let loadDataDataString = NSUUID().uuidString
    static let loadDataCalled = ObjectAssociationKey(loadDataCalledString)
    static let loadDataMimeType = ObjectAssociationKey(loadDataMimeTypeString)
    static let loadDataTextEncodingName = ObjectAssociationKey(loadDataTextEncodingNameString)
    static let loadDataBaseUrl = ObjectAssociationKey(loadDataBaseUrlString)
    static let loadDataData = loadDataDataString as ObjectAssociationFilename


    /// `loadHTMLString(_:baseURL:)`

    static let loadHtmlString = [loadHtmlStringCalled, loadHtmlStringString, loadHtmlStringBaseUrl]
    private static let loadHtmlStringCalledString = UUIDKeyString()
    private static let loadHtmlStringStringString = UUIDKeyString()
    private static let loadHtmlStringBaseUrlString = UUIDKeyString()
    static let loadHtmlStringCalled = ObjectAssociationKey(loadHtmlStringCalledString)
    static let loadHtmlStringString = ObjectAssociationKey(loadHtmlStringStringString)
    static let loadHtmlStringBaseUrl = ObjectAssociationKey(loadHtmlStringBaseUrlString)


    /// `loadRequest(_:)`

    static let loadRequest = [loadRequestCalled, loadRequestRequest]
    private static let loadRequestCalledString = UUIDKeyString()
    private static let loadRequestRequestString = UUIDKeyString()
    static let loadRequestCalled = ObjectAssociationKey(loadRequestCalledString)
    static let loadRequestRequest = ObjectAssociationKey(loadRequestRequestString)


    /// `stopLoading`

    static let stopLoading = [stopLoadingCalled]
    private static let stopLoadingCalledString = UUIDKeyString()
    static let stopLoadingCalled = ObjectAssociationKey(stopLoadingCalledString)


    /// `reload`

    static let reload = [reloadCalled]
    private static let reloadCalledString = UUIDKeyString()
    static let reloadCalled = ObjectAssociationKey(reloadCalledString)


    /// `goBack`

    static let goBack = [goBackCalled]
    private static let goBackCalledString = UUIDKeyString()
    static let goBackCalled = ObjectAssociationKey(goBackCalledString)


    /// `goForward`

    static let goForward = [goForwardCalled]
    private static let goForwardCalledString = UUIDKeyString()
    static let goForwardCalled = ObjectAssociationKey(goForwardCalledString)

}
