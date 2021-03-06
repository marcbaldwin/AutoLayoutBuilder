import UIKit
import XCTest
@testable import AutoLayoutBuilder

class Tests: ALBTestCase {

    // MARK: Equal Heights Tests

    func testEqualHeightsWithTwoViews() {
        let constraints = equalHeights(view1, view2)
        XCTAssertEqual([NSLayoutConstraint(view1, .Height, .Equal, view2, .Height, 1, 0)], constraints)
    }

    func testEqualHeightsWithThreeViews() {
        let constraints = equalHeights(view1, view2, view3)
        XCTAssertEqual([
            NSLayoutConstraint(view1, .Height, .Equal, view2, .Height, 1, 0),
            NSLayoutConstraint(view1, .Height, .Equal, view3, .Height, 1, 0)
            ], constraints)
    }

    // MARK: Equal Widths Tests

    func testEqualWidthWithTwoViews() {
        let constraints = equalWidths(view1, view2)
        XCTAssertEqual([NSLayoutConstraint(view1, .Width, .Equal, view2, .Width, 1, 0)], constraints)
    }

    func testEqualWidthsWithThreeViews() {
        let constraints = equalWidths(view1, view2, view3)
        XCTAssertEqual([
            NSLayoutConstraint(view1, .Width, .Equal, view2, .Width, 1, 0),
            NSLayoutConstraint(view1, .Width, .Equal, view3, .Width, 1, 0)
            ], constraints)
    }
}