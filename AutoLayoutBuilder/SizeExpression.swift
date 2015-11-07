import UIKit

public class SizeExpression: DualExpression { }

extension SizeExpression: ConstrainableToSize {

    public func constrainToSize(size: CGSize) -> [NSLayoutConstraint] {
        return views.flatMap { [
            NSLayoutConstraint($0, .Width, .Equal, nil, .NotAnAttribute, 1, size.width),
            NSLayoutConstraint($0, .Height, .Equal, nil, .NotAnAttribute, 1, size.height)
            ]
        }
    }
}

extension SizeExpression: ConstrainableToExpression {

    public typealias This = SizeExpression
    
    public func constrainToExpression(expression: SizeExpression, relation: NSLayoutRelation) -> [NSLayoutConstraint] {
        return views.flatMap { [
            NSLayoutConstraint($0, .Width, relation, expression.views.first!, .Width, expression.multiplier.0, expression.constant.0),
            NSLayoutConstraint($0, .Height, relation, expression.views.first!, .Height, expression.multiplier.1, expression.constant.1)
            ]
        }
    }
}