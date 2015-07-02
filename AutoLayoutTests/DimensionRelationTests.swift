import UIKit
import XCTest

class DimensionRelationTests: ALBTestCase {

    // MARK: Relative to view

    func testDeclareWidthOfViewEqualToWidthOfAnotherView() {
        let constraints = view1[.Width] == view2[.Width]
        XCTAssertEqual([NSLayoutConstraint(view1, .Width, .Equal, view2, .Width, 1, 0)], constraints)
    }

    func testDeclareWidthOfViewEqualToHeightOfView() {
        let constraints = view1[.Width] == view1[.Height]
        XCTAssertEqual([NSLayoutConstraint(view1, .Width, .Equal, view1, .Height, 1, 0)], constraints)
    }

    func testDeclareHeightOfMultipleViewsEqualToHeightOfAnotherView() {
        let constraints = Group(view1,view2)[.Height] == view3[.Height]
        XCTAssertEqual([
            NSLayoutConstraint(view1, .Height, .Equal, view3, .Height, 1, 0),
            NSLayoutConstraint(view2, .Height, .Equal, view3, .Height, 1, 0)], constraints)
    }

    func testDeclareWidthOfViewGreaterThanOrEqualToWidthOfAnotherView() {
        let constraints = view1[.Width] >= view2[.Width]
        XCTAssertEqual([NSLayoutConstraint(view1, .Width, .GreaterThanOrEqual, view2, .Width, 1, 0)], constraints)
    }

    func testDeclareWidthOfViewLessThanOrEqualToWidthOfAnotherView() {
        let constraints = view1[.Width] <= view2[.Width]
        XCTAssertEqual([NSLayoutConstraint(view1, .Width, .LessThanOrEqual, view2, .Width, 1, 0)], constraints)
    }

    // MARK: Relative to view with constant

    func testDeclareWidthOfViewEqualToWidthOfAnotherViewPlusConstant() {
        let constraints = view1[.Width] == view2[.Width] + 10
        XCTAssertEqual([NSLayoutConstraint(view1, .Width, .Equal, view2, .Width, 1, 10)], constraints)
    }

    func testDeclareWidthOfViewEqualToWidthOfAnotherViewMinusConstant() {
        let constraints = view1[.Width] == view2[.Width] - 10
        XCTAssertEqual([NSLayoutConstraint(view1, .Width, .Equal, view2, .Width, 1, -10)], constraints)
    }

    // MARK: Relative to view with multiplier

    func testDeclareWidthOfViewEqualToWidthOfAnotherViewMultipliedByConstant() {
        let constraints = view1[.Width] == view2[.Width] * 2
        XCTAssertEqual([NSLayoutConstraint(view1, .Width, .Equal, view2, .Width, 2, 0)], constraints)
    }

    func testDeclareWidthOfViewEqualToWidthOfAnotherViewDividedByConstant() {
        let constraints = view1[.Width] == view2[.Width] / 2
        XCTAssertEqual([NSLayoutConstraint(view1, .Width, .Equal, view2, .Width, 0.5, 0)], constraints)
    }

    // MARK: Fixed to constant

    func testDeclareWidthOfViewEqualToConstant() {
        let constraints = view1[.Width] == 10
        XCTAssertEqual([
            NSLayoutConstraint(view1, .Width, .Equal, nil, .NotAnAttribute, 1, 10)], constraints)
    }

    func testDeclareWidthOfViewEqualToOrGreaterThanConstant() {
        let constraints = view1[.Width] >= 10
        XCTAssertEqual([NSLayoutConstraint(view1, .Width, .GreaterThanOrEqual, nil, .NotAnAttribute, 1, 10)], constraints)
    }

    func testDeclareWidthOfViewEqualToOrLessThanConstant() {
        let constraints = view1[.Width] <= 10
        XCTAssertEqual([NSLayoutConstraint(view1, .Width, .LessThanOrEqual, nil, .NotAnAttribute, 1, 10)], constraints)
    }
}