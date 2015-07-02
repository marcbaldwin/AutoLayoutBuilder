import UIKit
import XCTest

class AspectRatioTests: ALBTestCase {

    let ratio: CGFloat = 16/9

    // MARK: Relative to ratio

    func testDeclareAspectRatioOfViewEqualToConstantRatio() {
        let constraints = view1[.AspectRatio] == ratio
        XCTAssertEqual(NSLayoutConstraint(view1, .Width, .Equal, view1, .Height, ratio, 0), constraints[0])
    }

    func testDeclareAspectRatioOfMultipleViewsEqualToConstantRatio() {
        let constraints = Group(view1, view2)[.AspectRatio] == ratio
        XCTAssertEqual(NSLayoutConstraint(view1, .Width, .Equal, view1, .Height, ratio, 0), constraints[0])
        XCTAssertEqual(NSLayoutConstraint(view2, .Width, .Equal, view2, .Height, ratio, 0), constraints[1])
    }
}