# OptionalTraversal

Methods to iterate a Collection while exploiting Optional.

```swift
let test0 = [0, 1, 2, 3]
let first = test0.startingIndex
let second = first.flatMap { test0.elementIndex(after: $0) }
let third = second.flatMap { test0.elementIndex($0, offsetBy: +1) }
let fourth = test0.elementIndex(before: test0.endIndex)
```

`first` is not `nil` only if `test0` isn't empty.  `second`, `third`, and `fourth` are non-`nil` only if there is a subscriptable index at the desired offset.  Instead of less-than comparisons with `endIndex` before indexing, you can use the existing `Optional.none`-testing infrastructure Swift already provides.
