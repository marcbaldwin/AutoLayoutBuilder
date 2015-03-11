//
//  Helper.swift
//  AutoLayout
//
//  Created by Marc Baldwin on 10/03/2015.
//  Copyright (c) 2015 Marc Baldwin. All rights reserved.
//

import UIKit
import XCTest

func assertEqual(expectedConstraint: NSLayoutConstraint, actualConstraint: NSLayoutConstraint) {
    XCTAssertEqual(expectedConstraint.firstItem as UIView, actualConstraint.firstItem as UIView)
    XCTAssertEqual(expectedConstraint.secondItem as UIView, actualConstraint.secondItem as UIView)
    XCTAssertEqual(expectedConstraint.firstAttribute, actualConstraint.firstAttribute)
    XCTAssertEqual(expectedConstraint.secondAttribute, actualConstraint.secondAttribute)
    XCTAssertEqual(expectedConstraint.multiplier, actualConstraint.multiplier)
    XCTAssertEqual(expectedConstraint.constant, actualConstraint.constant)
    XCTAssertEqual(expectedConstraint.relation, actualConstraint.relation)
}

extension NSLayoutConstraint: Equatable {}

public func ==(lhs: NSLayoutConstraint, rhs: NSLayoutConstraint) -> Bool {

    var isEqual = true

    isEqual &= lhs.firstItem.isEqual(rhs.firstItem)

    isEqual &= lhs.firstAttribute == rhs.firstAttribute
    isEqual &= lhs.secondAttribute == rhs.secondAttribute
    isEqual &= lhs.multiplier == rhs.multiplier
    isEqual &= lhs.constant == rhs.constant
    isEqual &= lhs.relation == rhs.relation

    return isEqual
}