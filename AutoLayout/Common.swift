//
//  Common.swift
//  AutoLayout
//
//  Created by Marc Baldwin on 11/03/2015.
//  Copyright (c) 2015 Marc Baldwin. All rights reserved.
//

import UIKit

public struct Views {
    let views: [UIView]

    public init(_ views: [UIView]) {
        self.views = views
    }

    public init(_ views: UIView...) {
        self.views = views
    }
}

public class Builder {
    var constraints = [NSLayoutConstraint]()

    public init() {}
}

public extension Builder {

    public func activateConstraints(active: Bool) {
        for constraint in constraints {
            constraint.active = active
        }
    }
}

public func += (lhs: Builder, rhs: [NSLayoutConstraint]) {
    lhs.constraints += rhs
}

extension NSLayoutConstraint {

    convenience init(_ view1: AnyObject, _ attr1: NSLayoutAttribute, _ relation: NSLayoutRelation, _ view2: AnyObject?, _ attr2: NSLayoutAttribute, _ multiplier: CGFloat, _ c: CGFloat) {
        self.init(item: view1, attribute: attr1, relatedBy: relation, toItem: view2, attribute: attr2, multiplier: multiplier, constant: c)
    }
}

public func equalHeights(views: UIView...) -> [NSLayoutConstraint] {
    let firstView = views.first!
    var constraints = [NSLayoutConstraint]()
    for view in views[1..<views.count] {
        constraints.append(NSLayoutConstraint(firstView, .Height, .Equal, view, .Height, 1, 0))
    }
    return constraints
}

public func activate(constraints: [NSLayoutConstraint]) {
    for constraint in constraints {
        constraint.active = true
    }
}