`UIWebView` Spy
============

> This spy DOES NOT forward all methods by default.

**Available spy methods:**


 * [`load(_:mimeType:textEncodingName:baseURL:)`](#spying-on-load_MIMETypetextEncodingNamebaseURL)
 * [`loadHTMLString(_:baseURL:)`](#spying-on-loadHTMLString_baseURL)
 * [`loadRequest(_:)`](#spying-on-loadRequest_)
 * [`stopLoading`](#spying-on-stopLoading)
 * [`reload`](#spying-on-reload)
 * [`goBack`](#spying-on-goBack)
 * [`goForward`](#spying-on-goForward)


## Spying on `load(_:mimeType:textEncodingName:baseURL:)`

Use this spy to validate that a web view has been asked to load a page's contents as raw data.

### Spy Methods

* `spyOnLoad(in:)`
* `beginSpyingOnLoad`
* `endSpyingOnLoad`

### Spy Variables

* `var loadCalled: Bool`
* `var loadData: Data?`
* `var loadMimeType: String?`
* `var loadTextEncodingName: String?`
* `var loadBaseUrl: URL?`


## Spying on `loadHTMLString(_:baseURL:)`

Use this spy to validate that a web view has been asked to load a page's contents as an HTML string.

### Spy Methods

* `spyOnLoadHTMLString(in:)`
* `beginSpyingOnLoadHTMLString`
* `endSpyingOnLoadHTMLString`

### Spy Variables

* `var loadHTMLStringCalled: Bool`
* `var loadHTMLStringString: String?`
* `var loadHTMLStringBaseUrl: URL?`


## Spying on `loadRequest(_:)`

Use this spy to validate that a web view has been asked to load a page using a URL request.

### Spy Methods

* `spyOnLoadRequest(in:)`
* `beginSpyingOnLoadRequest`
* `endSpyingOnLoadRequest`

### Spy Variables

* `var loadRequestCalled: Bool`
* `var loadRequestRequest: URLRequest?`


## Spying on `stopLoading`

Use this spy to validate that a web view has been asked to stop loading a page.

### Spy Methods

* `spyOnStopLoading(in:)`
* `beginSpyingOnStopLoading`
* `endSpyingOnStopLoading`

### Spy Variables

* `var stopLoadingCalled: Bool`


## Spying on `reload`

Use this spy to validate that a web view has been asked to reload a page.

### Spy Methods

* `spyOnReload(in:)`
* `beginSpyingOnReload`
* `endSpyingOnReload`

### Spy Variables

* `var reloadCalled: Bool`


## Spying on `goBack`

Use this spy to validate that a web view has been asked to go back to the previous page.

### Spy Methods

* `spyOnGoBack(in:)`
* `beginSpyingOnGoBack`
* `endSpyingOnGoBack`

### Spy Variables

* `var goBackCalled: Bool`


## Spying on `goForward`

Use this spy to validate that a web view has been asked to go forward to a page to which it has just come back.

### Spy Methods

* `spyOnGoForward(in:)`
* `beginSpyingOnGoForward`
* `endSpyingOnGoForward`

### Spy Variables

* `var goForwardCalled: Bool`
