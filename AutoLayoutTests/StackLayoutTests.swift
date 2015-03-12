//
//  Created by Marc Baldwin on 11/03/2015.
//  Copyright (c) 2015 Marc Baldwin. All rights reserved.
//

import Foundation

import UIKit
import XCTest

class StackLayoutTests: XCTestCase {

    let view1 = UIView()
    let view2 = UIView()
    let view3 = UIView()

    func testStackLayoutWithTwoViews() {
        let constraints = .Vertical ~ view1 | view2
        XCTAssertEqual([NSLayoutConstraint(view2, .Top, .Equal, view1, .Bottom, 1, 0)], constraints)
    }

    func testStackLayoutWithThreeViews() {
        let constraints = .Vertical ~ view1 | view2 | view3
        XCTAssertEqual([
            NSLayoutConstraint(view2, .Top, .Equal, view1, .Bottom, 1, 0),
            NSLayoutConstraint(view3, .Top, .Equal, view2, .Bottom, 1, 0)], constraints)
    }

    func testStackLayoutWithTwoViewsAndConstant() {
        let constraints = .Vertical ~ view1 | 10 | view2
        XCTAssertEqual([NSLayoutConstraint(view2, .Top, .Equal, view1, .Bottom, 1, 10)], constraints)
    }

    func testStackLayoutWithThreeViewsAndConstantCase1() {
        let constraints = .Vertical ~ view1 | 10 | view2 | view3
        XCTAssertEqual([
            NSLayoutConstraint(view2, .Top, .Equal, view1, .Bottom, 1, 10),
            NSLayoutConstraint(view3, .Top, .Equal, view2, .Bottom, 1, 0)], constraints)
    }

    func testStackLayoutWithThreeViewsAndConstantCase2() {
        let constraints = .Vertical ~ view1 | view2 | 10 | view3
        XCTAssertEqual([
            NSLayoutConstraint(view2, .Top, .Equal, view1, .Bottom, 1, 0),
            NSLayoutConstraint(view3, .Top, .Equal, view2, .Bottom, 1, 10)], constraints)
    }

    func testStackLayoutWithThreeViewsAndConstantCase3() {
        let constraints = .Vertical ~ view1 | 10 | view2 | 10 | view3
        XCTAssertEqual([
            NSLayoutConstraint(view2, .Top, .Equal, view1, .Bottom, 1, 10),
            NSLayoutConstraint(view3, .Top, .Equal, view2, .Bottom, 1, 10)], constraints)
    }
}