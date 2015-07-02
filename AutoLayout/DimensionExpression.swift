import UIKit

public class DimensionExpression: SingleExpression {

    let attribute: DimensionAttribute

    init(attribute: DimensionAttribute, views: [UIView]) {
        self.attribute = attribute
        super.init(views: views)
    }

    private var trueAttribute: NSLayoutAttribute {
        switch attribute {
        case .Width: return .Width
        case .Height: return .Height
        }
    }
}

extension DimensionExpression: ConstrainableToValue {

    public func constrainToValue(value: CGFloat, relation: NSLayoutRelation) -> [NSLayoutConstraint] {
        return views.map { NSLayoutConstraint($0, self.trueAttribute, relation, nil, .NotAnAttribute, 1, value) }
    }
}

extension DimensionExpression: ConstrainableToExpression {

    typealias This = DimensionExpression

    public func constrainToExpression(expression: DimensionExpression, relation: NSLayoutRelation) -> [NSLayoutConstraint] {
        return views.map { NSLayoutConstraint($0, self.trueAttribute, relation, expression.views.first!, expression.trueAttribute, expression.multiplier, expression.constant) }
    }
}