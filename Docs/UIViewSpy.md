`UIView` Spy
============

> This spy forwards all methods by default.

**Available spy methods:**

 * [`updateConstraints`](#spying-on-updateConstraints)
 * [`draw(_:)`](#spying-on-draw_)
 * [`encodeRestorableState(with:)`](#spying-on-encodeRestorableStatewith)
 * [`decodeRestorableState(with:)`](#spying-on-decodeRestorableStatewith)
 * [`setNeedsLayout`](#spying-on-setNeedsLayout)
 * [`invalidateIntrinsicContentSize`](#spying-on-invalidateIntrinsicContentSize)
 * [`setNeedsUpdateConstraints`](#spying-on-setNeedsUpdateConstraints)
 * [`setNeedsDisplay`](#spying-on-setNeedsDisplay-and-setNeedsDisplay_) and [`setNeedsDisplay(_:)`](#spying-on-setNeedsDisplay-and-setNeedsDisplay_)


## Spying on `updateConstraints`

Use this spy to validate that a view has called its superclass's implementation of `updateConstraints`.

### Spy Methods

* `spyOnUpdateConstraints(in:)`
* `beginSpyingOnUpdateConstraints`
* `endSpyingOnUpdateConstraints`

### Spy Variables

* `var updateConstraintsCalled: Bool`


## Spying on `draw(_:)`

Use this spy to validate that a view has called its superclass's implementation of `draw(_:)`.

### Spy Methods

* `spyOnDraw(in:)`
* `beginSpyingOnDraw`
* `endSpyingOnDraw`

### Spy Variables

* `var drawCalled: Bool`
* `var drawRect: CGRect`


## Spying on `encodeRestorableState(with:)`

Use this spy to validate that a view has been asked to encode its restorable state.

### Spy Methods

* `spyOnEncodeRestorableState(in:)`
* `beginSpyingOnEncodeRestorableState`
* `endSpyingOnEncodeRestorableState`

### Spy Variables

* `var encodeRestorableStateCalled: Bool`
* `var encodeRestorableStateCoder: NSCoder?`


## Spying on `decodeRestorableState(with:)`

Use this spy to validate that a view has been asked to decode its restorable state.

### Spy Methods

* `spyOnDecodeRestorableState(in:)`
* `beginSpyingOnDecodeRestorableState`
* `endSpyingOnDecodeRestorableState`

### Spy Variables

* `var decodeRestorableStateCalled: Bool`
* `var decodeRestorableStateCoder: NSCoder?`


## Spying on setNeedsLayout

Use this spy to validate that a view has been asked to flag itself as needing layout.

### Spy Methods

* `spyOnSetNeedsLayout(in:)`
* `beginSpyingOnSetNeedsLayout`
* `endSpyingOnSetNeedsLayout`

### Spy Variables

* `var setNeedsLayoutCalled: Bool`
* `var setNeedsLayoutCalledOnMainThread: Bool`


## Spying on `invalidateIntrinsicContentSize `

Use this spy to validate that a view has been asked to invalidate its intrinsic content size.

### Spy Methods

* `spyOnInvalidateIntrinsicContentSize(in:)`
* `beginSpyingOnInvalidateIntrinsicContentSize`
* `endSpyingOnInvalidateIntrinsicContentSize`

### Spy Variables

* `var invalidateIntrinsicContentSizeCalled: Bool`


## Spying on `setNeedsUpdateConstraints`

Use this spy to validate that a view has been asked tp flag itself as needing to update its constraints.

### Spy Methods

* `spyOnSetNeedsUpdateConstraints(in:)`
* `beginSpyingOnSetNeedsUpdateConstraints`
* `endSpyingOnSetNeedsUpdateConstraints`

### Spy Variables

* `var setNeedsUpdateConstraints Called: Bool`


## Spying on `setNeedsDisplay` and `setNeedsDisplay(_:)` 
Use this spy to validate that a view has been asked to flag itself as needing to be redrawn.

### Spy Methods

* `spyOnSetNeedsDisplay(in:)`
* `beginSpyingOnSetNeedsDisplay`
* `endSpyingOnSetNeedsDisplay`

### Spy Variables

* `var setNeedsDisplayCalled: Bool`
* `var setNeedsDisplayRect: CGRect?` (this property may need to be explicitly reset to `nil` before invoking code that is expected to call the method)

> These properties may need to be explicitly reset  before invoking code that is expected to call the method
