import UIKit
import XCTest

class HorizontalPositionRelationTests: XCTestCase {

    let view1 = UIView()
    let view2 = UIView()
    let view3 = UIView()

    // MARK: == Tests

    func testSingleViewOnLHS() {
        let constraints = view1[.Left] == view2[.Right]
        XCTAssertEqual([NSLayoutConstraint(view1, .Left, .Equal, view2, .Right, 1, 0)], constraints)
    }

    func testMultipleViewsOnLHS() {
        let constraints = Views(view1,view2)[.Left] == view3[.Right]
        XCTAssertEqual([
            NSLayoutConstraint(view1, .Left, .Equal, view3, .Right, 1, 0),
            NSLayoutConstraint(view2, .Left, .Equal, view3, .Right, 1, 0)], constraints)
    }

    // MARK: UIView Layout Tests

    func testLayoutWithLeft() {
        let constraintBuilder = view1[.Left]
        XCTAssertEqual(HorizontalPositionAttribute.Left, constraintBuilder.attribute)
        XCTAssertEqual([view1], constraintBuilder.views)
    }

    func testLayoutWithRight() {
        let constraintBuilder = view1[.Right]
        XCTAssertEqual(HorizontalPositionAttribute.Right, constraintBuilder.attribute)
        XCTAssertEqual([view1], constraintBuilder.views)
    }

    // MARK: Array Layout Tests

    func testLayoutWithMultipleViewsRight() {
        let constraintBuilder = Views([view1, view2])[.Right]
        XCTAssertEqual(HorizontalPositionAttribute.Right, constraintBuilder.attribute)
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
}