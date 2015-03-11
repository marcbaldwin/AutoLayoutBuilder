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
}

//public class Builder {
//    var constraints = [NSLayoutConstraint]()
//
//    public init() {}
//}
//
//public extension Builder {
//
//    public func activateConstraints(active: Bool) {
//        for constraint in constraints {
//            constraint.active = active
//        }
//    }
//}
//
//public func += (lhs: Builder, rhs: [NSLayoutConstraint]) {
//    lhs.constraints += rhs
//}