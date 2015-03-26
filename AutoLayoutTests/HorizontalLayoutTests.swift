import Foundation
import UIKit
import XCTest

class HorizontalLayoutTests: XCTestCase {

    let view1 = UIView()
    let view2 = UIView()
    let view3 = UIView()
}

extension HorizontalLayoutTests: LayoutTestSpecification {

    func testLayoutWithTwoAdjacentViews() {
        let constraints = .Horizontal ~ view1 | view2
        XCTAssertEqual([NSLayoutConstraint(view2, .Left, .Equal, view1, .Right, 1, 0)], constraints)
    }

    func testLayoutWithThreeAdjacentViews() {
        let constraints = .Horizontal ~ view1 | view2 | view3
        XCTAssertEqual([
            NSLayoutConstraint(view2, .Left, .Equal, view1, .Right, 1, 0),
            NSLayoutConstraint(view3, .Left, .Equal, view2, .Right, 1, 0)], constraints)
    }

    func testLayoutWithTwoViewsSeparatedByMargin() {
        let constraints = .Horizontal ~ view1 | 10 | view2
        XCTAssertEqual([NSLayoutConstraint(view2, .Left, .Equal, view1, .Right, 1, 10)], constraints)
    }

    func testLayoutWithThreeViewsSeparatedByDifferingMargins() {
        let constraints = .Horizontal ~ view1 | 10 | view2 | 20 | view3
        XCTAssertEqual([
            NSLayoutConstraint(view2, .Left, .Equal, view1, .Right, 1, 10),
            NSLayoutConstraint(view3, .Left, .Equal, view2, .Right, 1, 20)], constraints)
    }

    func testLayoutWithThreeViewsWithFirstAndSecondSeparatedByMargin() {
        let constraints = .Horizontal ~ view1 | 10 | view2 | view3
        XCTAssertEqual([
            NSLayoutConstraint(view2, .Left, .Equal, view1, .Right, 1, 10),
            NSLayoutConstraint(view3, .Left, .Equal, view2, .Right, 1, 0)], constraints)
    }

    func testLayoutWithThreeViewsWithSecondAndThirdSeparatedByMargin() {
        let constraints = .Horizontal ~ view1 | view2 | 10 | view3
        XCTAssertEqual([
            NSLayoutConstraint(view2, .Left, .Equal, view1, .Right, 1, 0),
            NSLayoutConstraint(view3, .Left, .Equal, view2, .Right, 1, 10)], constraints)
    }

    func testLayoutWithViewGroup() {
        let constraints = .Horizontal ~ Group(view1, view2)
        XCTAssertEqual([
            NSLayoutConstraint(view2, .Left, .Equal, view1, .Right, 1, 0)], constraints)
    }
}