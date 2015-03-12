//
//  StackLayoutBuilder.swift
//  AutoLayout
//
//  Created by Marc Baldwin on 12/03/2015.
//  Copyright (c) 2015 Marc Baldwin. All rights reserved.
//

import UIKit

public enum StackDirection {
    case Vertical
}

public class StackBuilder {
    var views: [UIView]
    var constants: [CGFloat]
    public init(views: UIView...) {
        self.views = views
        self.constants = [0]
    }
}

infix operator ~ { associativity left precedence 100 }

public func ~(lhs: StackDirection, rhs: StackBuilder) -> [NSLayoutConstraint] {
    var constraints = [NSLayoutConstraint]()
    let views = rhs.views

    for i in 1..<views.count {
        constraints.append(NSLayoutConstraint(views[i], .Top, .Equal, views[i-1], .Bottom, 1, rhs.constants[i-1]))
    }
    return constraints
}

public func |(lhs: UIView, rhs: UIView) -> StackBuilder {
    return StackBuilder(views: lhs, rhs)
}

public func |(lhs: StackBuilder, rhs: UIView) -> StackBuilder {
    lhs.views.append(rhs)
    if lhs.constants.count < lhs.views.count-1 {
        lhs.constants.append(0)
    }
    return lhs
}

public func |(lhs: StackBuilder, rhs: CGFloat) -> StackBuilder {
    lhs.constants.append(rhs)
    return lhs
}

public func |(lhs: UIView, rhs: CGFloat) -> StackBuilder {
    let stackBuilder = StackBuilder(views: lhs)
    stackBuilder.constants[stackBuilder.constants.count-1] = rhs
    return stackBuilder
}