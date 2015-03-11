//
//  AutoLayoutTests.swift
//  AutoLayoutTests
//
//  Created by Marc Baldwin on 10/03/2015.
//  Copyright (c) 2015 Marc Baldwin. All rights reserved.
//

import UIKit
import XCTest

class VerticalPositionTests: XCTestCase {

    let view1 = UIView()
    let view2 = UIView()
    let view3 = UIView()

    // MARK: Tests

    func testSingleViewOnLHS() {
        let constraints = view1.layout(.Top) === view2.layout(.Bottom)
        XCTAssertEqual([NSLayoutConstraint(view1, .Top, .Equal, view2, .Bottom, 1, 0)], constraints)
    }

    func testMultipleViewsOnLHS() {
        let constraints = Views(view1,view2).layout(.Top) === view3.layout(.Bottom)
        XCTAssertEqual([
            NSLayoutConstraint(view1, .Top, .Equal, view3, .Bottom, 1, 0),
            NSLayoutConstraint(view2, .Top, .Equal, view3, .Bottom, 1, 0)], constraints)
    }

    // MARK: UIView Layout Tests

    func testLayoutWithTop() {
        let constraintBuilder = view1.layout(.Top)
        XCTAssertEqual(VerticalPositionAttribute.Top, constraintBuilder.attribute)
        XCTAssertEqual([view1], constraintBuilder.views)
    }

    func testLayoutWithBottom() {
        let constraintBuilder = view1.layout(.Bottom)
        XCTAssertEqual(VerticalPositionAttribute.Bottom, constraintBuilder.attribute)
        XCTAssertEqual([view1], constraintBuilder.views)
    }

    // MARK: Array Layout Tests

    func testLayoutWithMultipleViewsBottom() {
        let constraintBuilder = Views([view1, view2]).layout(.Bottom)
        XCTAssertEqual(VerticalPositionAttribute.Bottom, constraintBuilder.attribute)
        XCTAssertEqual([view1, view2], constraintBuilder.views)
    }

    // MARK: Multiplier Tests

    func testMultiplierMultiplication() {
        let constraintBuilder = view1.layout(.Bottom) * 0.5
        XCTAssertEqual(CGFloat(0.5), constraintBuilder.multiplier)
    }

    func testSuccessiveMultiplierMultiplication() {
        let constraintBuilder = view1.layout(.Bottom) * 0.5 * 0.25
        XCTAssertEqual(CGFloat(0.125), constraintBuilder.multiplier)
    }

    func testMultiplierDivision() {
        let constraintBuilder = view1.layout(.Bottom) / 2
        XCTAssertEqual(CGFloat(0.5), constraintBuilder.multiplier)
    }

    func testSuccessiveMultiplierDivision() {
        let constraintBuilder = view1.layout(.Bottom) / 2 / 2.5
        XCTAssertEqual(CGFloat(0.2), constraintBuilder.multiplier)
    }

    // MARK: Constant Tests

    func testConstantAddition() {
        let constraintBuilder = view1.layout(.Bottom) + 10
        XCTAssertEqual(CGFloat(10), constraintBuilder.constant)
    }

    func testSuccessiveConstantAddition() {
        let constraintBuilder = view1.layout(.Bottom) + 10 + 5
        XCTAssertEqual(CGFloat(15), constraintBuilder.constant)
    }

    func testConstantSubtraction() {
        let constraintBuilder = view1.layout(.Bottom) - 10
        XCTAssertEqual(CGFloat(-10), constraintBuilder.constant)
    }

    func testSuccessiveConstantSubtraction() {
        let constraintBuilder = view1.layout(.Bottom) - 10 - 5
        XCTAssertEqual(CGFloat(-15), constraintBuilder.constant)
    }
}