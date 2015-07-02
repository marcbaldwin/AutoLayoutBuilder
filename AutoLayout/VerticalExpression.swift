import UIKit

public class VerticalExpression: SingleExpression {

    let attribute: VerticalAttribute
    public var trueAttribute: NSLayoutAttribute { return verticalPositionToLayoutAttribute(self.attribute)}

    init(attribute: VerticalAttribute, views: [UIView]) {
        self.attribute = attribute
        super.init(views: views)
    }
}

extension VerticalExpression: ConstrainableToExpression {

    typealias This = VerticalExpression

    public func constrainToExpression(expression: VerticalExpression, relation: NSLayoutRelation) -> [NSLayoutConstraint] {
        return views.map { NSLayoutConstraint($0, self.trueAttribute, relation, expression.views.first!, expression.trueAttribute, expression.multiplier, expression.constant) }
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

// MARK: Attribute conversion

internal func verticalPositionToLayoutAttribute(attribute: VerticalAttribute) -> NSLayoutAttribute {
    switch attribute {
    case .CenterY: return .CenterY
    case .Top: return .Top
    case .Bottom: return .Bottom
    case .Baseline: return .Baseline
    case .FirstBaseline: return .FirstBaseline
    case .CenterYWithinMargins: return .CenterYWithinMargins
    case .TopMargin: return .TopMargin
    case .BottomMargin: return .BottomMargin
    }
}

// MARK: Internal

func makeVerticalPositionRelationConstraints(lhs: VerticalExpression, rhs: LayoutGuideExpression, relation: NSLayoutRelation) -> [NSLayoutConstraint] {
    return lhs.views.map { NSLayoutConstraint($0, lhs.trueAttribute, relation, rhs.layoutGuide, rhs.trueAttribute, 1, rhs.constant) }
}