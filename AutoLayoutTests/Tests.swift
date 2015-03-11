//
//  Tests.swift
//  AutoLayout
//
//  Created by Marc Baldwin on 11/03/2015.
//  Copyright (c) 2015 Marc Baldwin. All rights reserved.
//

import Foundation

import UIKit
import XCTest

class Tests: XCTestCase {

    let view1 = UIView()
    let view2 = UIView()
    let view3 = UIView()

    // MARK: Equal Heights Tests

    func testEqualHeightsWithTwoViews() {
        let constraints = equalHeights(view1, view2)
        XCTAssertEqual([NSLayoutConstraint(view1, .Height, .Equal, view2, .Height, 1, 0)], constraints)
    }

    func testEqualHeightsWithThreeViews() {
        let constraints = equalHeights(view1, view2, view3)
        XCTAssertEqual([
            NSLayoutConstraint(view1, .Height, .Equal, view2, .Height, 1, 0),
            NSLayoutConstraint(view1, .Height, .Equal, view3, .Height, 1, 0)
            ], constraints)
    }

    // MARK: Equal Widths Tests

    func testEqualWidthWithTwoViews() {
        let constraints = equalWidths(view1, view2)
        XCTAssertEqual([NSLayoutConstraint(view1, .Width, .Equal, view2, .Width, 1, 0)], constraints)
    }

    func testEqualWidthsWithThreeViews() {
        let constraints = equalWidths(view1, view2, view3)
        XCTAssertEqual([
            NSLayoutConstraint(view1, .Width, .Equal, view2, .Width, 1, 0),
            NSLayoutConstraint(view1, .Width, .Equal, view3, .Width, 1, 0)
            ], constraints)
    }
}