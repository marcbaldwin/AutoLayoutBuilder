import UIKit
import XCTest

class SizeRelationTests: XCTestCase {

    let view1 = UIView()
    let view2 = UIView()
    let view3 = UIView()

    // MARK: == Tests

    func testSingleViewOnLHS() {
        let constraints = view1[.Size] == view2[.Size]
        XCTAssertEqual([
            NSLayoutConstraint(view1, .Width, .Equal, view2, .Width, 1, 0),
            NSLayoutConstraint(view1, .Height, .Equal, view2, .Height, 1, 0)], constraints)
    }

    func testEqualToViewWithConstantAddition() {
        let constraints = view1[.Size] == view2[.Size] + 10
        XCTAssertEqual([
            NSLayoutConstraint(view1, .Width, .Equal, view2, .Width, 1, 10),
            NSLayoutConstraint(view1, .Height, .Equal, view2, .Height, 1, 10)], constraints)
    }

    func testEqualToViewWithConstantSubtraction() {
        let constraints = view1[.Size] == view2[.Size] - 10
        XCTAssertEqual([
            NSLayoutConstraint(view1, .Width, .Equal, view2, .Width, 1, -10),
            NSLayoutConstraint(view1, .Height, .Equal, view2, .Height, 1, -10)], constraints)
    }

    func testMultipleViewsOnLHS() {
        let constraints = Views(view1,view2)[.Size] == view3[.Size]
        XCTAssertEqual([
            NSLayoutConstraint(view1, .Width, .Equal, view3, .Width, 1, 0),
            NSLayoutConstraint(view1, .Height, .Equal, view3, .Height, 1, 0),
            NSLayoutConstraint(view2, .Width, .Equal, view3, .Width, 1, 0),
            NSLayoutConstraint(view2, .Height, .Equal, view3, .Height, 1, 0)], constraints)
    }

    func testSizeEqualsConstantValue() {
        let constraints = view1[.Size] == CGSize(width: 50, height: 100)
        XCTAssertEqual([
            NSLayoutConstraint(view1, .Width, .Equal, nil, .NotAnAttribute, 1, 50),
            NSLayoutConstraint(view1, .Height, .Equal, nil, .NotAnAttribute, 1, 100)], constraints)
    }

    // MARK: UIView Layout Tests

    func testLayoutWithWidth() {
        let constraintBuilder = view1[.Size]
        XCTAssertEqual(SizeAttribute.Size, constraintBuilder.attribute)
        XCTAssertEqual([view1], constraintBuilder.views)
    }

    // MARK: Array Layout Tests

    func testLayoutWithMultipleViewsWidth() {
        let constraintBuilder = Views([view1, view2])[.Size]
        XCTAssertEqual(SizeAttribute.Size, constraintBuilder.attribute)
        XCTAssertEqual([view1, view2], constraintBuilder.views)
    }

    // MARK: Multiplier Tests

    func testMultiplierMultiplication() {
        let constraintBuilder = view1[.Size] * 0.5
        XCTAssertEqual(CGFloat(0.5), constraintBuilder.multiplier.0)
        XCTAssertEqual(CGFloat(0.5), constraintBuilder.multiplier.1)
    }

    func testSuccessiveMultiplierMultiplication() {
        let constraintBuilder = view1[.Size] * 0.5 * 0.25
        XCTAssertEqual(CGFloat(0.125), constraintBuilder.multiplier.0)
        XCTAssertEqual(CGFloat(0.125), constraintBuilder.multiplier.1)
    }

    func testMultiplierDivision() {
        let constraintBuilder = view1[.Size] / 2
        XCTAssertEqual(CGFloat(0.5), constraintBuilder.multiplier.0)
        XCTAssertEqual(CGFloat(0.5), constraintBuilder.multiplier.1)
    }

    func testSuccessiveMultiplierDivision() {
        let constraintBuilder = view1[.Size] / 2 / 2.5
        XCTAssertEqual(CGFloat(0.2), constraintBuilder.multiplier.0)
        XCTAssertEqual(CGFloat(0.2), constraintBuilder.multiplier.1)
    }

    // MARK: Constant Tests

    func testConstantAddition() {
        let constraintBuilder = view1[.Size] + 10
        XCTAssertEqual(CGFloat(10), constraintBuilder.constant.0)
        XCTAssertEqual(CGFloat(10), constraintBuilder.constant.1)
    }

    func testSuccessiveConstantAddition() {
        let constraintBuilder = view1[.Size] + 10 + 5
        XCTAssertEqual(CGFloat(15), constraintBuilder.constant.0)
        XCTAssertEqual(CGFloat(15), constraintBuilder.constant.1)
    }

    func testConstantSubtraction() {
        let constraintBuilder = view1[.Size] - 10
        XCTAssertEqual(CGFloat(-10), constraintBuilder.constant.0)
        XCTAssertEqual(CGFloat(-10), constraintBuilder.constant.1)
    }

    func testSuccessiveConstantSubtraction() {
        let constraintBuilder = view1[.Size] - 10 - 5
        XCTAssertEqual(CGFloat(-15), constraintBuilder.constant.0)
        XCTAssertEqual(CGFloat(-15), constraintBuilder.constant.1)
    }
}