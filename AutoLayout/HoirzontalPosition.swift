//
//  Attributes.swift
//  AutoLayout
//
//  Created by Marc Baldwin on 10/03/2015.
//  Copyright (c) 2015 Marc Baldwin. All rights reserved.
//

import UIKit

// MARK: Horizontal Position Attribute

enum HorizontalPositionAttribute {
    case Center
    case Left
    case Right
}

// MARK:

struct HorizontalPositionConstraint {
    let views: [UIView]
    let attribute: HorizontalPositionAttribute
    let multiplier: CGFloat
    let constant: CGFloat
}

extension HorizontalPositionConstraint {

    var trueAttribute: NSLayoutAttribute {
        switch attribute {
        case .Center: return .CenterX
        case .Left: return .Left
        case .Right: return .Right
        }
    }
}

// MARK: Operator Overload

func ===(lhs: HorizontalPositionConstraint, rhs: HorizontalPositionConstraint) -> [NSLayoutConstraint] {
    var constraints = [NSLayoutConstraint]()

    let constraint = NSLayoutConstraint(
        item: lhs.views.first!, attribute: lhs.trueAttribute,
        relatedBy: .Equal,
        toItem: rhs.views.first!, attribute: rhs.trueAttribute,
        multiplier: rhs.multiplier, constant: rhs.constant)

    constraints.append(constraint)
    return constraints
}

func *(lhs: HorizontalPositionConstraint, rhs: CGFloat) -> HorizontalPositionConstraint {
    return HorizontalPositionConstraint(views: lhs.views, attribute: lhs.attribute, multiplier: lhs.multiplier * rhs, constant: lhs.constant)
}

func /(lhs: HorizontalPositionConstraint, rhs: CGFloat) -> HorizontalPositionConstraint {
    return lhs * (1/rhs)
}

func +(lhs: HorizontalPositionConstraint, rhs: CGFloat) -> HorizontalPositionConstraint {
    return HorizontalPositionConstraint(views: lhs.views, attribute: lhs.attribute, multiplier: lhs.multiplier, constant: lhs.constant + rhs)
}

func -(lhs: HorizontalPositionConstraint, rhs: CGFloat) -> HorizontalPositionConstraint {
    return lhs + (-rhs)
}

// MARK: UIKit Extensions

extension UIView {

    func layout(hoirzontalPosition: HorizontalPositionAttribute) -> HorizontalPositionConstraint {
        return HorizontalPositionConstraint(views: [self], attribute: hoirzontalPosition, multiplier: 1, constant: 0)
    }
}

// MARK: Array Extensions

extension Array {

    func layout(hoirzontalPosition: HorizontalPositionAttribute) -> HorizontalPositionConstraint {
        var views = [UIView]()
        for e in self {
            if let view = e as? UIView {
                views.append(view)
            }
        }
        return HorizontalPositionConstraint(views: views, attribute: hoirzontalPosition, multiplier: 1, constant: 0)
    }
}