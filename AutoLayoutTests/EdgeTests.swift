import UIKit
import XCTest

class EdgeTests: ALBTestCase {

    // MARK:

    func testDeclareEdgesOfViewEqualToEdgesOfAnotherView() {
        let constraints = view1[.Edges] == view2[.Edges]
        XCTAssertEqual([
            NSLayoutConstraint(view1, .Left, .Equal, view2, .Left, 1, 0),
            NSLayoutConstraint(view1, .Right, .Equal, view2, .Right, 1, 0),
            NSLayoutConstraint(view1, .Top, .Equal, view2, .Top, 1, 0),
            NSLayoutConstraint(view1, .Bottom, .Equal, view2, .Bottom, 1, 0)], constraints)
    }

    // MARK: Constants

    func testDeclareEdgesOfViewEqualToEdgesOfAnotherViewPlusConstant() {
        let constraints = view1[.Edges] == view2[.Edges] + 5
        XCTAssertEqual([
            NSLayoutConstraint(view1, .Left, .Equal, view2, .Left, 1, -5),
            NSLayoutConstraint(view1, .Right, .Equal, view2, .Right, 1, 5),
            NSLayoutConstraint(view1, .Top, .Equal, view2, .Top, 1, -5),
            NSLayoutConstraint(view1, .Bottom, .Equal, view2, .Bottom, 1, 5)], constraints)
    }

    func testDeclareEdgesOfViewEqualToEdgesOfAnotherViewMinusConstant() {
        let constraints = view1[.Edges] == view2[.Edges] - 5
        XCTAssertEqual([
            NSLayoutConstraint(view1, .Left, .Equal, view2, .Left, 1, 5),
            NSLayoutConstraint(view1, .Right, .Equal, view2, .Right, 1, -5),
            NSLayoutConstraint(view1, .Top, .Equal, view2, .Top, 1, 5),
            NSLayoutConstraint(view1, .Bottom, .Equal, view2, .Bottom, 1, -5)], constraints)
    }

    // MARK: Multiplier

    func testDeclareEdgesOfViewEqualToEdgesOfAnotherViewMultipliedByConstant() {
        let constraints = view1[.Edges] == view2[.Edges] * 1.2
        XCTAssertEqual([
            NSLayoutConstraint(view1, .Left, .Equal, view2, .Left, 1.2, 0),
            NSLayoutConstraint(view1, .Right, .Equal, view2, .Right, 1.2, 0),
            NSLayoutConstraint(view1, .Top, .Equal, view2, .Top, 1.2, 0),
            NSLayoutConstraint(view1, .Bottom, .Equal, view2, .Bottom, 1.2, 0)], constraints)
    }

    func testDeclareEdgesOfViewEqualToEdgesOfAnotherViewDividedByConstant() {
        let constraints = view1[.Edges] == view2[.Edges] / 1.25
        XCTAssertEqual([
            NSLayoutConstraint(view1, .Left, .Equal, view2, .Left, 0.8, 0),
            NSLayoutConstraint(view1, .Right, .Equal, view2, .Right, 0.8, 0),
            NSLayoutConstraint(view1, .Top, .Equal, view2, .Top, 0.8, 0),
            NSLayoutConstraint(view1, .Bottom, .Equal, view2, .Bottom, 0.8, 0)], constraints)
    }

    // MARK: Combination

    func testDeclareEdgesOfMultipleViewsEqualToEdgesOfAnotherView() {
        let constraints = Group(view1,view2)[.Edges] == view3[.Edges]
        XCTAssertEqual([
            NSLayoutConstraint(view1, .Left, .Equal, view3, .Left, 1, 0),
            NSLayoutConstraint(view1, .Right, .Equal, view3, .Right, 1, 0),
            NSLayoutConstraint(view1, .Top, .Equal, view3, .Top, 1, 0),
            NSLayoutConstraint(view1, .Bottom, .Equal, view3, .Bottom, 1, 0),
            NSLayoutConstraint(view2, .Left, .Equal, view3, .Left, 1, 0),
            NSLayoutConstraint(view2, .Right, .Equal, view3, .Right, 1, 0),
            NSLayoutConstraint(view2, .Top, .Equal, view3, .Top, 1, 0),
            NSLayoutConstraint(view2, .Bottom, .Equal, view3, .Bottom, 1, 0)], constraints)
    }



}