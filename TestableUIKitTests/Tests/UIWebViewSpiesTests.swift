//
//  UIWebViewSpiesTests.swift
//  TestableUIKit
//
//  Created by Sam Odom on 2/22/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//

import XCTest
import TestableUIKit
import FoundationSwagger


class TestingWebView: UIWebView {

    var loadTestMethodCalled = false

    dynamic override func load(
        _ data: Data,
        mimeType MIMEType: String,
        textEncodingName: String,
        baseURL: URL
        ) {

        loadTestMethodCalled = true
    }

    dynamic override func loadHTMLString(_ string: String, baseURL: URL?) {
        loadTestMethodCalled = true
    }

    dynamic override func loadRequest(_ request: URLRequest) {
        loadTestMethodCalled = true
    }

    var stopLoadingTestMethodCalled = false
    dynamic override func stopLoading() {
        stopLoadingTestMethodCalled = true
    }

    var reloadTestMethodCalled = false
    dynamic override func reload() {
        reloadTestMethodCalled = true
    }

    var goBackTestMethodCalled = false
    dynamic override func goBack() {
        goBackTestMethodCalled = true
    }

    var goForwardTestMethodCalled = false
    dynamic override func goForward() {
        goForwardTestMethodCalled = true
    }

}


class UIWebViewSpiesTests: XCTestCase {

    let webView = TestingWebView()
    let htmlString = "<html><body></body></html>"
    var data: Data!
    let baseUrl = URL(string: "http://www.example.com/")!

    override func setUp() {
        super.setUp()

        data = htmlString.data(using: String.Encoding.utf8, allowLossyConversion: false)
    }


    func testLoadControllerForwardingBehavior() {
        XCTAssertEqual(UIWebView.LoadSpyController.forwardingBehavior, .never,
                       "Spies on the various load methods should never forward their method invocations")
    }


    // MARK: - `load(_:mimeType:textEncodingName:baseURL:)`

