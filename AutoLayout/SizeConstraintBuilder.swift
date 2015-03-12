//
//  Attributes.swift
//  AutoLayout
//
//  Created by Marc Baldwin on 10/03/2015.
//  Copyright (c) 2015 Marc Baldwin. All rights reserved.
//

import UIKit

public enum SizeAttribute {
    case Size
}

public struct SizeConstraintBuilder {
    let views: [UIView]
    let attribute: SizeAttribute
    let multiplier: CGFloat
    let constant: CGFloat
}

// MARK: Operator Overloads

public func ==(lhs: SizeConstraintBuilder, rhs: SizeConstraintBuilder) -> [NSLayoutConstraint] {
    var constraints = [NSLayoutConstraint]()
    for view in lhs.views {
        constraints.append(NSLayoutConstraint(view, .Width, .Equal, rhs.views.first!, .Width, rhs.multiplier, rhs.constant))
        constraints.append(NSLayoutConstraint(view, .Height, .Equal, rhs.views.first!, .Height, rhs.multiplier, rhs.constant))
    }
    return constraints
}

public func *(lhs: SizeConstraintBuilder, rhs: CGFloat) -> SizeConstraintBuilder {
    return SizeConstraintBuilder(views: lhs.views, attribute: lhs.attribute, multiplier: lhs.multiplier * rhs, constant: lhs.constant)
}

public func /(lhs: SizeConstraintBuilder, rhs: CGFloat) -> SizeConstraintBuilder {
    return lhs * (1/rhs)
}

public func +(lhs: SizeConstraintBuilder, rhs: CGFloat) -> SizeConstraintBuilder {
    return SizeConstraintBuilder(views: lhs.views, attribute: lhs.attribute, multiplier: lhs.multiplier, constant: lhs.constant + rhs)
}

public func -(lhs: SizeConstraintBuilder, rhs: CGFloat) -> SizeConstraintBuilder {
    return lhs + (-rhs)
}

// MARK: Extensions

public extension UIView {

    subscript(dimensionAttribute: SizeAttribute) -> SizeConstraintBuilder {
        return SizeConstraintBuilder(views: [self], attribute: dimensionAttribute, multiplier: 1, constant: 0)
    }
}

public extension Views {

    subscript(dimensionAttribute: SizeAttribute) -> SizeConstraintBuilder {
        return SizeConstraintBuilder(views: views, attribute: dimensionAttribute, multiplier: 1, constant: 0)
    }
}