//
//  OptionalTraversal.swift
//  OptionalTraversal
//
//  Created by Daryle Walker on 6/26/19.
//


extension Collection {

    /// The position of the first element, if any.
    ///
    /// If the collection is empty, expresses `nil`.  So checking the status of
    /// this property always ensures an element.
    public var startingIndex: Index? {
        let result = startIndex
        return result != endIndex ? result : nil
    }

    /// Returns the position immediately after the given index, if said index
    /// references a valid subscript argument.
    ///
    /// If `nil` is returned, then `i` was already the last subscriptable index.
    ///
    /// - Parameter i: A valid index of the collection.
    /// - Returns: The index value immediately after `i` if it isn't `endIndex`.
    ///   Otherwise, `nil`.
    public func elementIndex(after i: Index) -> Index? {
        let end = endIndex
        guard i < end else { return nil }

        let next = index(after: i)
        return next != end ? next : nil
    }

    /// Returns an index that is the specified distance from the given index, if
    /// said index references a valid subscript argument.
    ///
    /// If `nil` is returned, then valid elements stop happening before that
    /// distance (including direction) from `i`.
    ///
    /// - Parameter i: A valid index of the collection.
    /// - Parameter distance: The distance to offset `i`.  It must not be
    ///   negative unless the collection conforms to `BidirectionalCollection`.
    /// - Returns: An index offset by `distance` from the index `i`, if it stays
    ///   within `indices`.  Otherwise, `nil`.
    /// - Complexity: O(1) if the collection conforms to `RandomAccessCollection`,
    ///   O(*k*) otherwise, where *k* is the absolute value of `distance`.
    public func elementIndex(_ i: Index, offsetBy distance: Int) -> Index? {
        if distance >= 0 {
            let end = endIndex
            let result = index(i, offsetBy: distance, limitedBy: end)
            return result != end ? result : nil
        } else {
            return index(i, offsetBy: distance, limitedBy: startIndex)
        }
    }

}

extension BidirectionalCollection {

    /// Returns the position immediately before the given index, if said index
    /// references a valid subscript argument.
    ///
    /// If `nil` is returned, then `i` was already the first subscriptable
    /// index.
    ///
    /// - Parameter i: A valid index of the collection.
    /// - Returns: The index value immediately before `i` if it wouldn't go past
    ///   `startIndex`.  Otherwise, `nil`.
    public func elementIndex(before i: Index) -> Index? {
        guard i > startIndex else { return nil }

        return index(before: i)
    }

}
