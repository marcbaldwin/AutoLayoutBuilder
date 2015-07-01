import UIKit
import XCTest

class LayoutGuideRelationTests: ALBTestCase {

    // MARK: UIViewController Extension Tests

    func testViewControllerLayoutGuidesTopShouldReturnLayoutGuideRelationForTopLayoutGuide() {
        XCTAssertTrue(viewController.topLayoutGuide === viewController.layoutGuides.top.layoutGuide)
    }

    func testViewControllerLayoutGuidesBottomShouldReturnLayoutGuideRelationForBottomLayoutGuide() {
        XCTAssertTrue(viewController.bottomLayoutGuide === viewController.layoutGuides.bottom.layoutGuide)
    }

    // MARK: LayoutGuideRelation Subscript Tests

    func testTopShouldSetAttributeToTop() {
        let relation = viewController.layoutGuides.top
        relation[.Top]
        XCTAssertEqual(VerticalAttribute.Top, relation.attribute)
    }

    func testBottomShouldSetAttributeToBottom() {
        let relation = viewController.layoutGuides.top
        relation[.Bottom]
        XCTAssertEqual(VerticalAttribute.Bottom, relation.attribute)
    }

    // MARK: LayoutGuideRelation Operator Tests

    func testPlus10ShouldSetConstantValueTo10() {
        let relation = viewController.layoutGuides.top[.Bottom] + 10
        XCTAssertEqual(CGFloat(10), relation.constant)
    }

    func testMinus10ShouldSetConstantValueToMinus10() {
        let relation = viewController.layoutGuides.top[.Bottom] - 10
        XCTAssertEqual(CGFloat(-10), relation.constant)
    }

    // MARK: LayoutGuideRelation trueAttribute Tests

    func testTopShouldReturnTop() {
        let relation = viewController.layoutGuides.top
        relation[.Top]
        XCTAssertEqual(NSLayoutAttribute.Top, relation.trueAttribute)
    }

    func testBottomShouldReturnBottom() {
        let relation = viewController.layoutGuides.top
        relation[.Bottom]
        XCTAssertEqual(NSLayoutAttribute.Bottom, relation.trueAttribute)
    }
}