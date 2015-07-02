import UIKit

public class HorizontalExpression: SingleExpression {

    let attribute: HorizontalAttribute

    public var trueAttribute: NSLayoutAttribute {
        switch attribute {
        case .CenterX: return .CenterX
        case .Left: return .Left
        case .Right: return .Right
        case .Leading: return .Leading
        case .Trailing: return .Trailing
        case .CenterXWithinMargins: return .CenterXWithinMargins
        case .LeftMargin: return .LeftMargin
        case .RightMargin: return .RightMargin
        case .LeadingMargin: return .LeadingMargin
        case .TrailingMargin: return .TrailingMargin
        }
    }

    init(attribute: HorizontalAttribute, views: [UIView]) {
        self.attribute = attribute
        super.init(views: views)
    }
}

extension HorizontalExpression: ConstrainableToExpression {

    typealias This = HorizontalExpression

    public func constrainToExpression(expression: HorizontalExpression, relation: NSLayoutRelation) -> [NSLayoutConstraint] {
        return views.map { NSLayoutConstraint($0, self.trueAttribute, relation, expression.views.first!, expression.trueAttribute, expression.multiplier, expression.constant) }
    }
}