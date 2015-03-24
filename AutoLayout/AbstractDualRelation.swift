import UIKit

public protocol DualRelation: Relation {

    var trueAttributes: (NSLayoutAttribute, NSLayoutAttribute) { get }
    var multiplier: (CGFloat, CGFloat) { get }
    var constant: (CGFloat, CGFloat) { get }
}

// MARK: Operators

public func ==<R1: DualRelation, R2: DualRelation where R1.AttributeType == R2.AttributeType>(lhs: R1, rhs: R2) -> [NSLayoutConstraint] {
    var constraints = [NSLayoutConstraint]()
    for view in lhs.views {
        constraints.append(NSLayoutConstraint(view, lhs.trueAttributes.0, .Equal, rhs.views.first!, lhs.trueAttributes.0, rhs.multiplier.0, rhs.constant.0))
        constraints.append(NSLayoutConstraint(view, lhs.trueAttributes.1, .Equal, rhs.views.first!, lhs.trueAttributes.1, rhs.multiplier.1, rhs.constant.1))
    }
    return constraints
}

// MARK: Abstract Implementation

public class AbstractDualRelation: AbstractRelation {

    public var multiplier: (CGFloat, CGFloat) = (1, 1)
    public var constant: (CGFloat, CGFloat) = (0, 0)

    public func add(constant: CGFloat) {
        self.constant = (self.constant.0 + constant, self.constant.1 + constant)
    }

    public func multiplyBy(multiplier: CGFloat) {
        self.multiplier = (self.multiplier.0 * multiplier, self.multiplier.1 * multiplier)
    }
}