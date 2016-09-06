//
//  UIWebViewCalls.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/20/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

public extension TestableUIKit.UIWebView {

    public override func loadData(data: NSData, MIMEType: String, textEncodingName: String, baseURL: NSURL) {
        loadDataCalled = true
        loadDataData = data
        loadDataMIMEType = MIMEType
        loadDataTextEncodingName = textEncodingName
        loadDataBaseURL = baseURL

        let selector = UIWebViewTestableSelectors.LoadData
        if UIWebView.shouldForwardMethodCallWithSelector(selector) {
            super.loadData(data, MIMEType: MIMEType, textEncodingName: textEncodingName, baseURL: baseURL)
        }
    }

    public override func loadHTMLString(string: String, baseURL: NSURL?) {
        loadHTMLStringCalled = true
        loadHTMLStringHTMLString = string
        loadHTMLStringBaseURL = baseURL

        let selector = UIWebViewTestableSelectors.LoadHTMLString
        if UIWebView.shouldForwardMethodCallWithSelector(selector) {
            super.loadHTMLString(string, baseURL: baseURL)
        }
    }

    public override func loadRequest(request: NSURLRequest) {
        loadRequestCalled = true
        loadRequestRequest = request

        let selector = UIWebViewTestableSelectors.LoadRequest
        if UIWebView.shouldForwardMethodCallWithSelector(selector) {
            super.loadRequest(request)
        }
    }

    public override func stopLoading() {
        stopLoadingCalled = true

        let selector = UIWebViewTestableSelectors.StopLoading
        if UIWebView.shouldForwardMethodCallWithSelector(selector) {
            super.stopLoading()
        }
    }

    public override func reload() {
        reloadCalled = true

        let selector = UIWebViewTestableSelectors.Reload
        if UIWebView.shouldForwardMethodCallWithSelector(selector) {
            super.reload()
        }
    }

    public override func goBack() {
        goBackCalled = true

        let selector = UIWebViewTestableSelectors.GoBack
        if UIWebView.shouldForwardMethodCallWithSelector(selector) {
            super.goBack()
        }
    }

    public override func goForward() {
        goForwardCalled = true

        let selector = UIWebViewTestableSelectors.GoForward
        if UIWebView.shouldForwardMethodCallWithSelector(selector) {
            super.goForward()
        }
    }

}
