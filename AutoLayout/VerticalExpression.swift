import UIKit

public class VerticalExpression: SingleExpression {

    let attribute: VerticalAttribute

    init(attribute: VerticalAttribute, views: [UIView]) {
        self.attribute = attribute
        super.init(views: views)
    }
}

extension VerticalExpression: ConstrainableToExpression {

    typealias This = VerticalExpression

    public func constrainToExpression(expression: VerticalExpression, relation: NSLayoutRelation) -> [NSLayoutConstraint] {
        return views.map {
            NSLayoutConstraint($0, self.attribute.raw, relation, expression.views.first!, expression.attribute.raw, expression.multiplier, expression.constant)
        }
    }
}

// MARK: Operators

public func ==(lhs: VerticalExpression, rhs: LayoutGuideExpression) -> [NSLayoutConstraint] {
    return makeVerticalPositionRelationConstraints(lhs, rhs, .Equal)
}

public func >=(lhs: VerticalExpression, rhs: LayoutGuideExpression) -> [NSLayoutConstraint] {
    return makeVerticalPositionRelationConstraints(lhs, rhs, .GreaterThanOrEqual)
}

public func <=(lhs: VerticalExpression, rhs: LayoutGuideExpression) -> [NSLayoutConstraint] {
    return makeVerticalPositionRelationConstraints(lhs, rhs, .LessThanOrEqual)
}

// MARK: Internal

func makeVerticalPositionRelationConstraints(lhs: VerticalExpression, rhs: LayoutGuideExpression, relation: NSLayoutRelation) -> [NSLayoutConstraint] {
    return lhs.views.map { NSLayoutConstraint($0, lhs.attribute.raw, relation, rhs.layoutGuide, rhs.attribute.raw, 1, rhs.constant) }
}