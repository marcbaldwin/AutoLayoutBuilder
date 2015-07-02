import UIKit
import XCTest

class CenterRelationTests: ALBTestCase {

    // MARK:

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

    // MARK: Constants

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
}