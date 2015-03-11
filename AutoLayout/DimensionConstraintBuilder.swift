//
//  Attributes.swift
//  AutoLayout
//
//  Created by Marc Baldwin on 10/03/2015.
//  Copyright (c) 2015 Marc Baldwin. All rights reserved.
//

import UIKit

public enum DimensionAttribute {
    case Width
    case Height
}

public struct DimensionConstraintBuilder {
    let views: [UIView]
    let attribute: DimensionAttribute
    let multiplier: CGFloat
    let constant: CGFloat
}

public extension DimensionConstraintBuilder {

    var trueAttribute: NSLayoutAttribute {
        switch attribute {
        case .Width: return .Width
        case .Height: return .Height
        }
    }
}

// MARK: Operator Overload

public func ===(lhs: DimensionConstraintBuilder, rhs: DimensionConstraintBuilder) -> [NSLayoutConstraint] {
    var constraints = [NSLayoutConstraint]()

    let constraint = NSLayoutConstraint(
        item: lhs.views.first!, attribute: lhs.trueAttribute,
        relatedBy: .Equal,
        toItem: rhs.views.first!, attribute: rhs.trueAttribute,
        multiplier: rhs.multiplier, constant: rhs.constant)

    constraints.append(constraint)
    return constraints
}

public func *(lhs: DimensionConstraintBuilder, rhs: CGFloat) -> DimensionConstraintBuilder {
    return DimensionConstraintBuilder(views: lhs.views, attribute: lhs.attribute, multiplier: lhs.multiplier * rhs, constant: lhs.constant)
}

public func /(lhs: DimensionConstraintBuilder, rhs: CGFloat) -> DimensionConstraintBuilder {
    return lhs * (1/rhs)
}

public func +(lhs: DimensionConstraintBuilder, rhs: CGFloat) -> DimensionConstraintBuilder {
    return DimensionConstraintBuilder(views: lhs.views, attribute: lhs.attribute, multiplier: lhs.multiplier, constant: lhs.constant + rhs)
}

public func -(lhs: DimensionConstraintBuilder, rhs: CGFloat) -> DimensionConstraintBuilder {
    return lhs + (-rhs)
}

// MARK: UIKit Extensions

public extension UIView {

    func layout(dimensionAttribute: DimensionAttribute) -> DimensionConstraintBuilder {
        return DimensionConstraintBuilder(views: [self], attribute: dimensionAttribute, multiplier: 1, constant: 0)
    }
}

// MARK: Array Extensions

extension Array {

    func layout(dimensionAttribute: DimensionAttribute) -> DimensionConstraintBuilder {
        var views = [UIView]()
        for e in self {
            if let view = e as? UIView {
                views.append(view)
            }
        }
        return DimensionConstraintBuilder(views: views, attribute: dimensionAttribute, multiplier: 1, constant: 0)
    }
}