import UIKit
import XCTest

class EdgeRelationTests: XCTestCase {

    let view1 = UIView()
    let view2 = UIView()
    let view3 = UIView()

    // MARK: == Tests

    func testEqualToView() {
        let constraints = view1[.Edges] == view2[.Edges]
        XCTAssertEqual([
            NSLayoutConstraint(view1, .Left, .Equal, view2, .Left, 1, 0),
            NSLayoutConstraint(view1, .Right, .Equal, view2, .Right, 1, 0),
            NSLayoutConstraint(view1, .Top, .Equal, view2, .Top, 1, 0),
            NSLayoutConstraint(view1, .Bottom, .Equal, view2, .Bottom, 1, 0)], constraints)
    }

    func testEqualToViewMinusConstant() {
        let constraints = view1[.Edges] == view2[.Edges] - 5
        XCTAssertEqual([
            NSLayoutConstraint(view1, .Left, .Equal, view2, .Left, 1, 5),
            NSLayoutConstraint(view1, .Right, .Equal, view2, .Right, 1, -5),
            NSLayoutConstraint(view1, .Top, .Equal, view2, .Top, 1, 5),
            NSLayoutConstraint(view1, .Bottom, .Equal, view2, .Bottom, 1, -5)], constraints)
    }

    func testEqualToMultipleViews() {
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

    // MARK: UIView Layout Tests

    func testLayoutWithWidth() {
        let constraintBuilder = view1[.Edges]
        XCTAssertEqual(EdgeAttribute.Edges, constraintBuilder.attribute)
        XCTAssertEqual([view1], constraintBuilder.views)
    }

    // MARK: Array Layout Tests

    func testLayoutWithMultipleViewsWidth() {
        let constraintBuilder = Group([view1, view2])[.Edges]
        XCTAssertEqual(EdgeAttribute.Edges, constraintBuilder.attribute)
        XCTAssertEqual([view1, view2], constraintBuilder.views)
    }

    // MARK: Multiplier Tests

    func testMultiplierMultiplication() {
        let constraintBuilder = view1[.Edges] * 0.5
        XCTAssertEqual(CGFloat(0.5), constraintBuilder.multiplier.l)
        XCTAssertEqual(CGFloat(0.5), constraintBuilder.multiplier.r)
        XCTAssertEqual(CGFloat(0.5), constraintBuilder.multiplier.t)
        XCTAssertEqual(CGFloat(0.5), constraintBuilder.multiplier.b)
    }

    func testSuccessiveMultiplierMultiplication() {
        let constraintBuilder = view1[.Edges] * 0.5 * 0.25
        XCTAssertEqual(CGFloat(0.125), constraintBuilder.multiplier.l)
        XCTAssertEqual(CGFloat(0.125), constraintBuilder.multiplier.r)
        XCTAssertEqual(CGFloat(0.125), constraintBuilder.multiplier.t)
        XCTAssertEqual(CGFloat(0.125), constraintBuilder.multiplier.b)
    }

    func testMultiplierDivision() {
        let constraintBuilder = view1[.Edges] / 2
        XCTAssertEqual(CGFloat(0.5), constraintBuilder.multiplier.l)
        XCTAssertEqual(CGFloat(0.5), constraintBuilder.multiplier.r)
        XCTAssertEqual(CGFloat(0.5), constraintBuilder.multiplier.t)
        XCTAssertEqual(CGFloat(0.5), constraintBuilder.multiplier.b)
    }

    func testSuccessiveMultiplierDivision() {
        let constraintBuilder = view1[.Edges] / 2 / 2.5
        XCTAssertEqual(CGFloat(0.2), constraintBuilder.multiplier.l)
        XCTAssertEqual(CGFloat(0.2), constraintBuilder.multiplier.r)
        XCTAssertEqual(CGFloat(0.2), constraintBuilder.multiplier.t)
        XCTAssertEqual(CGFloat(0.2), constraintBuilder.multiplier.b)
    }

    // MARK: Constant Tests

    func testConstantAddition() {
        let constraintBuilder = view1[.Edges] + 10
        XCTAssertEqual(CGFloat(-10), constraintBuilder.constant.l)
        XCTAssertEqual(CGFloat(10), constraintBuilder.constant.r)
        XCTAssertEqual(CGFloat(-10), constraintBuilder.constant.t)
        XCTAssertEqual(CGFloat(10), constraintBuilder.constant.b)
    }

    func testSuccessiveConstantAddition() {
        let constraintBuilder = view1[.Edges] + 10 + 5
        XCTAssertEqual(CGFloat(-15), constraintBuilder.constant.l)
        XCTAssertEqual(CGFloat(15), constraintBuilder.constant.r)
        XCTAssertEqual(CGFloat(-15), constraintBuilder.constant.t)
        XCTAssertEqual(CGFloat(15), constraintBuilder.constant.b)
    }

    func testConstantSubtraction() {
        let constraintBuilder = view1[.Edges] - 10
        XCTAssertEqual(CGFloat(10), constraintBuilder.constant.l)
        XCTAssertEqual(CGFloat(-10), constraintBuilder.constant.r)
        XCTAssertEqual(CGFloat(10), constraintBuilder.constant.t)
        XCTAssertEqual(CGFloat(-10), constraintBuilder.constant.b)
    }

    func testSuccessiveConstantSubtraction() {
        let constraintBuilder = view1[.Edges] - 10 - 5
        XCTAssertEqual(CGFloat(15), constraintBuilder.constant.l)
        XCTAssertEqual(CGFloat(-15), constraintBuilder.constant.r)
        XCTAssertEqual(CGFloat(15), constraintBuilder.constant.t)
        XCTAssertEqual(CGFloat(-15), constraintBuilder.constant.b)
    }
}