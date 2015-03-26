import Foundation

protocol LayoutTestSpecification {

    func testLayoutWithTwoAdjacentViews()

    func testLayoutWithThreeAdjacentViews()

    func testLayoutWithTwoViewsSeparatedByMargin()

    func testLayoutWithThreeViewsSeparatedByDifferingMargins()

    func testLayoutWithThreeViewsWithFirstAndSecondSeparatedByMargin()

    func testLayoutWithThreeViewsWithSecondAndThirdSeparatedByMargin()

    func testLayoutWithViewGroup()
}