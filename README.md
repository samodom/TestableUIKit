TestableUIKit
=============

This is a framework that uses the same class names as some classes from UIKit and extends them using the fully qualified name of the real class.  This allows for a *shim* layer between your application code and UIKit **only while testing**.

Much, much more will be coming shortly.  For now, here is what the framework contains:

- `UIResponder`
  - [Capturing instance calls](UIResponderCalls.md)
    - `UIView`
      - [Capturing superclass calls](UIViewSuperCalls.md)
      - [Capturing instance calls](UIViewCalls.md)
      - `UICollectionView`
        - [Capturing instance calls](UICollectionViewCalls.md)
      - `UINavigationBar`
        - [Capturing instance calls](UINavigationBarCalls.md)
      - `UITableView`
        - [Capturing instance calls](UITableViewCalls.md)
      - `UIWebView`
        - [Capturing instance calls](UIWebViewCalls.md)
      - `UIWindow`
        - [Capturing instance calls](UIWindowCalls.md)


- `UIViewController`
  - [Capturing superclass calls](UIViewControllerSuperCalls.md)
  - [Capturing instance calls](UIViewControllerCalls.md)
  - `UINavigationController`
    - [Capturing instance calls](UINavigationControllerCalls.md)
  - `UIPageViewController`
    - [Capturing instance calls](UIPageViewControllerCalls.md)
  - `UITabBarController`
    - [Capturing instance calls](UITabBarControllerCalls.md)
