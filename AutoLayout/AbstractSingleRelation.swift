import UIKit

public class AbstractSingleRelation: AbstractRelation {

    var trueAttribute: NSLayoutAttribute { return .NotAnAttribute }
}

// MARK: Operators

public func ==(lhs: AbstractSingleRelation, rhs: AbstractSingleRelation) -> [NSLayoutConstraint] { return makeSingleRelationConstraints(lhs, rhs, .Equal) }

public func >=(lhs: AbstractSingleRelation, rhs: AbstractSingleRelation) -> [NSLayoutConstraint] { return makeSingleRelationConstraints(lhs, rhs, .GreaterThanOrEqual) }

public func <=(lhs: AbstractSingleRelation, rhs: AbstractSingleRelation) -> [NSLayoutConstraint] { return makeSingleRelationConstraints(lhs, rhs, .LessThanOrEqual) }

// MARK: Internal Helper Functions

internal func makeSingleRelationConstraints(lhs: AbstractSingleRelation, rhs: AbstractSingleRelation, relation: NSLayoutRelation) -> [NSLayoutConstraint] {
    return lhs.views.map { NSLayoutConstraint($0, lhs.trueAttribute, relation, rhs.views.first!, rhs.trueAttribute, rhs.multiplier, rhs.constant) }
}