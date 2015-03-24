import Foundation

import UIKit
import XCTest

class StackLayoutTests: XCTestCase {

    let view1 = UIView()
    let view2 = UIView()
    let view3 = UIView()

    // MARK: Horizontal Layout Tests

    func testHorizontalLayoutWithTwoAdjacentViews() {
        let constraints = .Horizontal ~ view1 | view2
        XCTAssertEqual([NSLayoutConstraint(view2, .Left, .Equal, view1, .Right, 1, 0)], constraints)
    }

    func testHorizontalLayoutWithThreeAdjacentViews() {
        let constraints = .Horizontal ~ view1 | view2 | view3
        XCTAssertEqual([
            NSLayoutConstraint(view2, .Left, .Equal, view1, .Right, 1, 0),
            NSLayoutConstraint(view3, .Left, .Equal, view2, .Right, 1, 0)], constraints)
    }

    func testHorizontalLayoutWithTwoViewsWithMargin() {
        let constraints = .Horizontal ~ view1 | 10 | view2
        XCTAssertEqual([NSLayoutConstraint(view2, .Left, .Equal, view1, .Right, 1, 10)], constraints)
    }

    func testHorizontalLayoutWithThreeViewsWithMarginCase1() {
        let constraints = .Horizontal ~ view1 | 10 | view2 | view3
        XCTAssertEqual([
            NSLayoutConstraint(view2, .Left, .Equal, view1, .Right, 1, 10),
            NSLayoutConstraint(view3, .Left, .Equal, view2, .Right, 1, 0)], constraints)
    }

    func testHorizontalLayoutWithThreeViewsWithMarginCase2() {
        let constraints = .Horizontal ~ view1 | view2 | 10 | view3
        XCTAssertEqual([
            NSLayoutConstraint(view2, .Left, .Equal, view1, .Right, 1, 0),
            NSLayoutConstraint(view3, .Left, .Equal, view2, .Right, 1, 10)], constraints)
    }

    func testHorizontalLayoutWithThreeViewsWithMarginCase3() {
        let constraints = .Horizontal ~ view1 | 10 | view2 | 10 | view3
        XCTAssertEqual([
            NSLayoutConstraint(view2, .Left, .Equal, view1, .Right, 1, 10),
            NSLayoutConstraint(view3, .Left, .Equal, view2, .Right, 1, 10)], constraints)
    }

    // MARK: Vertical Layout Tests

    func testVerticalLayoutWithTwoAdjacentViews() {
        let constraints = .Vertical ~ view1 | view2
        XCTAssertEqual([NSLayoutConstraint(view2, .Top, .Equal, view1, .Bottom, 1, 0)], constraints)
    }

    func testVerticalLayoutWithThreeAdjacentViews() {
        let constraints = .Vertical ~ view1 | view2 | view3
        XCTAssertEqual([
            NSLayoutConstraint(view2, .Top, .Equal, view1, .Bottom, 1, 0),
            NSLayoutConstraint(view3, .Top, .Equal, view2, .Bottom, 1, 0)], constraints)
    }

    func testVerticalLayoutWithTwoViewsWithMargin() {
        let constraints = .Vertical ~ view1 | 10 | view2
        XCTAssertEqual([NSLayoutConstraint(view2, .Top, .Equal, view1, .Bottom, 1, 10)], constraints)
    }

    func testVerticalLayoutWithThreeViewsWithMarginCase1() {
        let constraints = .Vertical ~ view1 | 10 | view2 | view3
        XCTAssertEqual([
            NSLayoutConstraint(view2, .Top, .Equal, view1, .Bottom, 1, 10),
            NSLayoutConstraint(view3, .Top, .Equal, view2, .Bottom, 1, 0)], constraints)
    }

    func testVerticalLayoutWithThreeViewsWithMarginCase2() {
        let constraints = .Vertical ~ view1 | view2 | 10 | view3
        XCTAssertEqual([
            NSLayoutConstraint(view2, .Top, .Equal, view1, .Bottom, 1, 0),
            NSLayoutConstraint(view3, .Top, .Equal, view2, .Bottom, 1, 10)], constraints)
    }

    func testVerticalLayoutWithThreeViewsWithMarginCase3() {
        let constraints = .Vertical ~ view1 | 10 | view2 | 10 | view3
        XCTAssertEqual([
            NSLayoutConstraint(view2, .Top, .Equal, view1, .Bottom, 1, 10),
            NSLayoutConstraint(view3, .Top, .Equal, view2, .Bottom, 1, 10)], constraints)
    }

    func testVerticalLayoutWithArrayOfViews() {
        let constraints = .Vertical ~ Group(view1, view2, view3)
        XCTAssertEqual([
            NSLayoutConstraint(view2, .Top, .Equal, view1, .Bottom, 1, 0),
            NSLayoutConstraint(view3, .Top, .Equal, view2, .Bottom, 1, 0)], constraints)
    }
}