import UIKit

public enum VerticalPositionAttribute {

    case CenterY
    case Top
    case Bottom
    case Baseline
    case FirstBaseline

    case CenterYWithinMargins
    case TopMargin
    case BottomMargin
}

public class VerticalPositionRelation: AbstractSingleRelation, SingleRelation {

    typealias AttributeType = VerticalPositionAttribute
    let attribute: VerticalPositionAttribute
    public var trueAttribute: NSLayoutAttribute { return verticalPositionToLayoutAttribute(self.attribute)}

    init(attribute: VerticalPositionAttribute, views: [UIView]) {
        self.attribute = attribute
        super.init(views: views)
    }
}

// MARK: Operators

public func ==(lhs: VerticalPositionRelation, rhs: LayoutGuideRelation) -> [NSLayoutConstraint] {
    return makeVerticalPositionRelationConstraints(lhs, rhs, .Equal)
}

public func >=(lhs: VerticalPositionRelation, rhs: LayoutGuideRelation) -> [NSLayoutConstraint] {
    return makeVerticalPositionRelationConstraints(lhs, rhs, .GreaterThanOrEqual)
}

public func <=(lhs: VerticalPositionRelation, rhs: LayoutGuideRelation) -> [NSLayoutConstraint] {
    return makeVerticalPositionRelationConstraints(lhs, rhs, .LessThanOrEqual)
}

// MARK: Extensions

public extension UIView {

    subscript(verticalPosition: VerticalPositionAttribute) -> VerticalPositionRelation {
        return VerticalPositionRelation(attribute: verticalPosition, views: [self])
    }
}

public extension Group {

    subscript(verticalPosition: VerticalPositionAttribute) -> VerticalPositionRelation {
        return VerticalPositionRelation(attribute: verticalPosition, views: views)
    }
}

// MARK: Attribute conversion

internal func verticalPositionToLayoutAttribute(attribute: VerticalPositionAttribute) -> NSLayoutAttribute {
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

func makeVerticalPositionRelationConstraints(lhs: VerticalPositionRelation, rhs: LayoutGuideRelation, relation: NSLayoutRelation) -> [NSLayoutConstraint] {
    return lhs.views.map { NSLayoutConstraint($0, lhs.trueAttribute, relation, rhs.layoutGuide, rhs.trueAttribute, 1, rhs.constant) }
}