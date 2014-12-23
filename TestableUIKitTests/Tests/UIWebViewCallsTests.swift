//
//  UIWebViewCallsTests.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/23/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit
import XCTest

class UIWebViewCallsTests: XCTestCase {

    let webView = UIWebView()
    let htmlString = "<html><body></body></html>"
    var data: NSData!
    let baseURL = NSURL(string: "http://www.example.com/")!

    override func setUp() {
        super.setUp()

        data = htmlString.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)!
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testLoadDataCall() {
        XCTAssertFalse(webView.loadDataCalled, "The web view should not indicate having had loadData called by default")
        XCTAssertNil(webView.loadDataData, "The data should be missing by default")
        XCTAssertNil(webView.loadDataMIMEType, "The MIME type should be missing by default")
        XCTAssertNil(webView.loadDataTextEncodingName, "The encoding name should be missing by default")
        XCTAssertNil(webView.loadDataBaseURL, "The base URL should be missing by default")
        webView.loadData(data, MIMEType: "application/html", textEncodingName: "utf-8", baseURL: baseURL)
        XCTAssertTrue(webView.loadDataCalled, "The web view should now indicate having had loadData called")
        XCTAssertEqual(webView.loadDataData!, data, "The data should be captured")
        XCTAssertEqual(webView.loadDataMIMEType!, "application/html", "The MIME type should be captured")
        XCTAssertEqual(webView.loadDataTextEncodingName!, "utf-8", "The encoding name should be captured")
        XCTAssertEqual(webView.loadDataBaseURL!, baseURL, "The base URL should be captured")
    }

    func testLoadHTMLStringCall() {
        XCTAssertFalse(webView.loadHTMLStringCalled, "The web view should not indicate having had loadHTMLString called by default")
        XCTAssertNil(webView.loadHTMLStringHTMLString, "The data should be missing by default")
        XCTAssertNil(webView.loadHTMLStringBaseURL, "The base URL should be missing by default")
        webView.loadHTMLString(htmlString, baseURL: baseURL)
        XCTAssertTrue(webView.loadHTMLStringCalled, "The web view should now indicate having had loadHTMLString called")
        XCTAssertEqual(webView.loadHTMLStringHTMLString!, htmlString, "The HTML string should be captured")
        XCTAssertEqual(webView.loadHTMLStringBaseURL!, baseURL, "The base URL should be captured")
    }

    func testLoadRequestCall() {
        XCTAssertFalse(webView.loadRequestCalled, "The web view should not indicate having had loadRequest called by default")
        XCTAssertNil(webView.loadRequestRequest, "The request should be missing by default")
        let request = NSURLRequest(URL: baseURL)
        webView.loadRequest(request)
        XCTAssertTrue(webView.loadRequestCalled, "The web view should now indicate having had loadRequest called")
        XCTAssertEqual(webView.loadRequestRequest!, request, "The URL request should be captured")
    }

    func testStopLoadingCall() {
        XCTAssertFalse(webView.stopLoadingCalled, "The web view should not indicate having had stopLoading called by default")
        webView.stopLoading()
        XCTAssertTrue(webView.stopLoadingCalled, "The web view should now indicate having had stopLoading called")
    }

    func testReloadCall() {
        XCTAssertFalse(webView.reloadCalled, "The web view should not indicate having had reload called by default")
        webView.reload()
        XCTAssertTrue(webView.reloadCalled, "The web view should now indicate having had reload called")
    }

    func testGoBackCall() {
        XCTAssertFalse(webView.goBackCalled, "The web view should not indicate having had goBack called by default")
        webView.goBack()
        XCTAssertTrue(webView.goBackCalled, "The web view should now indicate having had goBack called")
    }

    func testGoForwardCall() {
        XCTAssertFalse(webView.goForwardCalled, "The web view should not indicate having had goForward called by default")
        webView.goForward()
        XCTAssertTrue(webView.goForwardCalled, "The web view should now indicate having had goForward called")
    }

}
