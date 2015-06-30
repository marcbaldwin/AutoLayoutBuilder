import UIKit
import XCTest

class VerticalLayoutTests: ALBTestCase {

}

extension VerticalLayoutTests: LayoutTestSpecification {

    func testLayoutWithTwoAdjacentViews() {
        let constraints = .Vertical ~ view1 | view2
        XCTAssertEqual([NSLayoutConstraint(view2, .Top, .Equal, view1, .Bottom, 1, 0)], constraints)
    }

    func testLayoutWithThreeAdjacentViews() {
        let constraints = .Vertical ~ view1 | view2 | view3
        XCTAssertEqual([
            NSLayoutConstraint(view2, .Top, .Equal, view1, .Bottom, 1, 0),
            NSLayoutConstraint(view3, .Top, .Equal, view2, .Bottom, 1, 0)], constraints)
    }

    func testLayoutWithTwoViewsSeparatedByMargin() {
        let constraints = .Vertical ~ view1 | 10 | view2
        XCTAssertEqual([NSLayoutConstraint(view2, .Top, .Equal, view1, .Bottom, 1, 10)], constraints)
    }

    func testLayoutWithThreeViewsSeparatedByDifferingMargins() {
        let constraints = .Vertical ~ view1 | 10 | view2 | 20 | view3
        XCTAssertEqual([
            NSLayoutConstraint(view2, .Top, .Equal, view1, .Bottom, 1, 10),
            NSLayoutConstraint(view3, .Top, .Equal, view2, .Bottom, 1, 20)], constraints)
    }

    func testLayoutWithThreeViewsWithFirstAndSecondSeparatedByMargin() {
        let constraints = .Vertical ~ view1 | 10 | view2 | view3
        XCTAssertEqual([
            NSLayoutConstraint(view2, .Top, .Equal, view1, .Bottom, 1, 10),
            NSLayoutConstraint(view3, .Top, .Equal, view2, .Bottom, 1, 0)], constraints)
    }

    func testLayoutWithThreeViewsWithSecondAndThirdSeparatedByMargin() {
        let constraints = .Vertical ~ view1 | view2 | 10 | view3
        XCTAssertEqual([
            NSLayoutConstraint(view2, .Top, .Equal, view1, .Bottom, 1, 0),
            NSLayoutConstraint(view3, .Top, .Equal, view2, .Bottom, 1, 10)], constraints)
    }

    func testLayoutWithViewGroup() {
        let constraints = .Vertical ~ Group(view1, view2, view3)
        XCTAssertEqual([
            NSLayoutConstraint(view2, .Top, .Equal, view1, .Bottom, 1, 0),
            NSLayoutConstraint(view3, .Top, .Equal, view2, .Bottom, 1, 0)], constraints)
    }
}