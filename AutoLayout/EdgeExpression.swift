import UIKit

public class EdgeExpression: Expression {

    var constant: CGFloatQuad = (0, 0, 0, 0)
    var multiplier: CGFloatQuad = (1, 1, 1, 1)
}

extension EdgeExpression: MultiplierSingleExpression {

    public func setMultiplier(multiplier: CGFloat) {
        self.multiplier = (multiplier, multiplier, multiplier, multiplier)
    }
}

extension EdgeExpression: ConstantSingleExpression {

    public func setConstant(constant: CGFloat) {
        self.constant = (-constant, -constant, constant, constant)
    }
}

extension EdgeExpression: ConstantQuadExpression {

    public func setConstant(constant: CGFloatQuad) {
        self.constant = constant
    }
}

extension EdgeExpression: ConstrainableToExpression {

    typealias This = EdgeExpression

    public func constrainToExpression(expression: EdgeExpression, relation: NSLayoutRelation) -> [NSLayoutConstraint] {
        return views.flatMap { [
            NSLayoutConstraint($0, .Left, relation, expression.views.first!, .Left, expression.multiplier.1, expression.constant.1),
            NSLayoutConstraint($0, .Right, relation, expression.views.first!, .Right, expression.multiplier.3, expression.constant.3),
            NSLayoutConstraint($0, .Top, relation, expression.views.first!, .Top, expression.multiplier.0, expression.constant.0),
            NSLayoutConstraint($0, .Bottom, relation, expression.views.first!, .Bottom, expression.multiplier.2, expression.constant.2)
            ]
        }
    }
}