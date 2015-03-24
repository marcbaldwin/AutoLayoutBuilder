import UIKit

public protocol SingleRelation: Relation {

    var trueAttribute: NSLayoutAttribute { get }
    var multiplier: CGFloat { get }
    var constant: CGFloat { get }
}

// MARK: Operators

public func ==<R1: SingleRelation, R2: SingleRelation where R1.AttributeType == R2.AttributeType>(lhs: R1, rhs: R2) -> [NSLayoutConstraint] {
    return makeSingleRelationConstraints(lhs, rhs, .Equal)
}

public func >=<R1: SingleRelation, R2: SingleRelation where R1.AttributeType == R2.AttributeType>(lhs: R1, rhs: R2) -> [NSLayoutConstraint] {
    return makeSingleRelationConstraints(lhs, rhs, .GreaterThanOrEqual)
}

public func <=<R1: SingleRelation, R2: SingleRelation where R1.AttributeType == R2.AttributeType>(lhs: R1, rhs: R2) -> [NSLayoutConstraint] {
    return makeSingleRelationConstraints(lhs, rhs, .LessThanOrEqual)
}

// MARK: Internal Helper Functions

internal func makeSingleRelationConstraints<
    R1: SingleRelation, R2: SingleRelation
    where R1.AttributeType == R2.AttributeType>
    (lhs: R1, rhs: R2, relation: NSLayoutRelation) -> [NSLayoutConstraint] {
        return lhs.views.map { NSLayoutConstraint($0, lhs.trueAttribute, relation, rhs.views.first!, rhs.trueAttribute, rhs.multiplier, rhs.constant) }
}

// Abstract Implementation

public class AbstractSingleRelation: AbstractRelation {

    public var multiplier: CGFloat = 1
    public var constant: CGFloat = 0

    public func add(constant: CGFloat) {
        self.constant += constant
    }

    public func multiplyBy(multiplier: CGFloat) {
        self.multiplier *= multiplier
    }
}