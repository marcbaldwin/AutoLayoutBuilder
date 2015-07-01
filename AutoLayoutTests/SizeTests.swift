import UIKit
import XCTest

class SizeRelationTests: ALBTestCase {

    func testDeclareSizeOfViewEqualToSizeOfAnotherView() {
        let constraints = view1[.Size] == view2[.Size]
        XCTAssertEqual([
            NSLayoutConstraint(view1, .Width, .Equal, view2, .Width, 1, 0),
            NSLayoutConstraint(view1, .Height, .Equal, view2, .Height, 1, 0)], constraints)
    }

    // MARK: Constants

    func testDeclareSizeOfViewEqualToSizeOfAnotherViewPlusConstant() {
        let constraints = view1[.Size] == view2[.Size] + 10
        XCTAssertEqual([
            NSLayoutConstraint(view1, .Width, .Equal, view2, .Width, 1, 10),
            NSLayoutConstraint(view1, .Height, .Equal, view2, .Height, 1, 10)], constraints)
    }

    func testDeclareSizeOfViewEqualToSizeOfAnotherViewMinusConstant() {
        let constraints = view1[.Size] == view2[.Size] - 10
        XCTAssertEqual([
            NSLayoutConstraint(view1, .Width, .Equal, view2, .Width, 1, -10),
            NSLayoutConstraint(view1, .Height, .Equal, view2, .Height, 1, -10)], constraints)
    }

    func testDeclareSizeOfViewEqualToSizeOfAnotherViewPlusConstantTuple() {
        let constraints = view1[.Size] == view2[.Size] + (10, 20)
        XCTAssertEqual([
            NSLayoutConstraint(view1, .Width, .Equal, view2, .Width, 1, 10),
            NSLayoutConstraint(view1, .Height, .Equal, view2, .Height, 1, 20)], constraints)
    }

    func testDeclareSizeOfViewEqualToSizeOfAnotherViewMinusConstantTuple() {
        let constraints = view1[.Size] == view2[.Size] - (10, 20)
        XCTAssertEqual([
            NSLayoutConstraint(view1, .Width, .Equal, view2, .Width, 1, -10),
            NSLayoutConstraint(view1, .Height, .Equal, view2, .Height, 1, -20)], constraints)
    }

    // MARK: Multipliers

    func testDeclareSizeOfViewEqualToSizeOfAnotherViewMultipliedByConstant() {
        let constraints = view1[.Size] == view2[.Size] * 1.5
        XCTAssertEqual([
            NSLayoutConstraint(view1, .Width, .Equal, view2, .Width, 1.5, 0),
            NSLayoutConstraint(view1, .Height, .Equal, view2, .Height, 1.5, 0)], constraints)
    }

    func testDeclareSizeOfViewEqualToSizeOfAnotherViewDividedByConstant() {
        let constraints = view1[.Size] == view2[.Size] / 0.75
        XCTAssertEqual([
            NSLayoutConstraint(view1, .Width, .Equal, view2, .Width, 1/0.75, 0),
            NSLayoutConstraint(view1, .Height, .Equal, view2, .Height, 1/0.75, 0)], constraints)
    }

    func testDeclareSizeOfViewEqualToSizeOfAnotherViewMultipliedByConstantTuple() {
        let constraints = view1[.Size] == view2[.Size] * (1, 2)
        XCTAssertEqual([
            NSLayoutConstraint(view1, .Width, .Equal, view2, .Width, 1, 0),
            NSLayoutConstraint(view1, .Height, .Equal, view2, .Height, 2, 0)], constraints)
    }

    func testDeclareSizeOfViewEqualToSizeOfAnotherViewDivideddByConstantTuple() {
        let constraints = view1[.Size] == view2[.Size] / (2, 3)
        XCTAssertEqual([
            NSLayoutConstraint(view1, .Width, .Equal, view2, .Width, 1/2, 0),
            NSLayoutConstraint(view1, .Height, .Equal, view2, .Height, 1/3, 0)], constraints)
    }

    // MARK: Combination

    func testDeclareSizeOfViewEqualToSizeOfAnotherViewDividedByConstantPlusConstant() {
        let constraints = view1[.Size] == view2[.Size] / 0.75 + CGFloat(20)
        XCTAssertEqual([
            NSLayoutConstraint(view1, .Width, .Equal, view2, .Width, 1/0.75, 20),
            NSLayoutConstraint(view1, .Height, .Equal, view2, .Height, 1/0.75, 20)], constraints)
    }

    // MARK: Multiple Views

    func testDeclareSizeOfMultipleViewsEqualToSizeOfAnotherView() {
        let constraints = Group(view1,view2)[.Size] == view3[.Size]
        XCTAssertEqual([
            NSLayoutConstraint(view1, .Width, .Equal, view3, .Width, 1, 0),
            NSLayoutConstraint(view1, .Height, .Equal, view3, .Height, 1, 0),
            NSLayoutConstraint(view2, .Width, .Equal, view3, .Width, 1, 0),
            NSLayoutConstraint(view2, .Height, .Equal, view3, .Height, 1, 0)], constraints)
    }

    // MARK: Size

    func testDeclareSizeOfViewEqualToSize() {
        let constraints = view1[.Size] == CGSize(width: 50, height: 100)
        XCTAssertEqual([
            NSLayoutConstraint(view1, .Width, .Equal, nil, .NotAnAttribute, 1, 50),
            NSLayoutConstraint(view1, .Height, .Equal, nil, .NotAnAttribute, 1, 100)], constraints)
    }
}