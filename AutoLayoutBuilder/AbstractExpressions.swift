import UIKit

public class Expression {

    public var views: [UIView]

    init(views: [UIView]) {
        self.views = views
    }
}

// MARK: Single

public class SingleExpression: Expression {

    public var multiplier: CGFloat = 1
    public var constant: CGFloat = 0
}

extension SingleExpression: ConstantSingleExpression {

    public func setConstant(constant: CGFloat) {
        self.constant = constant
    }
}

extension SingleExpression: MultiplierSingleExpression {

    public func setMultiplier(multiplier: CGFloat) {
        self.multiplier = multiplier
    }
}


// MARK: Dual

public class DualExpression: Expression {

    public var multiplier: CGFloatPair = (1, 1)
    public var constant: CGFloatPair = (0, 0)
}

extension DualExpression: MultiplierSingleExpression {

    public func setMultiplier(multiplier: CGFloat) {
        self.multiplier = (multiplier, multiplier)
    }
}

extension DualExpression: MultiplierTupleExpression {

    public func setMultiplier(multiplier: CGFloatPair) {
        self.multiplier = multiplier
    }
}

extension DualExpression: ConstantSingleExpression {

    public func setConstant(constant: CGFloat) {
        self.constant = (constant, constant)
    }
}

extension DualExpression: ConstantTupleExpression {

    public func setConstant(constant: CGFloatPair) {
        self.constant = constant
    }
}