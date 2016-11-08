//
//  UIWebViewCalls.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/20/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

extension TestableUIKit.UIWebView {

    open override func load(_ data: Data, mimeType MIMEType: String, textEncodingName: String, baseURL: URL) {
        loadDataCalled = true
        loadDataData = data
        loadDataMIMEType = MIMEType
        loadDataTextEncodingName = textEncodingName
        loadDataBaseURL = baseURL

        if shouldForwardMethodCallWithSelector(#selector(UIWebView.load(_:mimeType:textEncodingName:baseURL:))) {
            super.load(data, mimeType: MIMEType, textEncodingName: textEncodingName, baseURL: baseURL)
        }
    }

    open override func loadHTMLString(_ string: String, baseURL: URL?) {
        loadHTMLStringCalled = true
        loadHTMLStringHTMLString = string
        loadHTMLStringBaseURL = baseURL

        if shouldForwardMethodCallWithSelector(#selector(UIWebView.loadHTMLString(_:baseURL:))) {
            super.loadHTMLString(string, baseURL: baseURL)
        }
    }

    open override func loadRequest(_ request: URLRequest) {
        loadRequestCalled = true
        loadRequestRequest = request

        if shouldForwardMethodCallWithSelector(#selector(UIWebView.loadRequest(_:))) {
            super.loadRequest(request)
        }
    }

    open override func stopLoading() {
        stopLoadingCalled = true

        if shouldForwardMethodCallWithSelector(#selector(UIWebView.stopLoading)) {
            super.stopLoading()
        }
    }

    open override func reload() {
        reloadCalled = true

        if shouldForwardMethodCallWithSelector(#selector(UIWebView.reload)) {
            super.reload()
        }
    }

    open override func goBack() {
        goBackCalled = true

        if shouldForwardMethodCallWithSelector(#selector(UIWebView.goBack)) {
            super.goBack()
        }
    }

    open override func goForward() {
        goForwardCalled = true

        if shouldForwardMethodCallWithSelector(#selector(UIWebView.goForward)) {
            super.goForward()
        }
    }

}

extension TestableUIKit.UIWebView: ShimMethodForwarding {

    /*!
        The UIWebView shim should not forward spied messages by default.
    */
    public var shouldForwardByDefault: Bool { return forwardingList.shouldForwardByDefault }

    /*!
        This method indicates whether or not the spy for the provided selector forwards the method call to the superclass implementation.
        :param: selector Selector of spy method to check for forwarding status.
        :returns: Boolean value indicating whether or not the spy currently forwards calls to the specified method.
    */
    public func shouldForwardMethodCallWithSelector(_ selector: Selector) -> Bool {
        return forwardingList.shouldForwardMethodCallWithSelector(selector)
    }

    /*!
        Calls to this method control whether or not the spy for the provided selector forwards the method call to the superclass implementation.
        :param: selector Selector of spy method of which to change the forwarding status.
        :param: Boolean value indicating whether or not the method calls should be forwarded.
    */
    public func setShouldForwardMethodCallWithSelector(_ selector: Selector, _ shouldForward: Bool) {
        forwardingList.setShouldForwardMethodCallWithSelector(selector, shouldForward)
    }

}
