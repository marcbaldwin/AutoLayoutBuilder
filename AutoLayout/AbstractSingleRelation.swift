import UIKit

public protocol SingleRelation: class {

    typealias AttributeType
    var views: [UIView] { get }
    var trueAttribute: NSLayoutAttribute { get }
    var multiplier: CGFloat { get }
    var constant: CGFloat { get }
}

public class AbstractSingleRelation: AbstractRelation {

    public var constant: CGFloat = 0

    override func plus(constant: CGFloat) {
        self.constant += constant
    }
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