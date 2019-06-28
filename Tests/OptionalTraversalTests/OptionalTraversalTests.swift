//
//  OptionalTraversalTests.swift
//  OptionalTraversal
//
//  Created by Daryle Walker on 6/26/19.
//

import XCTest
@testable import OptionalTraversal


final class OptionalTraversalTests: XCTestCase {

    // Test the starting-index property
    func testStartingIndex() {
        let test1 = EmptyCollection<Int>()
        XCTAssertNil(test1.startingIndex)

        let test2 = CollectionOfOne(1)
        XCTAssertNotNil(test2.startingIndex)
        XCTAssertEqual(test2.startingIndex, test2.startIndex)
        XCTAssertNotEqual(test2.startingIndex, test2.endIndex)

        let test3 = [Int](), test4 = [1, 2, 3, 4]
        XCTAssertNil(test3.startingIndex)
        XCTAssertNotNil(test4.startingIndex)
        XCTAssertEqual(test4.startingIndex, test4.startIndex)
        XCTAssertNotEqual(test4.startingIndex, test4.endIndex)
    }

    // Test nil-testing of other indices
    func testElementIndex() {
        let array = Array(0..<5), indices = Array(array.indices)
        XCTAssertEqual(array.startingIndex, indices.startingIndex)

        // elementIndex(after:)
        XCTAssertEqual(array.elementIndex(after: indices[0]), indices[1])
        XCTAssertEqual(array.elementIndex(after: indices[1]), indices[2])
        XCTAssertEqual(array.elementIndex(after: indices[2]), indices[3])
        XCTAssertEqual(array.elementIndex(after: indices[3]), indices[4])
        XCTAssertNil(array.elementIndex(after: indices[4]))
        XCTAssertNil(array.elementIndex(after: array.endIndex))

        // elementIndex(before:)
        XCTAssertEqual(array.elementIndex(before: array.endIndex), indices[4])
        XCTAssertEqual(array.elementIndex(before: indices[4]), indices[3])
        XCTAssertEqual(array.elementIndex(before: indices[3]), indices[2])
        XCTAssertEqual(array.elementIndex(before: indices[2]), indices[1])
        XCTAssertEqual(array.elementIndex(before: indices[1]), indices[0])
        XCTAssertNil(array.elementIndex(before: indices[0]))

        // elementIndex(_: offsetBy:), all combinations
        XCTAssertNil(array.elementIndex(indices[0], offsetBy: -1))
        XCTAssertEqual(array.elementIndex(indices[0], offsetBy: 0), indices[0])
        XCTAssertEqual(array.elementIndex(indices[0], offsetBy: 1), indices[1])
        XCTAssertEqual(array.elementIndex(indices[0], offsetBy: 2), indices[2])
        XCTAssertEqual(array.elementIndex(indices[0], offsetBy: 3), indices[3])
        XCTAssertEqual(array.elementIndex(indices[0], offsetBy: 4), indices[4])
        XCTAssertNil(array.elementIndex(indices[0], offsetBy: 5))

        XCTAssertNil(array.elementIndex(indices[1], offsetBy: -2))
        XCTAssertEqual(array.elementIndex(indices[1], offsetBy: -1), indices[0])
        XCTAssertEqual(array.elementIndex(indices[1], offsetBy: 0), indices[1])
        XCTAssertEqual(array.elementIndex(indices[1], offsetBy: 1), indices[2])
        XCTAssertEqual(array.elementIndex(indices[1], offsetBy: 2), indices[3])
        XCTAssertEqual(array.elementIndex(indices[1], offsetBy: 3), indices[4])
        XCTAssertNil(array.elementIndex(indices[1], offsetBy: 4))

        XCTAssertNil(array.elementIndex(indices[2], offsetBy: -3))
        XCTAssertEqual(array.elementIndex(indices[2], offsetBy: -2), indices[0])
        XCTAssertEqual(array.elementIndex(indices[2], offsetBy: -1), indices[1])
        XCTAssertEqual(array.elementIndex(indices[2], offsetBy: 0), indices[2])
        XCTAssertEqual(array.elementIndex(indices[2], offsetBy: 1), indices[3])
        XCTAssertEqual(array.elementIndex(indices[2], offsetBy: 2), indices[4])
        XCTAssertNil(array.elementIndex(indices[2], offsetBy: 3))

        XCTAssertNil(array.elementIndex(indices[3], offsetBy: -4))
        XCTAssertEqual(array.elementIndex(indices[3], offsetBy: -3), indices[0])
        XCTAssertEqual(array.elementIndex(indices[3], offsetBy: -2), indices[1])
        XCTAssertEqual(array.elementIndex(indices[3], offsetBy: -1), indices[2])
        XCTAssertEqual(array.elementIndex(indices[3], offsetBy: 0), indices[3])
        XCTAssertEqual(array.elementIndex(indices[3], offsetBy: 1), indices[4])
        XCTAssertNil(array.elementIndex(indices[3], offsetBy: 2))

        XCTAssertNil(array.elementIndex(indices[4], offsetBy: -5))
        XCTAssertEqual(array.elementIndex(indices[4], offsetBy: -4), indices[0])
        XCTAssertEqual(array.elementIndex(indices[4], offsetBy: -3), indices[1])
        XCTAssertEqual(array.elementIndex(indices[4], offsetBy: -2), indices[2])
        XCTAssertEqual(array.elementIndex(indices[4], offsetBy: -1), indices[3])
        XCTAssertEqual(array.elementIndex(indices[4], offsetBy: 0), indices[4])
        XCTAssertNil(array.elementIndex(indices[4], offsetBy: 1))

        XCTAssertNil(array.elementIndex(array.endIndex, offsetBy: -6))
        XCTAssertEqual(array.elementIndex(array.endIndex, offsetBy: -5), indices[0])
        XCTAssertEqual(array.elementIndex(array.endIndex, offsetBy: -4), indices[1])
        XCTAssertEqual(array.elementIndex(array.endIndex, offsetBy: -3), indices[2])
        XCTAssertEqual(array.elementIndex(array.endIndex, offsetBy: -2), indices[3])
        XCTAssertEqual(array.elementIndex(array.endIndex, offsetBy: -1), indices[4])
        XCTAssertNil(array.elementIndex(array.endIndex, offsetBy: 0))
    }

    static var allTests = [
        ("testStartingIndex", testStartingIndex),
        ("testElementIndex", testElementIndex),
    ]

}
