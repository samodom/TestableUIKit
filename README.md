TestableUIKit
=============

This is a framework that uses the same class names as some classes from UIKit and extends them using the fully qualified name of the real class.  This allows for a *shim* layer between your application code and UIKit **only while testing**.

Much, much more will be coming shortly.  For now, here is what the framework contains:

### `UIViewController`
 - [Capturing superclass calls](UIViewControllerSuperCalls.md)
 - [Capturing instance calls](UIViewControllerCalls.md)

### `UIView`
 - [Capturing superclass calls](UIViewSuperCalls.md)
 - [Capturing instance calls](UIViewCalls.md)
