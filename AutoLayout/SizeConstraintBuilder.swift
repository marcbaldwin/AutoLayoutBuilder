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

public func ===(lhs: SizeConstraintBuilder, rhs: SizeConstraintBuilder) -> [NSLayoutConstraint] {
    var constraints = [NSLayoutConstraint]()

    let widthConstraint = NSLayoutConstraint(
        item: lhs.views.first!, attribute: .Width,
        relatedBy: .Equal,
        toItem: rhs.views.first!, attribute: .Width,
        multiplier: rhs.multiplier, constant: rhs.constant)

    let heightConstraint = NSLayoutConstraint(
        item: lhs.views.first!, attribute: .Height,
        relatedBy: .Equal,
        toItem: rhs.views.first!, attribute: .Height,
        multiplier: rhs.multiplier, constant: rhs.constant)

    constraints.append(widthConstraint)
    constraints.append(heightConstraint)
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

    public func layout(dimensionAttribute: SizeAttribute) -> SizeConstraintBuilder {
        return SizeConstraintBuilder(views: [self], attribute: dimensionAttribute, multiplier: 1, constant: 0)
    }
}

public extension Views {

    public func layout(dimensionAttribute: SizeAttribute) -> SizeConstraintBuilder {
        return SizeConstraintBuilder(views: views, attribute: dimensionAttribute, multiplier: 1, constant: 0)
    }
}