//
//  AutoLayoutTests.swift
//  AutoLayoutTests
//
//  Created by Marc Baldwin on 10/03/2015.
//  Copyright (c) 2015 Marc Baldwin. All rights reserved.
//

import UIKit
import XCTest

class HorizontalLayoutTests: XCTestCase {

    let view1 = UIView()
    let view2 = UIView()

    func testLeftOfViewEqualToRightOfView() {

        let constraints = view1.layout(.Left) === view2.layout(.Right)

        XCTAssert(constraints.count == 1)
        let constraint = constraints.first!
        assertEqual(NSLayoutConstraint(item: view1, attribute: .Left, relatedBy: .Equal, toItem: view2, attribute: .Right, multiplier: 1, constant: 0), constraint)
    }

    func testLeftOfViewEqualToLeftOfView() {

        let constraints = view1.layout(.Left) === view2.layout(.Left)

        XCTAssert(constraints.count == 1)
        let constraint = constraints.first!
        assertEqual(NSLayoutConstraint(item: view1, attribute: .Left, relatedBy: .Equal, toItem: view2, attribute: .Left, multiplier: 1, constant: 0), constraint)
    }

    // MARK: UIView Layout Tests

    func testLayoutWithLeft() {
        let constraintBuilder = view1.layout(.Left)
        XCTAssertEqual(HorizontalPositionAttribute.Left, constraintBuilder.attribute)
        XCTAssertEqual([view1], constraintBuilder.views)
    }

    func testLayoutWithRight() {
        let constraintBuilder = view1.layout(.Right)
        XCTAssertEqual(HorizontalPositionAttribute.Right, constraintBuilder.attribute)
        XCTAssertEqual([view1], constraintBuilder.views)
    }

    // MARK: Array Layout Tests

    func testLayoutWithMultipleViewsRight() {
        let constraintBuilder = [view1, view2].layout(.Right)
        XCTAssertEqual(HorizontalPositionAttribute.Right, constraintBuilder.attribute)
        XCTAssertEqual([view1, view2], constraintBuilder.views)
    }

    // MARK: Multiplier Tests

    func testMultiplierMultiplication() {
        let constraintBuilder = view1.layout(.Left) * 0.5
        XCTAssertEqual(CGFloat(0.5), constraintBuilder.multiplier)
    }

    func testSuccessiveMultiplierMultiplication() {
        let constraintBuilder = view1.layout(.Left) * 0.5 * 0.25
        XCTAssertEqual(CGFloat(0.125), constraintBuilder.multiplier)
    }

    func testMultiplierDivision() {
        let constraintBuilder = view1.layout(.Left) / 2
        XCTAssertEqual(CGFloat(0.5), constraintBuilder.multiplier)
    }

    func testSuccessiveMultiplierDivision() {
        let constraintBuilder = view1.layout(.Left) / 2 / 2.5
        XCTAssertEqual(CGFloat(0.2), constraintBuilder.multiplier)
    }

    // MARK: Constant Tests

    func testConstantAddition() {
        let constraintBuilder = view1.layout(.Left) + 10
        XCTAssertEqual(CGFloat(10), constraintBuilder.constant)
    }

    func testSuccessiveConstantAddition() {
        let constraintBuilder = view1.layout(.Left) + 10 + 5
        XCTAssertEqual(CGFloat(15), constraintBuilder.constant)
    }

    func testConstantSubtraction() {
        let constraintBuilder = view1.layout(.Left) - 10
        XCTAssertEqual(CGFloat(-10), constraintBuilder.constant)
    }

    func testSuccessiveConstantSubtraction() {
        let constraintBuilder = view1.layout(.Left) - 10 - 5
        XCTAssertEqual(CGFloat(-15), constraintBuilder.constant)
    }
}