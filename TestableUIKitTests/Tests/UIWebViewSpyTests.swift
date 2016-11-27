//
//  UIWebViewCallsTests.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/23/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import XCTest
import TestableUIKit

class UIWebViewSpyTests: SpyTestCase {

    let webView = UIWebView()
    let htmlString = "<html><body></body></html>"
    var data: Data!
    let baseUrl = URL(string: "http://www.example.com/")!

    override func setUp() {
        super.setUp()

        data = htmlString.data(using: String.Encoding.utf8, allowLossyConversion: false)!
        UIApplication.rootView.addSubview(webView)
    }

    override func tearDown() {
        webView.removeFromSuperview()

        super.tearDown()
    }

    func testDefaultMethodCallForwarding() {
        XCTAssertFalse(webView.forwardsMethodCallsByDefault, "By default this spy should not forward methods")
        UIWebViewSpyAssociations.allAssociations.forEach { association in
            let selector = association.originalSelector
            XCTAssertFalse(webView.forwardsMethodCalls(for: selector),
                          "By default `UIWebView` should not forward spied calls to `\(selector)`")
        }
    }


    //  MARK: - `load(_:mimeType:textEncodingName:baseURL:)`

    func testLoadDataCallWithContext() {
        association = UIWebViewSpyAssociations.loadData
        inspectImplementations()

        XCTAssertFalse(webView.loadDataCalled,
                       "The web view should not indicate having had `load(_:mimeType:textEncodingName:baseURL:)` called by default")
        XCTAssertNil(webView.loadDataData, "The data should be missing by default")
        XCTAssertNil(webView.loadDataMimeType, "The MIME type should be missing by default")
        XCTAssertNil(webView.loadDataTextEncodingName, "The encoding name should be missing by default")
        XCTAssertNil(webView.loadDataBaseUrl, "The base URL should be missing by default")

        let mimeType = "application/html"
        let textEncodingName = "utf-8"

        webView.spyOnLoadData {
            validateMethodsAreSwizzled()

            webView.load(data, mimeType: mimeType, textEncodingName: textEncodingName, baseURL: baseUrl)
            XCTAssertTrue(webView.loadDataCalled,
                          "The web view should now indicate having had `load(_:mimeType:textEncodingName:baseURL:)` called")
            XCTAssertEqual(webView.loadDataData, data, "The data should be captured")
            XCTAssertEqual(webView.loadDataMimeType, mimeType, "The MIME type should be captured")
            XCTAssertEqual(webView.loadDataTextEncodingName, textEncodingName,
                           "The encoding name should be captured")
            XCTAssertEqual(webView.loadDataBaseUrl, baseUrl, "The base URL should be captured")
        }

        validateMethodsAreNotSwizzled()

        XCTAssertFalse(webView.loadDataCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(webView.loadDataData, "The data should be cleared after spying is complete")
        XCTAssertNil(webView.loadDataMimeType, "The MIME type should be cleared after spying is complete")
        XCTAssertNil(webView.loadDataTextEncodingName, "The encoding name should be cleared after spying is complete")
        XCTAssertNil(webView.loadDataBaseUrl, "The base URL should be cleared after spying is complete")
    }

    func testLoadCallWithoutContext() {
        association = UIWebViewSpyAssociations.loadData
        inspectImplementations()

        XCTAssertFalse(webView.loadDataCalled,
                       "The web view should not indicate having had `load(_:mimeType:textEncodingName:baseURL:)` called by default")
        XCTAssertNil(webView.loadDataData, "The data should be missing by default")
        XCTAssertNil(webView.loadDataMimeType, "The MIME type should be missing by default")
        XCTAssertNil(webView.loadDataTextEncodingName, "The encoding name should be missing by default")
        XCTAssertNil(webView.loadDataBaseUrl, "The base URL should be missing by default")

        let mimeType = "application/html"
        let textEncodingName = "utf-8"

        webView.beginSpyingOnLoadData()
        validateMethodsAreSwizzled()

        webView.load(data, mimeType: mimeType, textEncodingName: textEncodingName, baseURL: baseUrl)
        XCTAssertTrue(webView.loadDataCalled, "The web view should now indicate having had `load(_:mimeType:textEncodingName:baseURL:)` called")
        XCTAssertEqual(webView.loadDataData, data, "The data should be captured")
        XCTAssertEqual(webView.loadDataMimeType, mimeType, "The MIME type should be captured")
        XCTAssertEqual(webView.loadDataTextEncodingName, textEncodingName,
                       "The encoding name should be captured")
        XCTAssertEqual(webView.loadDataBaseUrl, baseUrl, "The base URL should be captured")

        webView.endSpyingOnLoadData()
        validateMethodsAreNotSwizzled()

        XCTAssertFalse(webView.loadDataCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(webView.loadDataData, "The data should be cleared after spying is complete")
        XCTAssertNil(webView.loadDataMimeType, "The MIME type should be cleared after spying is complete")
        XCTAssertNil(webView.loadDataTextEncodingName, "The encoding name should be cleared after spying is complete")
        XCTAssertNil(webView.loadDataBaseUrl, "The base URL should be cleared after spying is complete")
    }
    

    //  MARK: - `loadHTMLString(_:baseURL:)`

    func testLoadHTMLStringCallWithContext() {
        association = UIWebViewSpyAssociations.loadHtmlString
        inspectImplementations()

        XCTAssertFalse(webView.loadHtmlStringCalled,
                       "The web view should not indicate having had `loadHTMLString(_:baseURL:)` called by default")
        XCTAssertNil(webView.loadHtmlStringString, "The HTML string should be missing by default")
        XCTAssertNil(webView.loadHtmlStringBaseUrl, "The base URL should be missing by default")

        webView.spyOnLoadHtmlString {
            validateMethodsAreSwizzled()

            webView.loadHTMLString(htmlString, baseURL: baseUrl)
            XCTAssertTrue(webView.loadHtmlStringCalled,
                          "The web view should now indicate having had `loadHTMLString(_:baseURL:)` called")
            XCTAssertEqual(webView.loadHtmlStringString, htmlString, "The HTML string should be captured")
            XCTAssertEqual(webView.loadHtmlStringBaseUrl, baseUrl, "The base URL should be captured")
        }

        validateMethodsAreNotSwizzled()

        XCTAssertFalse(webView.loadHtmlStringCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(webView.loadHtmlStringString, "The HTML string should be cleared after spying is complete")
        XCTAssertNil(webView.loadHtmlStringBaseUrl, "The base URL should be cleared after spying is complete")
    }

    func testLoadHTMLStringCallWithoutContext() {
        association = UIWebViewSpyAssociations.loadHtmlString
        inspectImplementations()

        XCTAssertFalse(webView.loadHtmlStringCalled,
                       "The web view should not indicate having had `loadHTMLString(_:baseURL:)` called by default")
        XCTAssertNil(webView.loadHtmlStringString, "The HTML string should be missing by default")
        XCTAssertNil(webView.loadHtmlStringBaseUrl, "The base URL should be missing by default")

        webView.beginSpyingOnLoadHtmlString()
        validateMethodsAreSwizzled()

        webView.loadHTMLString(htmlString, baseURL: baseUrl)
        XCTAssertTrue(webView.loadHtmlStringCalled,
                      "The web view should now indicate having had `loadHTMLString(_:baseURL:)` called")
        XCTAssertEqual(webView.loadHtmlStringString, htmlString, "The HTML string should be captured")
        XCTAssertEqual(webView.loadHtmlStringBaseUrl, baseUrl, "The base URL should be captured")

        webView.endSpyingOnLoadHtmlString()
        validateMethodsAreNotSwizzled()

        XCTAssertFalse(webView.loadHtmlStringCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(webView.loadHtmlStringString, "The HTML string should be cleared after spying is complete")
        XCTAssertNil(webView.loadHtmlStringBaseUrl, "The base URL should be cleared after spying is complete")
    }


    //  MARK: - `loadRequest(_:)`

    func testLoadRequestCallWithContext() {
        association = UIWebViewSpyAssociations.loadRequest
        inspectImplementations()

        XCTAssertFalse(webView.loadRequestCalled,
                       "The web view should not indicate having had `loadRequest(_:)` called by default")
        XCTAssertNil(webView.loadRequestRequest, "The URL request should be missing by default")

        webView.spyOnLoadRequest {
            validateMethodsAreSwizzled()

            let request = URLRequest(url: baseUrl)
            webView.loadRequest(request)
            XCTAssertTrue(webView.loadRequestCalled,
                          "The web view should now indicate having had `loadRequest(_:)` called")
            XCTAssertEqual(webView.loadRequestRequest, request, "The URL request should be captured")
        }

        validateMethodsAreNotSwizzled()

        XCTAssertFalse(webView.loadRequestCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(webView.loadRequestRequest, "The URL request should be cleared after spying is complete")
    }

    func testLoadRequestCallWithoutContext() {
        association = UIWebViewSpyAssociations.loadRequest
        inspectImplementations()

        XCTAssertFalse(webView.loadRequestCalled,
                       "The web view should not indicate having had `loadRequest(_:)` called by default")
        XCTAssertNil(webView.loadRequestRequest, "The URL request should be missing by default")

        webView.beginSpyingOnLoadRequest()
        validateMethodsAreSwizzled()

        let request = URLRequest(url: baseUrl)
        webView.loadRequest(request)
        XCTAssertTrue(webView.loadRequestCalled,
                      "The web view should now indicate having had `loadRequest(_:)` called")
        XCTAssertEqual(webView.loadRequestRequest, request, "The URL request should be captured")

        webView.endSpyingOnLoadRequest()
        validateMethodsAreNotSwizzled()

        XCTAssertFalse(webView.loadRequestCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(webView.loadRequestRequest, "The URL request should be cleared after spying is complete")
    }


    //  MARK: - `stopLoading`

    func testStopLoadingCallWithContext() {
        association = UIWebViewSpyAssociations.stopLoading
        inspectImplementations()

        XCTAssertFalse(webView.stopLoadingCalled,
                       "The web view should not indicate having had `stopLoading` called by default")

        webView.spyOnStopLoading {
            validateMethodsAreSwizzled()

            webView.stopLoading()
            XCTAssertTrue(webView.stopLoadingCalled,
                          "The web view should now indicate having had `stopLoading` called")
        }

        validateMethodsAreNotSwizzled()

        XCTAssertFalse(webView.stopLoadingCalled,
                       "The flag should be cleared after spying is complete")
    }

    func testStopLoadingCallWithoutContext() {
        association = UIWebViewSpyAssociations.stopLoading
        inspectImplementations()

        XCTAssertFalse(webView.stopLoadingCalled,
                       "The web view should not indicate having had `stopLoading` called by default")

        webView.beginSpyingOnStopLoading()
        validateMethodsAreSwizzled()

        webView.stopLoading()
        XCTAssertTrue(webView.stopLoadingCalled,
                      "The web view should now indicate having had `stopLoading` called")

        webView.endSpyingOnStopLoading()
        validateMethodsAreNotSwizzled()

        XCTAssertFalse(webView.stopLoadingCalled, "The flag should be cleared after spying is complete")
    }


    //  MARK: - `reload`

    func testReloadCallWithContext() {
        association = UIWebViewSpyAssociations.reload
        inspectImplementations()

        XCTAssertFalse(webView.reloadCalled,
                       "The web view should not indicate having had `reload` called by default")

        webView.spyOnReload {
            validateMethodsAreSwizzled()

            webView.reload()
            XCTAssertTrue(webView.reloadCalled,
                          "The web view should now indicate having had `reload` called")
        }

        validateMethodsAreNotSwizzled()

        XCTAssertFalse(webView.reloadCalled,
                       "The flag should be cleared after spying is complete")
    }

    func testReloadCallWithoutContext() {
        association = UIWebViewSpyAssociations.reload
        inspectImplementations()

        XCTAssertFalse(webView.reloadCalled,
                       "The web view should not indicate having had `reload` called by default")

        webView.beginSpyingOnReload()
        validateMethodsAreSwizzled()

        webView.reload()
        XCTAssertTrue(webView.reloadCalled,
                      "The web view should now indicate having had `reload` called")

        webView.endSpyingOnReload()
        validateMethodsAreNotSwizzled()

        XCTAssertFalse(webView.reloadCalled, "The flag should be cleared after spying is complete")
    }


    //  MARK: - `goBack`

    func testGoBackCallWithContext() {
        association = UIWebViewSpyAssociations.goBack
        inspectImplementations()

        XCTAssertFalse(webView.goBackCalled,
                       "The web view should not indicate having had `goBack` called by default")

        webView.spyOnGoBack {
            validateMethodsAreSwizzled()

            webView.goBack()
            XCTAssertTrue(webView.goBackCalled,
                          "The web view should now indicate having had `goBack` called")
        }

        validateMethodsAreNotSwizzled()

        XCTAssertFalse(webView.goBackCalled,
                       "The flag should be cleared after spying is complete")
    }

    func testGoBackCallWithoutContext() {
        association = UIWebViewSpyAssociations.goBack
        inspectImplementations()

        XCTAssertFalse(webView.goBackCalled,
                       "The web view should not indicate having had `goBack` called by default")

        webView.beginSpyingOnGoBack()
        validateMethodsAreSwizzled()

        webView.goBack()
        XCTAssertTrue(webView.goBackCalled,
                      "The web view should now indicate having had `goBack` called")

        webView.endSpyingOnGoBack()
        validateMethodsAreNotSwizzled()

        XCTAssertFalse(webView.goBackCalled, "The flag should be cleared after spying is complete")
    }


    //  MARK: - `goForward`

    func testGoForwardCallWithContext() {
        association = UIWebViewSpyAssociations.goForward
        inspectImplementations()

        XCTAssertFalse(webView.goForwardCalled,
                       "The web view should not indicate having had `goForward` called by default")

        webView.spyOnGoForward {
            validateMethodsAreSwizzled()

            webView.goForward()
            XCTAssertTrue(webView.goForwardCalled,
                          "The web view should now indicate having had `goForward` called")
        }

        validateMethodsAreNotSwizzled()

        XCTAssertFalse(webView.goForwardCalled,
                       "The flag should be cleared after spying is complete")
    }

    func testGoForwardCallWithoutContext() {
        association = UIWebViewSpyAssociations.goForward
        inspectImplementations()

        XCTAssertFalse(webView.goForwardCalled,
                       "The web view should not indicate having had `goForward` called by default")

        webView.beginSpyingOnGoForward()
        validateMethodsAreSwizzled()

        webView.goForward()
        XCTAssertTrue(webView.goForwardCalled,
                      "The web view should now indicate having had `goForward` called")

        webView.endSpyingOnGoForward()
        validateMethodsAreNotSwizzled()

        XCTAssertFalse(webView.goForwardCalled, "The flag should be cleared after spying is complete")
    }

}


fileprivate extension UIWebViewSpyAssociations {

    static let allAssociations = [
        UIWebViewSpyAssociations.loadData,
        UIWebViewSpyAssociations.loadHtmlString,
        UIWebViewSpyAssociations.loadRequest,
        UIWebViewSpyAssociations.stopLoading,
        UIWebViewSpyAssociations.reload,
        UIWebViewSpyAssociations.goBack,
        UIWebViewSpyAssociations.goForward
    ]

}
