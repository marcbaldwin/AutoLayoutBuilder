import UIKit

public class CenterExpression: DualExpression { }

extension CenterExpression: ConstrainableToExpression {

    public typealias This = CenterExpression

    public func constrainToExpression(expression: CenterExpression, relation: NSLayoutRelation) -> [NSLayoutConstraint] {
        return views.flatMap { [
            NSLayoutConstraint($0, .CenterX, relation, expression.views.first!, .CenterX, expression.multiplier.0, expression.constant.0),
            NSLayoutConstraint($0, .CenterY, relation, expression.views.first!, .CenterY, expression.multiplier.1, expression.constant.1)
            ]
        }
    }
}