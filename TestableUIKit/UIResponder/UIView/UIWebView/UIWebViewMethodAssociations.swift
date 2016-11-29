//
//  UIWebViewMethodAssociations.swift
//  TestableUIKit
//
//  Created by Sam Odom on 11/24/16.
//  Copyright © 2016 Swagger Soft. All rights reserved.
//

import FoundationSwagger


fileprivate enum UIWebViewOriginalSelectors {
    static let loadData = #selector(UIWebView.load(_:mimeType:textEncodingName:baseURL:))
    static let loadHtmlString = #selector(UIWebView.loadHTMLString(_:baseURL:))
    static let loadRequest = #selector(UIWebView.loadRequest(_:))
    static let stopLoading = #selector(UIWebView.stopLoading)
    static let reload = #selector(UIWebView.reload)
    static let goBack = #selector(UIWebView.goBack)
    static let goForward = #selector(UIWebView.goForward)
}

fileprivate enum UIWebViewSpySelectors {
    static let loadData = #selector(UIWebView.spy_load(_:mimeType:textEncodingName:baseURL:))
    static let loadHtmlString = #selector(UIWebView.spy_loadHTMLString(_:baseURL:))
    static let loadRequest = #selector(UIWebView.spy_loadRequest(_:))
    static let stopLoading = #selector(UIWebView.spy_stopLoading)
    static let reload = #selector(UIWebView.spy_reload)
    static let goBack = #selector(UIWebView.spy_goBack)
    static let goForward = #selector(UIWebView.spy_goForward)
}


public enum UIWebViewSpyAssociations {

    public static let loadData = MethodAssociation(
        forClass: UIWebView.self,
        ofType: .instance,
        originalSelector: UIWebViewOriginalSelectors.loadData,
        alternateSelector: UIWebViewSpySelectors.loadData
    )

    public static let loadHtmlString = MethodAssociation(
        forClass: UIWebView.self,
        ofType: .instance,
        originalSelector: UIWebViewOriginalSelectors.loadHtmlString,
        alternateSelector: UIWebViewSpySelectors.loadHtmlString
    )

    public static let loadRequest = MethodAssociation(
        forClass: UIWebView.self,
        ofType: .instance,
        originalSelector: UIWebViewOriginalSelectors.loadRequest,
        alternateSelector: UIWebViewSpySelectors.loadRequest
    )

    public static let stopLoading = MethodAssociation(
        forClass: UIWebView.self,
        ofType: .instance,
        originalSelector: UIWebViewOriginalSelectors.stopLoading,
        alternateSelector: UIWebViewSpySelectors.stopLoading
    )

    public static let reload = MethodAssociation(
        forClass: UIWebView.self,
        ofType: .instance,
        originalSelector: UIWebViewOriginalSelectors.reload,
        alternateSelector: UIWebViewSpySelectors.reload
    )

    public static let goBack = MethodAssociation(
        forClass: UIWebView.self,
        ofType: .instance,
        originalSelector: UIWebViewOriginalSelectors.goBack,
        alternateSelector: UIWebViewSpySelectors.goBack
    )

    public static let goForward = MethodAssociation(
        forClass: UIWebView.self,
        ofType: .instance,
        originalSelector: UIWebViewOriginalSelectors.goForward,
        alternateSelector: UIWebViewSpySelectors.goForward
    )

}
