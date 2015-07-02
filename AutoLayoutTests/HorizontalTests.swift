import UIKit
import XCTest

class HorizontalTests: ALBTestCase {

    // MARK: Relative

    func testDeclareLeftOfViewEqualToRightOfAnotherView() {
        let constraints = view1[.Left] == view2[.Right]
        XCTAssertEqual([NSLayoutConstraint(view1, .Left, .Equal, view2, .Right, 1, 0)], constraints)
    }

    func testDeclareLeftOfViewGreaterThanOrEqualToRightOfAnotherView() {
        let constraints = view1[.Left] >= view2[.Right]
        XCTAssertEqual([NSLayoutConstraint(view1, .Left, .GreaterThanOrEqual, view2, .Right, 1, 0)], constraints)
    }

    func testDeclareLeftOfViewLessThanOrEqualToRightOfAnotherView() {
        let constraints = view1[.Left] <= view2[.Right]
        XCTAssertEqual([NSLayoutConstraint(view1, .Left, .LessThanOrEqual, view2, .Right, 1, 0)], constraints)
    }

    func testDeclareLeftOfMultipleViewsEqualToRightOfAnotherView() {
        let constraints = Group(view1,view2)[.Left] == view3[.Right]
        XCTAssertEqual([
            NSLayoutConstraint(view1, .Left, .Equal, view3, .Right, 1, 0),
            NSLayoutConstraint(view2, .Left, .Equal, view3, .Right, 1, 0)], constraints)
    }

    // MARK: Relative with constant

    func testDeclareLeftOfViewEqualToRightOfAnotherViewPlusConstant() {
        let constraints = view1[.Left] == view2[.Right] + 10
        XCTAssertEqual([NSLayoutConstraint(view1, .Left, .Equal, view2, .Right, 1, 10)], constraints)
    }

    func testDeclareLeftOfViewEqualToRightOfAnotherViewMinusConstant() {
        let constraints = view1[.Left] == view2[.Right] - 10
        XCTAssertEqual([NSLayoutConstraint(view1, .Left, .Equal, view2, .Right, 1, -10)], constraints)
    }

    // MARK: Relative with multiplier

    func testDeclareLeftOfViewEqualToRightOfAnotherViewMultipliedByConstant() {
        let constraints = view1[.Left] == view2[.Right] * 2
        XCTAssertEqual([NSLayoutConstraint(view1, .Left, .Equal, view2, .Right, 2, 0)], constraints)
    }

    func testDeclareLeftOfViewEqualToRightOfAnotherViewDividedByConstant() {
        let constraints = view1[.Left] == view2[.Right] / 2
        XCTAssertEqual([NSLayoutConstraint(view1, .Left, .Equal, view2, .Right, 0.5, 0)], constraints)
    }

    // MARK: Relative with multiplier and constant

    func testDeclareLeftOfViewEqualToRightOfAnotherViewMultipliedByConstantPlusConstant() {
        let constraints = view1[.Left] == view2[.Right] * 2 + 10
        XCTAssertEqual([NSLayoutConstraint(view1, .Left, .Equal, view2, .Right, 2, 10)], constraints)
    }

    func testDeclareLeftOfViewEqualToRightOfAnotherViewDividedByConstantMinusConstant() {
        let constraints = view1[.Left] == view2[.Right] / 2 - 10
        XCTAssertEqual([NSLayoutConstraint(view1, .Left, .Equal, view2, .Right, 0.5, -10)], constraints)
    }
}