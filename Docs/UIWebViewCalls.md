### Capturing calls to `UIWebView` methods

Each of the methods below have spy method equivalents that capture the calls to the method and any parameters, if available.  The properties listed below the method names list the new properties of `UIWebView` that you can use to validate method calls.

`loadData:MIMEType:textEncodingName:baseURL:`
 - `var loadDataCalled: Bool`
 - `var loadDataData: NSData?`
 - `var loadDataMIMEType: String?`
 - `var loadDataTextEncodingName: String?`
 - `var loadDataBaseURL: NSURL?`

`loadHTMLString:baseURL:`
 - `var loadHTMLStringCalled: Bool`
 - `var loadHTMLStringHTMLString: String?`
 - `var loadHTMLStringBaseURL: NSURL?`

`loadRequest:`
 - `var loadRequestCalled: Bool`
 - `var loadRequestRequest: NSURLRequest?`

`stopLoading`
 - `var stopLoadingCalled: Bool`

`reload`
 - `var reloadCalled: Bool`

`goBack`
 - `var goBackCalled: Bool`

`goForward`
 - `var goForwardCalled: Bool`


> After capturing the call to the method, these spies DO NOT forward the call to the superclass (real) implementation.  If you would like for any of these spies to forward the method call to the superclass implementation, simply insert the following call at the beginning of your test with an appropriate selector:
>
> `webView.setShouldForwardMethodCallWithSelector("loadRequest:", true)`
>
> This can be reversed in your test at any time by another call to the same method with the value `false`.
