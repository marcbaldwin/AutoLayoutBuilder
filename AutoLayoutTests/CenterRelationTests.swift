import UIKit
import XCTest

class CenterRelationTests: ALBTestCase {

    // MARK: == Tests

    func testEqualToView() {
        let constraints = view1[.Center] == view2[.Center]
        XCTAssertEqual([
            NSLayoutConstraint(view1, .CenterX, .Equal, view2, .CenterX, 1, 0),
            NSLayoutConstraint(view1, .CenterY, .Equal, view2, .CenterY, 1, 0)], constraints)
    }

    func testEqualToMultipleViews() {
        let constraints = Group(view1,view2)[.Center] == view3[.Center]
        XCTAssertEqual([
            NSLayoutConstraint(view1, .CenterX, .Equal, view3, .CenterX, 1, 0),
            NSLayoutConstraint(view1, .CenterY, .Equal, view3, .CenterY, 1, 0),
            NSLayoutConstraint(view2, .CenterX, .Equal, view3, .CenterX, 1, 0),
            NSLayoutConstraint(view2, .CenterY, .Equal, view3, .CenterY, 1, 0)], constraints)
    }

    // MARK: UIView Layout Tests

    func testLayout() {
        let constraintBuilder = view1[.Center]
        XCTAssertEqual(CenterAttribute.Center, constraintBuilder.attribute)
        XCTAssertEqual([view1], constraintBuilder.views)
    }

    // MARK: Array Layout Tests

    func testLayoutWithMultipleViewsWidth() {
        let constraintBuilder = Group([view1, view2])[.Center]
        XCTAssertEqual(CenterAttribute.Center, constraintBuilder.attribute)
        XCTAssertEqual([view1, view2], constraintBuilder.views)
    }

    // MARK: Multiplier Tests

    func testMultiplierMultiplication() {
        let constraintBuilder = view1[.Center] * 0.5
        XCTAssertEqual(CGFloat(0.5), constraintBuilder.multiplier.0)
        XCTAssertEqual(CGFloat(0.5), constraintBuilder.multiplier.1)
    }

    func testSuccessiveMultiplierMultiplication() {
        let constraintBuilder = view1[.Center] * 0.5 * 0.25
        XCTAssertEqual(CGFloat(0.125), constraintBuilder.multiplier.0)
        XCTAssertEqual(CGFloat(0.125), constraintBuilder.multiplier.1)
    }

    func testMultiplierDivision() {
        let constraintBuilder = view1[.Center] / 2
        XCTAssertEqual(CGFloat(0.5), constraintBuilder.multiplier.0)
        XCTAssertEqual(CGFloat(0.5), constraintBuilder.multiplier.1)
    }

    func testSuccessiveMultiplierDivision() {
        let constraintBuilder = view1[.Center] / 2 / 2.5
        XCTAssertEqual(CGFloat(0.2), constraintBuilder.multiplier.0)
        XCTAssertEqual(CGFloat(0.2), constraintBuilder.multiplier.1)
    }

    // MARK: Constant Tests

    func testConstantAddition() {
        let constraintBuilder = view1[.Center] + 10
        XCTAssertEqual(CGFloat(10), constraintBuilder.constant.0)
        XCTAssertEqual(CGFloat(10), constraintBuilder.constant.1)
    }

    func testSuccessiveConstantAddition() {
        let constraintBuilder = view1[.Center] + 10 + 5
        XCTAssertEqual(CGFloat(15), constraintBuilder.constant.0)
        XCTAssertEqual(CGFloat(15), constraintBuilder.constant.1)
    }

    func testConstantSubtraction() {
        let constraintBuilder = view1[.Center] - 10
        XCTAssertEqual(CGFloat(-10), constraintBuilder.constant.0)
        XCTAssertEqual(CGFloat(-10), constraintBuilder.constant.1)
    }

    func testSuccessiveConstantSubtraction() {
        let constraintBuilder = view1[.Center] - 10 - 5
        XCTAssertEqual(CGFloat(-15), constraintBuilder.constant.0)
        XCTAssertEqual(CGFloat(-15), constraintBuilder.constant.1)
    }
}