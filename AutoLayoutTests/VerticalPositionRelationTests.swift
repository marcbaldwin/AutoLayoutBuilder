import UIKit
import XCTest

class VerticalPositionRelationTests: ALBTestCase {

    // MARK: == Tests

    func testSingleViewOnLHS() {
        constraints = view1[.Top] == view2[.Bottom]
        XCTAssertEqual([NSLayoutConstraint(view1, .Top, .Equal, view2, .Bottom, 1, 0)], constraints!)
    }

    func testMultipleViewsOnLHS() {
        constraints = Group(view1,view2)[.Top] == view3[.Bottom]
        XCTAssertEqual([
            NSLayoutConstraint(view1, .Top, .Equal, view3, .Bottom, 1, 0),
            NSLayoutConstraint(view2, .Top, .Equal, view3, .Bottom, 1, 0)], constraints!)
    }

    func testSingleViewTopEqualsViewControllerTopLayoutGuideTop() {
        constraints = view1[.Top] == viewController.layoutGuides.top[.Top]
        XCTAssertEqual([NSLayoutConstraint(view1, .Top, .Equal, viewController.topLayoutGuide, .Top, 1, 0)], constraints!)
    }

    func testSingleViewTopEqualsViewControllerTopLayoutGuideBottom() {
        constraints = view1[.Top] == viewController.layoutGuides.top[.Bottom]
        XCTAssertEqual([NSLayoutConstraint(view1, .Top, .Equal, viewController.topLayoutGuide, .Bottom, 1, 0)], constraints!)
    }

    func testSingleViewTopEqualsViewControllerTopLayoutGuideBottomPlusMargin() {
        constraints = view1[.Top] == viewController.layoutGuides.top[.Bottom] + 10
        XCTAssertEqual([NSLayoutConstraint(view1, .Top, .Equal, viewController.topLayoutGuide, .Bottom, 1, 10)], constraints!)
    }

    func testSingleViewTopEqualsViewControllerTopLayoutGuideBottomMinusMargin() {
        constraints = view1[.Top] == viewController.layoutGuides.top[.Bottom] - 10
        XCTAssertEqual([NSLayoutConstraint(view1, .Top, .Equal, viewController.topLayoutGuide, .Bottom, 1, -10)], constraints!)
    }

    func testSingleViewTopEqualsViewControllerBottomLayoutGuideTop() {
        constraints = view1[.Top] == viewController.layoutGuides.bottom[.Top]
        XCTAssertEqual([NSLayoutConstraint(view1, .Top, .Equal, viewController.bottomLayoutGuide, .Top, 1, 0)], constraints!)
    }

    // MARK: >= Tests

    func testSingleViewTopGreaterThanOrEqualToViewControllerTopLayoutGuideTop() {
        constraints = view1[.Top] >= viewController.layoutGuides.top[.Top]
        XCTAssertEqual([NSLayoutConstraint(view1, .Top, .GreaterThanOrEqual, viewController.topLayoutGuide, .Top, 1, 0)], constraints!)
    }

    // MARK: <= Tests

    func testSingleViewTopLessThanOrEqualToViewControllerTopLayoutGuideTop() {
        constraints = view1[.Top] <= viewController.layoutGuides.top[.Top]
        XCTAssertEqual([NSLayoutConstraint(view1, .Top, .LessThanOrEqual, viewController.topLayoutGuide, .Top, 1, 0)], constraints!)
    }

    // MARK: UIView Layout Tests

    func testLayoutWithTop() {
        let constraintBuilder = view1[.Top]
        XCTAssertEqual(VerticalPositionAttribute.Top, constraintBuilder.attribute)
        XCTAssertEqual([view1], constraintBuilder.views)
    }

    func testLayoutWithBottom() {
        let constraintBuilder = view1[.Bottom]
        XCTAssertEqual(VerticalPositionAttribute.Bottom, constraintBuilder.attribute)
        XCTAssertEqual([view1], constraintBuilder.views)
    }

    // MARK: Array Layout Tests

    func testLayoutWithMultipleViewsBottom() {
        let constraintBuilder = Group([view1, view2])[.Bottom]
        XCTAssertEqual(VerticalPositionAttribute.Bottom, constraintBuilder.attribute)
        XCTAssertEqual([view1, view2], constraintBuilder.views)
    }

    // MARK: Multiplier Tests

    func testMultiplierMultiplication() {
        let constraintBuilder = view1[.Bottom] * 0.5
        XCTAssertEqual(CGFloat(0.5), constraintBuilder.multiplier)
    }

    func testSuccessiveMultiplierMultiplication() {
        let constraintBuilder = view1[.Bottom] * 0.5 * 0.25
        XCTAssertEqual(CGFloat(0.125), constraintBuilder.multiplier)
    }

    func testMultiplierDivision() {
        let constraintBuilder = view1[.Bottom] / 2
        XCTAssertEqual(CGFloat(0.5), constraintBuilder.multiplier)
    }

    func testSuccessiveMultiplierDivision() {
        let constraintBuilder = view1[.Bottom] / 2 / 2.5
        XCTAssertEqual(CGFloat(0.2), constraintBuilder.multiplier)
    }

    // MARK: Constant Tests

    func testConstantAddition() {
        let constraintBuilder = view1[.Bottom] + 10
        XCTAssertEqual(CGFloat(10), constraintBuilder.constant)
    }

    func testSuccessiveConstantAddition() {
        let constraintBuilder = view1[.Bottom] + 10 + 5
        XCTAssertEqual(CGFloat(15), constraintBuilder.constant)
    }

    func testConstantSubtraction() {
        let constraintBuilder = view1[.Bottom] - 10
        XCTAssertEqual(CGFloat(-10), constraintBuilder.constant)
    }

    func testSuccessiveConstantSubtraction() {
        let constraintBuilder = view1[.Bottom] - 10 - 5
        XCTAssertEqual(CGFloat(-15), constraintBuilder.constant)
    }

    // MARK: UIView Subscript Tests

    func testCenterY() {
        let relation = view1[.CenterY]
        XCTAssertEqual(VerticalPositionAttribute.CenterY, relation.attribute)
    }

    func testTop() {
        let relation = view1[.Top]
        XCTAssertEqual(VerticalPositionAttribute.Top, relation.attribute)
    }

    func testBottom() {
        let relation = view1[.Bottom]
        XCTAssertEqual(VerticalPositionAttribute.Bottom, relation.attribute)
    }

    func testBaseline() {
        let relation = view1[.Baseline]
        XCTAssertEqual(VerticalPositionAttribute.Baseline, relation.attribute)
    }

    func testFirstBaseline() {
        let relation = view1[.FirstBaseline]
        XCTAssertEqual(VerticalPositionAttribute.FirstBaseline, relation.attribute)
    }

    func testCenterYWithinMargins() {
        let relation = view1[.CenterYWithinMargins]
        XCTAssertEqual(VerticalPositionAttribute.CenterYWithinMargins, relation.attribute)
    }

    func testTopMargin() {
        let relation = view1[.TopMargin]
        XCTAssertEqual(VerticalPositionAttribute.TopMargin, relation.attribute)
    }

    func testBottomMargin() {
        let relation = view1[.BottomMargin]
        XCTAssertEqual(VerticalPositionAttribute.BottomMargin, relation.attribute)
    }
}