//
//  UIWebViewSpy.swift
//  TestableUIKit
//
//  Created by Sam Odom on 11/23/16.
//  Copyright © 2016 Swagger Soft. All rights reserved.
//

import FoundationSwagger


extension UIWebView {
    override open var forwardsMethodCallsByDefault: Bool {
        return false
    }
}


public extension UIWebView {

    //  MARK: - Spying on `load(_:mimeType:textEncodingName:baseURL:)`

    /// Spies on calls to `load(_:mimeType:textEncodingName:baseURL:)` and executes
    /// the provided context while the spy method is active
    /// - parameter context: Logic to execute while the spy method is active.
    public final func spyOnLoadData(in context: NullaryVoidClosure) {
        UIWebViewSpyAssociations.loadData.withAlternateImplementation(context: context)
        clearSpyAssociations(keys: UIWebViewSpyCaptureKeys.loadData)
    }


    /// Begins spying on calls to `load(_:mimeType:textEncodingName:baseURL:)`
    /// - note: Calls to this method should be balanced by calls to `endSpyingOnLoadData`
    public final func beginSpyingOnLoadData() {
        UIWebViewSpyAssociations.loadData.useAlternateImplementation()
    }


    /// Ends spying on calls to `load(_:mimeType:textEncodingName:baseURL:)`
    public final func endSpyingOnLoadData() {
        UIWebViewSpyAssociations.loadData.useOriginalImplementation()
        clearSpyAssociations(keys: UIWebViewSpyCaptureKeys.loadData)
    }


    /// Spy method that replaces the true implementation of `load(_:mimeType:textEncodingName:baseURL:)`
    public func spy_load(_ data: Data, mimeType: String, textEncodingName: String, baseURL: URL) {
        loadDataCalled = true
        loadDataData = data
        loadDataMimeType = mimeType
        loadDataTextEncodingName = textEncodingName
        loadDataBaseUrl = baseURL

        guard forwardsMethodCalls(for: UIWebViewOriginalSelectors.loadData) else {
            return
        }

        spy_load(data, mimeType: mimeType, textEncodingName: textEncodingName, baseURL: baseURL)
    }


    //  MARK: - Spying on `loadHTMLString(_:baseURL:)`

    /// Spies on calls to `loadHTMLString(_:baseURL:)` and executes
    /// the provided context while the spy method is active
    /// - parameter context: Logic to execute while the spy method is active.
    public final func spyOnLoadHtmlString(in context: NullaryVoidClosure) {
        UIWebViewSpyAssociations.loadHtmlString.withAlternateImplementation(context: context)
        clearSpyAssociations(keys: UIWebViewSpyCaptureKeys.loadHtmlString)
    }


    /// Begins spying on calls to `loadHTMLString(_:baseURL:)`
    /// - note: Calls to this method should be balanced by calls to `endSpyingOnLoadHtmlString`
    public final func beginSpyingOnLoadHtmlString() {
        UIWebViewSpyAssociations.loadHtmlString.useAlternateImplementation()
    }


    /// Ends spying on calls to `loadHTMLString(_:baseURL:)`
    public final func endSpyingOnLoadHtmlString() {
        UIWebViewSpyAssociations.loadHtmlString.useOriginalImplementation()
        clearSpyAssociations(keys: UIWebViewSpyCaptureKeys.loadHtmlString)
    }
    

    /// Spy method that replaces the true implementation of `loadHTMLString(_:baseURL:)`
    public func spy_loadHTMLString(_ string: String, baseURL: URL?) {
        loadHtmlStringCalled = true
        loadHtmlStringString = string
        loadHtmlStringBaseUrl = baseURL

        guard forwardsMethodCalls(for: UIWebViewOriginalSelectors.loadHtmlString) else {
            return
        }

        spy_loadHTMLString(string, baseURL: baseURL)
    }


    //  MARK: - Spying on `loadRequest(_:)`

    /// Spies on calls to `loadRequest(_:)` and executes
    /// the provided context while the spy method is active
    /// - parameter context: Logic to execute while the spy method is active.
    public final func spyOnLoadRequest(in context: NullaryVoidClosure) {
        UIWebViewSpyAssociations.loadRequest.withAlternateImplementation(context: context)
        clearSpyAssociations(keys: UIWebViewSpyCaptureKeys.loadRequest)
    }


    /// Begins spying on calls to `loadRequest(_:)`
    /// - note: Calls to this method should be balanced by calls to `endSpyingOnLoadRequest`
    public final func beginSpyingOnLoadRequest() {
        UIWebViewSpyAssociations.loadRequest.useAlternateImplementation()
    }


    /// Ends spying on calls to `loadRequest(_:)`
    public final func endSpyingOnLoadRequest() {
        UIWebViewSpyAssociations.loadRequest.useOriginalImplementation()
        clearSpyAssociations(keys: UIWebViewSpyCaptureKeys.loadRequest)
    }


    /// Spy method that replaces the true implementation of `loadRequest(_:)`
    public func spy_loadRequest(_ request: URLRequest) {
        loadRequestCalled = true
        loadRequestRequest = request

        guard forwardsMethodCalls(for: UIWebViewOriginalSelectors.loadRequest) else {
            return
        }

        spy_loadRequest(request)
    }