    func testSpyingOnLoadData() {
        webView.loadTestMethodCalled = false
        XCTAssertFalse(webView.loadCalled,
                       "By default the web view should not indicate having been asked to load anything")
        XCTAssertNil(webView.loadData, "By default there should be no captured data")
        XCTAssertNil(webView.loadMimeType, "By default there should be no captured MIME type")
        XCTAssertNil(webView.loadTextEncodingName, "By default there should be no captured encoding name")
        XCTAssertNil(webView.loadBaseUrl, "By default there should be no captured base URL")

        let mimeType = "application/html"
        let textEncodingName = "utf-8"

        let spy = UIWebView.LoadSpyController.createSpy(on: webView)!

        spy.beginSpying()

        webView.load(data, mimeType: mimeType, textEncodingName: textEncodingName, baseURL: baseUrl)

        XCTAssertTrue(webView.loadCalled,
                      "The web view should indicate having been asked to load data")
        XCTAssertEqual(webView.loadData, data, "The data being loaded should be captured")
        XCTAssertEqual(webView.loadMimeType, mimeType,
                       "The MIME type being used should be captured")
        XCTAssertEqual(webView.loadTextEncodingName, textEncodingName,
                       "The text encoding name being used should be captured")
        XCTAssertEqual(webView.loadBaseUrl, baseUrl, "The base URL being used should be captured")
        XCTAssertFalse(webView.loadTestMethodCalled,
                      "The spy method should never forward the method call to the original implementation")

        spy.endSpying()

        XCTAssertFalse(webView.loadCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(webView.loadData, "The data should be cleared after spying is complete")
        XCTAssertNil(webView.loadMimeType,
                     "The MIME type should be cleared after spying is complete")
        XCTAssertNil(webView.loadTextEncodingName,
                     "The encoding name should be cleared after spying is complete")
        XCTAssertNil(webView.loadBaseUrl, "The base URL should be cleared after spying is complete")
    }


    // MARK: - `loadHTMLString(_:baseURL:)`

    func testSpyingOnLoadHtmlString() {
        webView.loadTestMethodCalled = false
        XCTAssertFalse(webView.loadCalled,
                       "By default the web view should not indicate having been asked to load anything")
        XCTAssertNil(webView.loadHtmlString, "By default there should be no captured HTML string")
        XCTAssertNil(webView.loadBaseUrl, "By default there should be no captured base URL")

        let spy = UIWebView.LoadSpyController.createSpy(on: webView)!

        spy.beginSpying()

        webView.loadHTMLString(htmlString, baseURL: baseUrl)

        XCTAssertTrue(webView.loadCalled,
                      "The web view should indicate having been asked to load data")
        XCTAssertEqual(webView.loadHtmlString, htmlString, "The HTML string should be captured")
        XCTAssertEqual(webView.loadBaseUrl, baseUrl, "The base URL should be captured")
        XCTAssertFalse(webView.loadTestMethodCalled,
                       "The spy method should never forward the method call to the original implementation")

        spy.endSpying()

        XCTAssertFalse(webView.loadCalled, "The flag should be cleared after spying is complete")
        XCTAssertNil(webView.loadHtmlString, "The HTML string should be cleared after spying is complete")
        XCTAssertNil(webView.loadBaseUrl, "The base URL should be cleared after spying is complete")
    }


    // MARK: - `loadRequest(_:)`

    func testSpyingOnLoadRequest() {
        webView.loadTestMethodCalled = false
        XCTAssertFalse(webView.loadCalled,
                       "By default the web view should not indicate having been asked to load anything")
        XCTAssertNil(webView.loadRequest, "By default there should be no captured request")

        let spy = UIWebView.LoadSpyController.createSpy(on: webView)!

        spy.beginSpying()

        let request = URLRequest(url: baseUrl)
        webView.loadRequest(request)

        XCTAssertTrue(webView.loadCalled,
                      "The web view should indicate having been asked to load data")
        XCTAssertEqual(webView.loadRequest, request, "The request should be captured")
        XCTAssertFalse(webView.loadTestMethodCalled,
                       "The spy method should never forward the method call to the original implementation")

        spy.endSpying()

        XCTAssertFalse(webView.loadCalled, "The flag should be cleared after spying is complete")
        XCTAssertNil(webView.loadRequest, "The request should be cleared after spying is complete")
    }


    // MARK: - `stopLoading`

    func testSpyingOnStopLoading() {
        webView.stopLoadingTestMethodCalled = false
        XCTAssertFalse(webView.stopLoadingCalled,
                       "By default the web view should not indicate having been asked to stop loading")

        let spy = UIWebView.StopLoadingSpyController.createSpy(on: webView)!

        spy.beginSpying()

        webView.stopLoading()

        XCTAssertTrue(webView.stopLoadingCalled,
                      "The web view should indicate having been asked to stop loading")
        XCTAssertFalse(webView.stopLoadingTestMethodCalled,
                       "The spy method should never forward the method call to the original implementation")

        spy.endSpying()

        XCTAssertFalse(webView.stopLoadingCalled, "The flag should be cleared after spying is complete")
    }


    // MARK: - `reload`

    func testSpyingOnReload() {
        webView.reloadTestMethodCalled = false
        XCTAssertFalse(webView.reloadCalled,
                       "By default the web view should not indicate having been asked to reload")

        let spy = UIWebView.ReloadSpyController.createSpy(on: webView)!

        spy.beginSpying()

        webView.reload()

        XCTAssertTrue(webView.reloadCalled,
                      "The web view should indicate having been asked to reload")
        XCTAssertFalse(webView.reloadTestMethodCalled,
                       "The spy method should never forward the method call to the original implementation")

        spy.endSpying()

        XCTAssertFalse(webView.reloadCalled, "The flag should be cleared after spying is complete")
    }


    // MARK: - `goForward`

    func testSpyingOnGoBack() {
        webView.goBackTestMethodCalled = false
        XCTAssertFalse(webView.goBackCalled,
                       "By default the web view should not indicate having been asked to go back")

        let spy = UIWebView.GoBackSpyController.createSpy(on: webView)!

        spy.beginSpying()

        webView.goBack()

        XCTAssertTrue(webView.goBackCalled,
                      "The web view should indicate having been asked to go back")
        XCTAssertFalse(webView.goBackTestMethodCalled,
                       "The spy method should never forward the method call to the original implementation")

        spy.endSpying()

        XCTAssertFalse(webView.goBackCalled, "The flag should be cleared after spying is complete")
    }


    // MARK: - `goForward`

    func testSpyingOnGoForwardLoading() {
        webView.goForwardTestMethodCalled = false
        XCTAssertFalse(webView.goForwardCalled,
                       "By default the web view should not indicate having been asked to go forward")

        let spy = UIWebView.GoForwardSpyController.createSpy(on: webView)!

        spy.beginSpying()

        webView.goForward()

        XCTAssertTrue(webView.goForwardCalled,
                      "The web view should indicate having been asked to go forward")
        XCTAssertFalse(webView.goForwardTestMethodCalled,
                       "The spy method should never forward the method call to the original implementation")

        spy.endSpying()

        XCTAssertFalse(webView.goForwardCalled, "The flag should be cleared after spying is complete")
    }

}
