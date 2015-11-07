import UIKit

public class HorizontalExpression: SingleExpression {

    let attribute: HorizontalAttribute

    init(attribute: HorizontalAttribute, views: [UIView]) {
        self.attribute = attribute
        super.init(views: views)
    }
}

extension HorizontalExpression: ConstrainableToExpression {

    public typealias This = HorizontalExpression

    public func constrainToExpression(expression: HorizontalExpression, relation: NSLayoutRelation) -> [NSLayoutConstraint] {
        return views.map {
            NSLayoutConstraint($0, self.attribute.raw, relation, expression.views.first!, expression.attribute.raw, expression.multiplier, expression.constant)
        }
    }
}