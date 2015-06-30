import Foundation

import UIKit
import XCTest

class LeadingToTrailingLayoutTests: ALBTestCase {

}

extension LeadingToTrailingLayoutTests: LayoutTestSpecification {

    func testLayoutWithTwoAdjacentViews() {
        let constraints = .LeadingToTrailing ~ view1 | view2
        XCTAssertEqual([NSLayoutConstraint(view2, .Leading, .Equal, view1, .Trailing, 1, 0)], constraints)
    }

    func testLayoutWithThreeAdjacentViews() {
        let constraints = .LeadingToTrailing ~ view1 | view2 | view3
        XCTAssertEqual([
            NSLayoutConstraint(view2, .Leading, .Equal, view1, .Trailing, 1, 0),
            NSLayoutConstraint(view3, .Leading, .Equal, view2, .Trailing, 1, 0)], constraints)
    }

    func testLayoutWithTwoViewsSeparatedByMargin() {
        let constraints = .LeadingToTrailing ~ view1 | 10 | view2
        XCTAssertEqual([NSLayoutConstraint(view2, .Leading, .Equal, view1, .Trailing, 1, 10)], constraints)
    }

    func testLayoutWithThreeViewsSeparatedByDifferingMargins() {
        let constraints = .LeadingToTrailing ~ view1 | 10 | view2 | 20 | view3
        XCTAssertEqual([
            NSLayoutConstraint(view2, .Leading, .Equal, view1, .Trailing, 1, 10),
            NSLayoutConstraint(view3, .Leading, .Equal, view2, .Trailing, 1, 20)], constraints)
    }

    func testLayoutWithThreeViewsWithFirstAndSecondSeparatedByMargin() {
        let constraints = .LeadingToTrailing ~ view1 | 10 | view2 | view3
        XCTAssertEqual([
            NSLayoutConstraint(view2, .Leading, .Equal, view1, .Trailing, 1, 10),
            NSLayoutConstraint(view3, .Leading, .Equal, view2, .Trailing, 1, 0)], constraints)
    }

    func testLayoutWithThreeViewsWithSecondAndThirdSeparatedByMargin() {
        let constraints = .LeadingToTrailing ~ view1 | view2 | 10 | view3
        XCTAssertEqual([
            NSLayoutConstraint(view2, .Leading, .Equal, view1, .Trailing, 1, 0),
            NSLayoutConstraint(view3, .Leading, .Equal, view2, .Trailing, 1, 10)], constraints)
    }

    func testLayoutWithViewGroup() {
        let constraints = .LeadingToTrailing ~ Group(view1, view2, view3)
        XCTAssertEqual([
            NSLayoutConstraint(view2, .Leading, .Equal, view1, .Trailing, 1, 0),
            NSLayoutConstraint(view3, .Leading, .Equal, view2, .Trailing, 1, 0)], constraints)
    }
}