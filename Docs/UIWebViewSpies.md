`UIWebView` Spies
=================

These spies forward NO method calls to the original method implementation.


**Direct spies:**

 * [`load(_:mimeType:textEncodingName:baseURL:)`](#spying-on-load-methods), [`loadHTMLString(_:baseURL:)`](#spying-on-load-methods) and [`loadRequest(_:)`](#spying-on-load-methods)
 * [`stopLoading`](#spying-on-stopLoading)
 * [`reload`](#spying-on-reload)
 * [`goBack`](#spying-on-goBack)
 * [`goForward`](#spying-on-goForward)


## Spying on load methods

Use this spy to validate that a web view has been asked to load something: a page's contents as raw data, an HTML string or a URL request.  The spy controller is named `UIWebView.LoadSpyController`.

Many properties provide evidence about a potential method call:

* `var loadCalled: Bool`

   **Note:** This property indicates a captured call to any of the three spied methods.

* `var loadData: Data?`

  **Note:** This property is only captured with calls to `load(_:mimeType:textEncodingName:baseURL:)`.

* `var loadMimeType: String?`

  **Note:** This property is only captured with calls to `load(_:mimeType:textEncodingName:baseURL:)`.

* `var loadTextEncodingName: String?`

  **Note:** This property is only captured with calls to `load(_:mimeType:textEncodingName:baseURL:)`.

* `var loadBaseUrl: URL?`

  **Note:** This property is only captured with calls to `load(_:mimeType:textEncodingName:baseURL:)`and `loadHTMLString(_:baseURL:)`.

* `var loadHTMLString: String?`

  **Note:** This property is only captured with calls to `loadHTMLString(_:baseURL:)`.

* `var loadRequest: URLRequest?`
  **Note:** This property is only captured with calls to `loadRequest(_:)`


## Spying on `stopLoading`

Use this spy to validate that a web view has been asked to stop loading a page.  The spy controller is named `UIWebView.StopLoadingSpyController`.

A single evidence property indicates whether the method was called:

* `var stopLoadingCalled: Bool`


## Spying on `reload`

Use this spy to validate that a web view has been asked to reload a page.  The spy controller is named `UIWebView.ReloadSpyController`.

A single evidence property indicates whether the method was called:

* `var reloadCalled: Bool`


## Spying on `goBack`

Use this spy to validate that a web view has been asked to go back to the previous page.  The spy controller is named `UIWebView.GoBackSpyController`.

A single evidence property indicates whether the method was called:

* `var goBackCalled: Bool`


## Spying on `goForward`

Use this spy to validate that a web view has been asked to go forward to a page to which it has just come back.  The spy controller is named `UIWebView.GoForwardSpyController`.

A single evidence property indicates whether the method was called:

* `var goForwardCalled: Bool`
