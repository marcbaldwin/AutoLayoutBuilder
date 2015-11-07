import UIKit
import XCTest
@testable import AutoLayoutBuilder

class VerticalTests: ALBTestCase {

    // MARK: Relative to view

    func testDeclareTopOfViewEqualToBottomOfAnotherView() {
        constraints = view1[.Top] == view2[.Bottom]
        XCTAssertEqual([NSLayoutConstraint(view1, .Top, .Equal, view2, .Bottom, 1, 0)], constraints!)
    }

    func testDeclareTopOfMultipleViewsEqualToBottomOfAnotherView() {
        constraints = Group(view1,view2)[.Top] == view3[.Bottom]
        XCTAssertEqual([
            NSLayoutConstraint(view1, .Top, .Equal, view3, .Bottom, 1, 0),
            NSLayoutConstraint(view2, .Top, .Equal, view3, .Bottom, 1, 0)], constraints!)
    }

    // MARK: Relative to layout guide

    func testDeclareTopOfViewEqualToTopOfTopLayoutGuide() {
        constraints = view1[.Top] == viewController.layoutGuides.top[.Top]
        XCTAssertEqual([NSLayoutConstraint(view1, .Top, .Equal, viewController.topLayoutGuide, .Top, 1, 0)], constraints!)
    }

    func testDeclareBottomOfViewEqualToBottomOfBottomLayoutGuide() {
        constraints = view1[.Bottom] == viewController.layoutGuides.bottom[.Bottom]
        XCTAssertEqual([NSLayoutConstraint(view1, .Bottom, .Equal, viewController.bottomLayoutGuide, .Bottom, 1, 0)], constraints!)
    }

    func testDeclareTopOfViewGreaterThanOrEqualToTopOfTopLayoutGuide() {
        constraints = view1[.Top] >= viewController.layoutGuides.top[.Top]
        XCTAssertEqual([NSLayoutConstraint(view1, .Top, .GreaterThanOrEqual, viewController.topLayoutGuide, .Top, 1, 0)], constraints!)
    }

    func testDeclareTopOfViewLessThanOrEqualToTopOfTopLayoutGuide() {
        constraints = view1[.Top] <= viewController.layoutGuides.top[.Top]
        XCTAssertEqual([NSLayoutConstraint(view1, .Top, .LessThanOrEqual, viewController.topLayoutGuide, .Top, 1, 0)], constraints!)
    }

    // MARK: Relative to layout guide with constant

    func testDeclareTopOfViewEqualToBottomOfTopLayoutGuidePlusConstant() {
        constraints = view1[.Top] == viewController.layoutGuides.top[.Bottom] + 10
        XCTAssertEqual([NSLayoutConstraint(view1, .Top, .Equal, viewController.topLayoutGuide, .Bottom, 1, 10)], constraints!)
    }

    func testDeclareTopOfViewEqualToBottomOfTopLayoutGuideMinusConstant() {
        constraints = view1[.Top] == viewController.layoutGuides.top[.Bottom] - 10
        XCTAssertEqual([NSLayoutConstraint(view1, .Top, .Equal, viewController.topLayoutGuide, .Bottom, 1, -10)], constraints!)
    }
}