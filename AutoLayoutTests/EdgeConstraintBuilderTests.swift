//
//  AutoLayoutTests.swift
//  AutoLayoutTests
//
//  Created by Marc Baldwin on 10/03/2015.
//  Copyright (c) 2015 Marc Baldwin. All rights reserved.
//

import UIKit
import XCTest

class EdgeConstraintBuilderTests: XCTestCase {

    let view1 = UIView()
    let view2 = UIView()
    let view3 = UIView()

    // MARK: Tests

    func testSingleViewOnLHS() {
        let constraints = view1.layout(.Edges) == view2.layout(.Edges)
        XCTAssertEqual([
            NSLayoutConstraint(view1, .Left, .Equal, view2, .Left, 1, 0),
            NSLayoutConstraint(view1, .Right, .Equal, view2, .Right, 1, 0),
            NSLayoutConstraint(view1, .Top, .Equal, view2, .Top, 1, 0),
            NSLayoutConstraint(view1, .Bottom, .Equal, view2, .Bottom, 1, 0)], constraints)
    }

    func testMultipleViewsOnLHS() {
        let constraints = Views(view1,view2).layout(.Edges) == view3.layout(.Edges)
        XCTAssertEqual([
            NSLayoutConstraint(view1, .Left, .Equal, view3, .Left, 1, 0),
            NSLayoutConstraint(view1, .Right, .Equal, view3, .Right, 1, 0),
            NSLayoutConstraint(view1, .Top, .Equal, view3, .Top, 1, 0),
            NSLayoutConstraint(view1, .Bottom, .Equal, view3, .Bottom, 1, 0),
            NSLayoutConstraint(view2, .Left, .Equal, view3, .Left, 1, 0),
            NSLayoutConstraint(view2, .Right, .Equal, view3, .Right, 1, 0),
            NSLayoutConstraint(view2, .Top, .Equal, view3, .Top, 1, 0),
            NSLayoutConstraint(view2, .Bottom, .Equal, view3, .Bottom, 1, 0)], constraints)
    }

    // MARK: UIView Layout Tests

    func testLayoutWithWidth() {
        let constraintBuilder = view1.layout(.Edges)
        XCTAssertEqual(EdgeAttribute.Edges, constraintBuilder.attribute)
        XCTAssertEqual([view1], constraintBuilder.views)
    }

    // MARK: Array Layout Tests

    func testLayoutWithMultipleViewsWidth() {
        let constraintBuilder = Views([view1, view2]).layout(.Edges)
        XCTAssertEqual(EdgeAttribute.Edges, constraintBuilder.attribute)
        XCTAssertEqual([view1, view2], constraintBuilder.views)
    }

    // MARK: Multiplier Tests

    func testMultiplierMultiplication() {
        let constraintBuilder = view1.layout(.Edges) * 0.5
        XCTAssertEqual(CGFloat(0.5), constraintBuilder.multiplier)
    }

    func testSuccessiveMultiplierMultiplication() {
        let constraintBuilder = view1.layout(.Edges) * 0.5 * 0.25
        XCTAssertEqual(CGFloat(0.125), constraintBuilder.multiplier)
    }

    func testMultiplierDivision() {
        let constraintBuilder = view1.layout(.Edges) / 2
        XCTAssertEqual(CGFloat(0.5), constraintBuilder.multiplier)
    }

    func testSuccessiveMultiplierDivision() {
        let constraintBuilder = view1.layout(.Edges) / 2 / 2.5
        XCTAssertEqual(CGFloat(0.2), constraintBuilder.multiplier)
    }

    // MARK: Constant Tests

    func testConstantAddition() {
        let constraintBuilder = view1.layout(.Edges) + 10
        XCTAssertEqual(CGFloat(10), constraintBuilder.constant)
    }

    func testSuccessiveConstantAddition() {
        let constraintBuilder = view1.layout(.Edges) + 10 + 5
        XCTAssertEqual(CGFloat(15), constraintBuilder.constant)
    }

    func testConstantSubtraction() {
        let constraintBuilder = view1.layout(.Edges) - 10
        XCTAssertEqual(CGFloat(-10), constraintBuilder.constant)
    }

    func testSuccessiveConstantSubtraction() {
        let constraintBuilder = view1.layout(.Edges) - 10 - 5
        XCTAssertEqual(CGFloat(-15), constraintBuilder.constant)
    }
}