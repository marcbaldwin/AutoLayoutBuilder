import UIKit
import XCTest

class HorizontalPositionRelationTests: ALBTestCase {

    // MARK: == Tests

    func testEqualView() {
        let constraints = view1[.Left] == view2[.Right]
        XCTAssertEqual([NSLayoutConstraint(view1, .Left, .Equal, view2, .Right, 1, 0)], constraints)
    }

    func testEqualViewWithConstant() {
        let constraints = view1[.Left] == view2[.Right] + 10
        XCTAssertEqual([NSLayoutConstraint(view1, .Left, .Equal, view2, .Right, 1, 10)], constraints)
    }

    func testEqualMultipleViews() {
        let constraints = Group(view1,view2)[.Left] == view3[.Right]
        XCTAssertEqual([
            NSLayoutConstraint(view1, .Left, .Equal, view3, .Right, 1, 0),
            NSLayoutConstraint(view2, .Left, .Equal, view3, .Right, 1, 0)], constraints)
    }

    // MARK: UIView Layout Tests

    func testLayoutWithLeft() {
        let constraintBuilder = view1[.Left]
        XCTAssertEqual(HorizontalAttribute.Left, constraintBuilder.attribute)
        XCTAssertEqual([view1], constraintBuilder.views)
    }

    func testLayoutWithRight() {
        let constraintBuilder = view1[.Right]
        XCTAssertEqual(HorizontalAttribute.Right, constraintBuilder.attribute)
        XCTAssertEqual([view1], constraintBuilder.views)
    }

    // MARK: Array Layout Tests

    func testLayoutWithMultipleViewsRight() {
        let constraintBuilder = Group([view1, view2])[.Right]
        XCTAssertEqual(HorizontalAttribute.Right, constraintBuilder.attribute)
        XCTAssertEqual([view1, view2], constraintBuilder.views)
    }

    // MARK: Multiplier Tests

    func testMultiplierMultiplication() {
        let constraintBuilder = view1[.Left] * 0.5
        XCTAssertEqual(CGFloat(0.5), constraintBuilder.multiplier)
    }

    func testSuccessiveMultiplierMultiplication() {
        let constraintBuilder = view1[.Left] * 0.5 * 0.25
        XCTAssertEqual(CGFloat(0.125), constraintBuilder.multiplier)
    }

    func testMultiplierDivision() {
        let constraintBuilder = view1[.Left] / 2
        XCTAssertEqual(CGFloat(0.5), constraintBuilder.multiplier)
    }

    func testSuccessiveMultiplierDivision() {
        let constraintBuilder = view1[.Left] / 2 / 2.5
        XCTAssertEqual(CGFloat(0.2), constraintBuilder.multiplier)
    }

    // MARK: Constant Tests

    func testConstantAddition() {
        let constraintBuilder = view1[.Left] + 10
        XCTAssertEqual(CGFloat(10), constraintBuilder.constant)
    }

    func testSuccessiveConstantAddition() {
        let constraintBuilder = view1[.Left] + 10 + 5
        XCTAssertEqual(CGFloat(15), constraintBuilder.constant)
    }

    func testConstantSubtraction() {
        let constraintBuilder = view1[.Left] - 10
        XCTAssertEqual(CGFloat(-10), constraintBuilder.constant)
    }

    func testSuccessiveConstantSubtraction() {
        let constraintBuilder = view1[.Left] - 10 - 5
        XCTAssertEqual(CGFloat(-15), constraintBuilder.constant)
    }

    // MARK: UIView Subscript Tests

    func testCenterX() {
        let relation = view1[.CenterX]
        XCTAssertEqual(HorizontalAttribute.CenterX, relation.attribute)
    }

    func testLeft() {
        let relation = view1[.Left]
        XCTAssertEqual(HorizontalAttribute.Left, relation.attribute)
    }

    func testRight() {
        let relation = view1[.Right]
        XCTAssertEqual(HorizontalAttribute.Right, relation.attribute)
    }

    func testLeading() {
        let relation = view1[.Leading]
        XCTAssertEqual(HorizontalAttribute.Leading, relation.attribute)
    }

    func testTrailing() {
        let relation = view1[.Trailing]
        XCTAssertEqual(HorizontalAttribute.Trailing, relation.attribute)
    }

    func testCenterXWithinMargins() {
        let relation = view1[.CenterXWithinMargins]
        XCTAssertEqual(HorizontalAttribute.CenterXWithinMargins, relation.attribute)
    }

    func testLeftMargin() {
        let relation = view1[.LeftMargin]
        XCTAssertEqual(HorizontalAttribute.LeftMargin, relation.attribute)
    }

    func testRightMargin() {
        let relation = view1[.RightMargin]
        XCTAssertEqual(HorizontalAttribute.RightMargin, relation.attribute)
    }

    func testLeadingMargin() {
        let relation = view1[.LeadingMargin]
        XCTAssertEqual(HorizontalAttribute.LeadingMargin, relation.attribute)
    }

    func testTrailingMargin() {
        let relation = view1[.TrailingMargin]
        XCTAssertEqual(HorizontalAttribute.TrailingMargin, relation.attribute)
    }
}