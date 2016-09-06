TestableUIKit
=============

* ![](https://img.shields.io/badge/platform-_iOS_8,_9-lightgrey.svg?style=flat-square)
* ![](https://img.shields.io/badge/language-Swift_2.2-orange.svg?style=flat-square)
* ![](https://img.shields.io/badge/version-0.8.0-green.svg?style=flat-square)


This is a library that uses the same class names as some classes from UIKit and extends them using the fully qualified name of the real class.  This allows for a *shim* layer between your application code and UIKit **only while testing**.

Much, much more will be coming shortly.  For now, here is what the framework contains:

- `UIResponder`
 - [Capturing instance calls](Docs/UIResponderCalls.md)
    - `UIView`
      - [Capturing superclass calls](Docs/UIViewSuperCalls.md)
      - [Capturing instance calls](Docs/UIViewCalls.md)
      - `UICollectionView`
        - [Capturing instance calls](Docs/UICollectionViewCalls.md)
      - `UINavigationBar`
        - [Capturing instance calls](Docs/UINavigationBarCalls.md)
      - `UITableView`
        - [Capturing instance calls](Docs/UITableViewCalls.md)
      - `UIToolbar`
        - [Capturing instance calls](Docs/UIToolbarCalls.md)
      - `UIWebView`
        - [Capturing instance calls](Docs/UIWebViewCalls.md)
      - `UIWindow`
        - [Capturing instance calls](Docs/UIWindowCalls.md)


- `UIViewController`
  - [Capturing superclass calls](Docs/UIViewControllerSuperCalls.md)
  - [Capturing instance calls](Docs/UIViewControllerCalls.md)
  - `UINavigationController`
    - [Capturing instance calls](Docs/UINavigationControllerCalls.md)
  - `UIPageViewController`
    - [Capturing instance calls](Docs/UIPageViewControllerCalls.md)
  - `UITabBarController`
    - [Capturing instance calls](Docs/UITabBarControllerCalls.md)
