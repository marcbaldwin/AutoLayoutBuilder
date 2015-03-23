import UIKit

public class AbstractSingleRelation: AbstractRelation {

    var trueAttribute: NSLayoutAttribute { return .NotAnAttribute }
}

// MARK: Equality Operators

public func ==(lhs: AbstractSingleRelation, rhs: CGFloat) -> [NSLayoutConstraint] {
    var constraints = [NSLayoutConstraint]()
    for view in lhs.views {
        constraints.append(NSLayoutConstraint(view, lhs.trueAttribute, .Equal, nil, .NotAnAttribute, 1, rhs))
    }
    return constraints
}

public func ==(lhs: AbstractSingleRelation, rhs: AbstractSingleRelation) -> [NSLayoutConstraint] { return makeSingleRelationConstraints(lhs, rhs, .Equal) }

// MARK: Inequality Operators

public func >=(lhs: AbstractSingleRelation, rhs: AbstractSingleRelation) -> [NSLayoutConstraint] { return makeSingleRelationConstraints(lhs, rhs, .GreaterThanOrEqual) }

public func <=(lhs: AbstractSingleRelation, rhs: AbstractSingleRelation) -> [NSLayoutConstraint] { return makeSingleRelationConstraints(lhs, rhs, .LessThanOrEqual) }

internal func makeSingleRelationConstraints(lhs: AbstractSingleRelation, rhs: AbstractSingleRelation, relation: NSLayoutRelation) -> [NSLayoutConstraint] {
    return lhs.views.map { NSLayoutConstraint($0, lhs.trueAttribute, relation, rhs.views.first!, rhs.trueAttribute, rhs.multiplier, rhs.constant) }
}