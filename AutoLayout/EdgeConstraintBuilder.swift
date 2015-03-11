//
//  Attributes.swift
//  AutoLayout
//
//  Created by Marc Baldwin on 10/03/2015.
//  Copyright (c) 2015 Marc Baldwin. All rights reserved.
//

import UIKit

public enum EdgeAttribute {
    case Edges
}

public struct EdgeConstraintBuilder {
    let views: [UIView]
    let attribute: EdgeAttribute
    let multiplier: CGFloat
    let constant: CGFloat
}

// MARK: Operator Overloads

public func ===(lhs: EdgeConstraintBuilder, rhs: EdgeConstraintBuilder) -> [NSLayoutConstraint] {
    var constraints = [NSLayoutConstraint]()
    for view in lhs.views {
        constraints.append(NSLayoutConstraint(view, .Left, .Equal, rhs.views.first!, .Left, rhs.multiplier, rhs.constant))
        constraints.append(NSLayoutConstraint(view, .Right, .Equal, rhs.views.first!, .Right, rhs.multiplier, rhs.constant))
        constraints.append(NSLayoutConstraint(view, .Top, .Equal, rhs.views.first!, .Top, rhs.multiplier, rhs.constant))
        constraints.append(NSLayoutConstraint(view, .Bottom, .Equal, rhs.views.first!, .Bottom, rhs.multiplier, rhs.constant))
    }
    return constraints
}

public func *(lhs: EdgeConstraintBuilder, rhs: CGFloat) -> EdgeConstraintBuilder {
    return EdgeConstraintBuilder(views: lhs.views, attribute: lhs.attribute, multiplier: lhs.multiplier * rhs, constant: lhs.constant)
}

public func /(lhs: EdgeConstraintBuilder, rhs: CGFloat) -> EdgeConstraintBuilder {
    return lhs * (1/rhs)
}

public func +(lhs: EdgeConstraintBuilder, rhs: CGFloat) -> EdgeConstraintBuilder {
    return EdgeConstraintBuilder(views: lhs.views, attribute: lhs.attribute, multiplier: lhs.multiplier, constant: lhs.constant + rhs)
}

public func -(lhs: EdgeConstraintBuilder, rhs: CGFloat) -> EdgeConstraintBuilder {
    return lhs + (-rhs)
}

// MARK: Extensions

public extension UIView {

    public func layout(dimensionAttribute: EdgeAttribute) -> EdgeConstraintBuilder {
        return EdgeConstraintBuilder(views: [self], attribute: dimensionAttribute, multiplier: 1, constant: 0)
    }
}

public extension Views {

    public func layout(dimensionAttribute: EdgeAttribute) -> EdgeConstraintBuilder {
        return EdgeConstraintBuilder(views: views, attribute: dimensionAttribute, multiplier: 1, constant: 0)
    }
}