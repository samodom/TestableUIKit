`UIView` Spies
==============

These spies forward all method calls to the original method implementation.

**Indirect spies:**

 * [`updateConstraints`](#spying-on-updateConstraints)
 * [`draw(_:)`](#spying-on-draw_)
 * [`encodeRestorableState(with:)`](#spying-on-encodeRestorableStatewith)
 * [`decodeRestorableState(with:)`](#spying-on-decodeRestorableStatewith)


**Direct spies:**

 * [`setNeedsLayout`](#spying-on-setNeedsLayout)
 * [`invalidateIntrinsicContentSize`](#spying-on-invalidateIntrinsicContentSize)
 * [`setNeedsUpdateConstraints`](#spying-on-setNeedsUpdateConstraints)
 * [`setNeedsDisplay`](#spying-on-setNeedsDisplay-and-setNeedsDisplay_) and [`setNeedsDisplay(_:)`](#spying-on-setNeedsDisplay-and-setNeedsDisplay_)


## Spying on `updateConstraints`

Use this spy to validate that a view has called its superclass's implementation of `updateConstraints`.  The spy controller is named `UIView.UpdateConstraintsSpyController`.

A single evidence property indicates whether the method was called:

* `var superclassUpdateConstraintsCalled: Bool`


## Spying on `draw(_:)`

Use this spy to validate that a view has called its superclass's implementation of `draw(_:)`.  The spy controller is named `UIView.DrawSpyController`.

Two properties provide evidence about a potential method call:

* `var drawCalled: Bool`
* `var drawRect: CGRect?`


## Spying on `encodeRestorableState(with:)`

Use this spy to validate that a view has been asked to encode its restorable state.  The spy controller is named `UIView.EncodeRestorableStateSpyController`.

Two properties provide evidence about a potential method call:

* `var encodeRestorableStateCalled: Bool`
* `var encodeRestorableStateCoder: NSCoder?`


## Spying on `decodeRestorableState(with:)`

Use this spy to validate that a view has been asked to decode its restorable state.  The spy controller is named `UIView.DecodeRestorableStateSpyController`.

Two properties provide evidence about a potential method call:

* `var decodeRestorableStateCalled: Bool`
* `var decodeRestorableStateCoder: NSCoder?`


## Spying on `setNeedsLayout`

Use this spy to validate that a view has been asked to flag itself as needing layout.  The spy controller is named `UIView.SetNeedsLayoutSpyController`.

Two properties provide evidence about a potential method call:

* `var setNeedsLayoutCalled: Bool`
* `var setNeedsLayoutCalledOnMainThread: Bool`


## Spying on `invalidateIntrinsicContentSize `

Use this spy to validate that a view has been asked to invalidate its intrinsic content size.  The spy controller is named `UIView.InvalidateIntrinsicContentSizeSpyController`.

A single evidence property indicates whether the method was called:

* `var invalidateIntrinsicContentSizeCalled: Bool`


## Spying on `setNeedsUpdateConstraints`

Use this spy to validate that a view has been asked tp flag itself as needing to update its constraints.  The spy controller is named `UIView.SetNeedsUpdateConstraintsSpyController`.

A single evidence property indicates whether the method was called:

* `var setNeedsUpdateConstraintsCalled: Bool`


## Spying on `setNeedsDisplay` and `setNeedsDisplay(_:)`

Use this spy to validate that a view has been asked to flag itself as needing to be redrawn.  The spy controller is named `UIView.SetNeedsDisplaySpyController`.

Two properties provide evidence about a potential method call:

* `var setNeedsDisplayCalled: Bool`

   **Note:** This property may need to be explicitly reset to `nil` before testing code that is expected to call the method.

   **Note:** This property indicates a captured call to either spied method.

* `var setNeedsDisplayRect: CGRect?`

  **Note:** This property, which only gets set for calls to `setNeedsDisplay(_:)`, may need to be explicitly reset to `nil` before testing code that is expected to call the method.
