import UIKit
import XCTest

class CenterTests: ALBTestCase {

    // MARK: Relative to view

    func testDeclareCenterOfViewEqualToCenterOfAnotherView() {
        let constraints = view1[.Center] == view2[.Center]
        XCTAssertEqual([
            NSLayoutConstraint(view1, .CenterX, .Equal, view2, .CenterX, 1, 0),
            NSLayoutConstraint(view1, .CenterY, .Equal, view2, .CenterY, 1, 0)], constraints)
    }

    func testDeclareCenterOfMultipleViewsEqualToCenterOfAnotherView() {
        let constraints = Group(view1,view2)[.Center] == view3[.Center]
        XCTAssertEqual([
            NSLayoutConstraint(view1, .CenterX, .Equal, view3, .CenterX, 1, 0),
            NSLayoutConstraint(view1, .CenterY, .Equal, view3, .CenterY, 1, 0),
            NSLayoutConstraint(view2, .CenterX, .Equal, view3, .CenterX, 1, 0),
            NSLayoutConstraint(view2, .CenterY, .Equal, view3, .CenterY, 1, 0)], constraints)
    }

    // MARK: Relative to view with constant

    func testDeclareCenterOfViewEqualToCenterOfAnotherViewPlusConstant() {
        let constraints = view1[.Center] == view2[.Center] + 10
        XCTAssertEqual([
            NSLayoutConstraint(view1, .CenterX, .Equal, view2, .CenterX, 1, 10),
            NSLayoutConstraint(view1, .CenterY, .Equal, view2, .CenterY, 1, 10)], constraints)
    }

    func testDeclareCenterOfViewEqualToCenterOfAnotherViewMinusConstant() {
        let constraints = view1[.Center] == view2[.Center] - 10
        XCTAssertEqual([
            NSLayoutConstraint(view1, .CenterX, .Equal, view2, .CenterX, 1, -10),
            NSLayoutConstraint(view1, .CenterY, .Equal, view2, .CenterY, 1, -10)], constraints)
    }

    func testDeclareCenterOfViewEqualToCenterOfAnotherViewPlusConstantPair() {
        let constraints = view1[.Center] == view2[.Center] + (10, 5)
        XCTAssertEqual([
            NSLayoutConstraint(view1, .CenterX, .Equal, view2, .CenterX, 1, 10),
            NSLayoutConstraint(view1, .CenterY, .Equal, view2, .CenterY, 1, 5)], constraints)
    }

    func testDeclareCenterOfViewEqualToCenterOfAnotherViewMinusConstantPair() {
        let constraints = view1[.Center] == view2[.Center] - (10, 5)
        XCTAssertEqual([
            NSLayoutConstraint(view1, .CenterX, .Equal, view2, .CenterX, 1, -10),
            NSLayoutConstraint(view1, .CenterY, .Equal, view2, .CenterY, 1, -5)], constraints)
    }

    // MARK: Relative to view with multiplier

    func testDeclareCenterOfViewEqualToCenterOfAnotherViewMultipliedByConstant() {
        let constraints = view1[.Center] == view2[.Center] * 1.25
        XCTAssertEqual([
            NSLayoutConstraint(view1, .CenterX, .Equal, view2, .CenterX, 1.25, 0),
            NSLayoutConstraint(view1, .CenterY, .Equal, view2, .CenterY, 1.25, 0)], constraints)
    }

    func testDeclareCenterOfViewEqualToCenterOfAnotherViewDividedByConstant() {
        let constraints = view1[.Center] == view2[.Center] / 1.25
        XCTAssertEqual([
            NSLayoutConstraint(view1, .CenterX, .Equal, view2, .CenterX, 0.8, 0),
            NSLayoutConstraint(view1, .CenterY, .Equal, view2, .CenterY, 0.8, 0)], constraints)
    }

    func testDeclareCenterOfViewEqualToCenterOfAnotherViewMultipliedByConstantPair() {
        let constraints = view1[.Center] == view2[.Center] * (1, 2)
        XCTAssertEqual([
            NSLayoutConstraint(view1, .CenterX, .Equal, view2, .CenterX, 1, 0),
            NSLayoutConstraint(view1, .CenterY, .Equal, view2, .CenterY, 2, 0)], constraints)
    }

    func testDeclareCenterOfViewEqualToCenterOfAnotherViewDividedByConstantPair() {
        let constraints = view1[.Center] == view2[.Center] / (1, 2)
        XCTAssertEqual([
            NSLayoutConstraint(view1, .CenterX, .Equal, view2, .CenterX, 1, 0),
            NSLayoutConstraint(view1, .CenterY, .Equal, view2, .CenterY, 0.5, 0)], constraints)
    }

    // MARK: Relative to view with multiplier and constant

    func testDeclareCenterOfViewEqualToCenterOfAnotherViewMultipliedByConstantPlusConstant() {
        let constraints = view1[.Center] == view2[.Center] * CGFloat(1.25) + CGFloat(10)
        XCTAssertEqual([
            NSLayoutConstraint(view1, .CenterX, .Equal, view2, .CenterX, 1.25, 10),
            NSLayoutConstraint(view1, .CenterY, .Equal, view2, .CenterY, 1.25, 10)], constraints)
    }
}