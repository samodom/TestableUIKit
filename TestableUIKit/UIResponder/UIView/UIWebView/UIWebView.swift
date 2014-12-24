//
//  UIWebView.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/20/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

public class UIWebView: UIKit.UIWebView {

    /*!
        Indicates whether or not the `loadData:MIMEType:textEncodingName:baseURL:` method has been called on this object.
    */
    public var loadDataCalled = false

    /*!
        Provides the data that was passed to the `loadData:MIMEType:textEncodingName:baseURL:` method, if called.
    */
    public var loadDataData: NSData?

    /*!
        Provides the MIME type that was passed to the `loadData:MIMEType:textEncodingName:baseURL:` method, if called.
    */
    public var loadDataMIMEType: String?

    /*!
        Provides the text encoding name that was passed to the `loadData:MIMEType:textEncodingName:baseURL:` method, if called.
    */
    public var loadDataTextEncodingName: String?

    /*!
        Provides the base URL that was passed to the `loadData:MIMEType:textEncodingName:baseURL:` method, if called.
    */
    public var loadDataBaseURL: NSURL?

    /*!
        Indicates whether or not the `loadHTMLString:baseURL:` method has been called on this object.
    */
    public var loadHTMLStringCalled = false

    /*!
        Provides the HTML string that was passed to the `loadHTMLString:baseURL:` method, if called.
    */
    public var loadHTMLStringHTMLString: String?

    /*!
        Provides the base URL that was passed to the `loadHTMLString:baseURL:` method, if called.
    */
    public var loadHTMLStringBaseURL: NSURL?

    /*!
        Indicates whether or not the `loadRequest:` method has been called on this object.
    */
    public var loadRequestCalled = false

    /*!
        Provides the URL request that was passed to the `loadRequest:` method, if called.
    */
    public var loadRequestRequest: NSURLRequest?

    /*!
        Indicates whether or not the `stopLoading` method has been called on this object.
    */
    public var stopLoadingCalled = false

    /*!
        Indicates whether or not the `reload` method has been called on this object.
    */
    public var reloadCalled = false

    /*!
        Indicates whether or not the `goBack` method has been called on this object.
    */
    public var goBackCalled = false

    /*!
        Indicates whether or not the `goForward` method has been called on this object.
    */
    public var goForwardCalled = false


    internal var forwardingList = ShimMethodForwardingList(shouldForwardByDefault: false)

}