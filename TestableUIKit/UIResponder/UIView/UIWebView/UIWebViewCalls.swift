//
//  UIWebViewCalls.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/20/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

public extension UIWebView {

    public override func loadData(data: NSData!, MIMEType: String!, textEncodingName: String!, baseURL: NSURL!) {
        loadDataCalled = true
        loadDataData = data
        loadDataMIMEType = MIMEType
        loadDataTextEncodingName = textEncodingName
        loadDataBaseURL = baseURL

        if shouldForwardMethodCallWithSelector("loadData:MIMEType:textEncodingName:baseURL:") {
            super.loadData(data, MIMEType: MIMEType, textEncodingName: textEncodingName, baseURL: baseURL)
        }
    }

    public override func loadHTMLString(string: String!, baseURL: NSURL!) {
        loadHTMLStringCalled = true
        loadHTMLStringHTMLString = string
        loadHTMLStringBaseURL = baseURL

        if shouldForwardMethodCallWithSelector("loadHTMLString:baseURL:") {
            super.loadHTMLString(string, baseURL: baseURL)
        }
    }

    public override func loadRequest(request: NSURLRequest) {
        loadRequestCalled = true
        loadRequestRequest = request

        if shouldForwardMethodCallWithSelector("loadRequest:") {
            super.loadRequest(request)
        }
    }

    public override func stopLoading() {
        stopLoadingCalled = true

        if shouldForwardMethodCallWithSelector("stopLoading") {
            super.stopLoading()
        }
    }

    public override func reload() {
        reloadCalled = true

        if shouldForwardMethodCallWithSelector("reload") {
            super.reload()
        }
    }

    public override func goBack() {
        goBackCalled = true

        if shouldForwardMethodCallWithSelector("goBack") {
            super.goBack()
        }
    }

    public override func goForward() {
        goForwardCalled = true

        if shouldForwardMethodCallWithSelector("goForward") {
            super.goForward()
        }
    }

}

extension UIWebView: ShimMethodForwarding {

    /*!
        The UIWebView shim should not forward spied messages by default.
    */
    public var shouldForwardByDefault: Bool { return forwardingList.shouldForwardByDefault }

    /*!
        This method indicates whether or not the spy for the provided selector forwards the method call to the superclass implementation.
        :param: selector Selector of spy method to check for forwarding status.
        :returns: Boolean value indicating whether or not the spy currently forwards calls to the specified method.
    */
    public func shouldForwardMethodCallWithSelector(selector: Selector) -> Bool {
        return forwardingList.shouldForwardMethodCallWithSelector(selector)
    }

    /*!
        Calls to this method control whether or not the spy for the provided selector forwards the method call to the superclass implementation.
        :param: selector Selector of spy method of which to change the forwarding status.
        :param: Boolean value indicating whether or not the method calls should be forwarded.
    */
    public func setShouldForwardMethodCallWithSelector(selector: Selector, _ shouldForward: Bool) {
        forwardingList.setShouldForwardMethodCallWithSelector(selector, shouldForward)
    }

}
