import UIKit

public class SizeRelation: AbstractRelation {

    public var multiplier: CGFloatPair = (1, 1)
    public var constant: CGFloatPair = (0, 0)
}

extension SizeRelation: MultiplierSingleRelation {

    public func setMultiplier(multiplier: CGFloat) {
        self.multiplier = (multiplier, multiplier)
    }
}

extension SizeRelation: MultiplierTupleRelation {

    public func setMultiplier(multiplier: CGFloatPair) {
        self.multiplier = multiplier
    }
}

extension SizeRelation: ConstantSingleRelation {

    public func setConstant(constant: CGFloat) {
        self.constant = (constant, constant)
    }
}

extension SizeRelation: ConstantTupleRelation {

    public func setConstant(constant: CGFloatPair) {
        self.constant = constant
    }
}

extension SizeRelation: ConstrainableToSize {

    public func constrainToSize(size: CGSize) -> [NSLayoutConstraint] {
        var constraints = [NSLayoutConstraint]()
        for view in views {
            constraints.append(NSLayoutConstraint(view, .Width, .Equal, nil, .NotAnAttribute, 1, size.width))
            constraints.append(NSLayoutConstraint(view, .Height, .Equal, nil, .NotAnAttribute, 1, size.height))
        }
        return constraints
    }
}

extension SizeRelation: ConstrainableToRelation {

    typealias This = SizeRelation
    
    public func constrainToRelation(relation: SizeRelation) -> [NSLayoutConstraint] {
        var constraints = [NSLayoutConstraint]()
        for lhsView in views {
            constraints.append(NSLayoutConstraint(lhsView, .Width, .Equal, relation.views.first!, .Width, relation.multiplier.0, relation.constant.0))
            constraints.append(NSLayoutConstraint(lhsView, .Height, .Equal, relation.views.first!, .Height, relation.multiplier.1, relation.constant.1))
        }
        return constraints
    }
}