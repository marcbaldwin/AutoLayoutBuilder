import UIKit

public class AbstractRelation {

    public var views: [UIView]

    init(views: [UIView]) {
        self.views = views
    }
}

// MARK: Single

public class AbstractSingleRelationA: AbstractRelation {

    public var multiplier: CGFloat = 1
    public var constant: CGFloat = 0
}

extension AbstractSingleRelationA: ConstantSingleRelation {

    public func setConstant(constant: CGFloat) {
        self.constant = constant
    }
}

extension AbstractSingleRelationA: MultiplierSingleRelation {

    public func setMultiplier(multiplier: CGFloat) {
        self.multiplier = multiplier
    }
}


// MARK: Dual

public class AbstractDualRelation: AbstractRelation {

    public var multiplier: CGFloatPair = (1, 1)
    public var constant: CGFloatPair = (0, 0)
}

extension AbstractDualRelation: MultiplierSingleRelation {

    public func setMultiplier(multiplier: CGFloat) {
        self.multiplier = (multiplier, multiplier)
    }
}

extension AbstractDualRelation: MultiplierTupleRelation {

    public func setMultiplier(multiplier: CGFloatPair) {
        self.multiplier = multiplier
    }
}

extension AbstractDualRelation: ConstantSingleRelation {

    public func setConstant(constant: CGFloat) {
        self.constant = (constant, constant)
    }
}

extension AbstractDualRelation: ConstantTupleRelation {

    public func setConstant(constant: CGFloatPair) {
        self.constant = constant
    }
}