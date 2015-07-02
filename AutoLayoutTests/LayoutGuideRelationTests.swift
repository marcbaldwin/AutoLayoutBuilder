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
}