    //  MARK: - Spying on `stopLoading`

    /// Spies on calls to `stopLoading` and executes
    /// the provided context while the spy method is active
    /// - parameter context: Logic to execute while the spy method is active.
    public final func spyOnStopLoading(in context: NullaryVoidClosure) {
        UIWebViewSpyAssociations.stopLoading.withAlternateImplementation(context: context)
        clearSpyAssociations(keys: UIWebViewSpyCaptureKeys.stopLoading)
    }


    /// Begins spying on calls to `stopLoading`
    /// - note: Calls to this method should be balanced by calls to `endSpyingOnStopLoading`
    public final func beginSpyingOnStopLoading() {
        UIWebViewSpyAssociations.stopLoading.useAlternateImplementation()
    }


    /// Ends spying on calls to `stopLoading`
    public final func endSpyingOnStopLoading() {
        UIWebViewSpyAssociations.stopLoading.useOriginalImplementation()
        clearSpyAssociations(keys: UIWebViewSpyCaptureKeys.stopLoading)
    }


    /// Spy method that replaces the true implementation of `stopLoading`
    public func spy_stopLoading() {
        stopLoadingCalled = true

        if forwardsMethodCalls(for: UIWebViewOriginalSelectors.stopLoading) {
            spy_stopLoading()
        }
    }


    //  MARK: - Spying on `reload`

    /// Spies on calls to `reload` and executes
    /// the provided context while the spy method is active
    /// - parameter context: Logic to execute while the spy method is active.
    public final func spyOnReload(in context: NullaryVoidClosure) {
        UIWebViewSpyAssociations.reload.withAlternateImplementation(context: context)
        clearSpyAssociations(keys: UIWebViewSpyCaptureKeys.reload)
    }


    /// Begins spying on calls to `reload`
    /// - note: Calls to this method should be balanced by calls to `endSpyingOnReload`
    public final func beginSpyingOnReload() {
        UIWebViewSpyAssociations.reload.useAlternateImplementation()
    }


    /// Ends spying on calls to `reload`
    public final func endSpyingOnReload() {
        UIWebViewSpyAssociations.reload.useOriginalImplementation()
        clearSpyAssociations(keys: UIWebViewSpyCaptureKeys.reload)
    }


    /// Spy method that replaces the true implementation of `reload`
    public func spy_reload() {
        reloadCalled = true

        if forwardsMethodCalls(for: UIWebViewOriginalSelectors.reload) {
            spy_reload()
        }
    }


    //  MARK: - Spying on `goBack`

    /// Spies on calls to `goBack` and executes
    /// the provided context while the spy method is active
    /// - parameter context: Logic to execute while the spy method is active.
    public final func spyOnGoBack(in context: NullaryVoidClosure) {
        UIWebViewSpyAssociations.goBack.withAlternateImplementation(context: context)
        clearSpyAssociations(keys: UIWebViewSpyCaptureKeys.goBack)
    }


    /// Begins spying on calls to `goBack`
    /// - note: Calls to this method should be balanced by calls to `endSpyingOnGoBack`
    public final func beginSpyingOnGoBack() {
        UIWebViewSpyAssociations.goBack.useAlternateImplementation()
    }


    /// Ends spying on calls to `goBack`
    public final func endSpyingOnGoBack() {
        UIWebViewSpyAssociations.goBack.useOriginalImplementation()
        clearSpyAssociations(keys: UIWebViewSpyCaptureKeys.goBack)
    }


    /// Spy method that replaces the true implementation of `goBack`
    public func spy_goBack() {
        goBackCalled = true

        if forwardsMethodCalls(for: UIWebViewOriginalSelectors.goBack) {
            spy_goBack()
        }
    }


    //  MARK: - Spying on `goForward`

    /// Spies on calls to `goForward` and executes
    /// the provided context while the spy method is active
    /// - parameter context: Logic to execute while the spy method is active.
    public final func spyOnGoForward(in context: NullaryVoidClosure) {
        UIWebViewSpyAssociations.goForward.withAlternateImplementation(context: context)
        clearSpyAssociations(keys: UIWebViewSpyCaptureKeys.goForward)
    }


    /// Begins spying on calls to `goForward`
    /// - note: Calls to this method should be balanced by calls to `endSpyingOnGoForward`
    public final func beginSpyingOnGoForward() {
        UIWebViewSpyAssociations.goForward.useAlternateImplementation()
    }


    /// Ends spying on calls to `goForward`
    public final func endSpyingOnGoForward() {
        UIWebViewSpyAssociations.goForward.useOriginalImplementation()
        clearSpyAssociations(keys: UIWebViewSpyCaptureKeys.goForward)
    }


    /// Spy method that replaces the true implementation of `goForward`
    public func spy_goForward() {
        goForwardCalled = true

        if forwardsMethodCalls(for: UIWebViewOriginalSelectors.goForward) {
            spy_goForward()
        }
    }

}
