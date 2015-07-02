import UIKit

public class HorizontalRelation: AbstractSingleRelation {

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

extension HorizontalRelation: ConstrainableToRelation {

    typealias This = HorizontalRelation

    public func constrainToRelation(relation: HorizontalRelation, type: NSLayoutRelation) -> [NSLayoutConstraint] {
        var constraints = [NSLayoutConstraint]()
        for view in views {
            constraints.append(NSLayoutConstraint(view, trueAttribute, type, relation.views.first!, relation.trueAttribute, relation.multiplier, relation.constant))
        }
        return constraints
    }
}