import UIKit

public enum HorizontalPositionAttribute {
    case CenterX
    case CenterXWithinMargins
    case Left
    case LeftMargin
    case Right
    case RightMargin
    case Leading
    case LeadingMargin
    case Trailing
    case TrailingMargin
}

public class HorizontalPositionRelation: AbstractSingleRelation, SingleRelation {

    typealias AttributeType = HorizontalPositionAttribute
    let attribute: HorizontalPositionAttribute
    public var trueAttribute: NSLayoutAttribute {
        switch attribute {
        case .CenterX: return .CenterX
        case .CenterXWithinMargins: return .CenterXWithinMargins
        case .Left: return .Left
        case .LeftMargin: return .LeftMargin
        case .Right: return .Right
        case .RightMargin: return .RightMargin
        case .Leading: return .Leading
        case .LeadingMargin: return .LeadingMargin
        case .Trailing: return .Trailing
        case .TrailingMargin: return .TrailingMargin
        }
    }

    init(attribute: HorizontalPositionAttribute, views: [UIView]) {
        self.attribute = attribute
        super.init(views: views)
    }
}

// MARK: Extensions

public extension UIView {

    subscript(hoirzontalPosition: HorizontalPositionAttribute) -> HorizontalPositionRelation {
        return HorizontalPositionRelation(attribute: hoirzontalPosition, views: [self])
    }
}

public extension Group {

    subscript(hoirzontalPosition: HorizontalPositionAttribute) -> HorizontalPositionRelation {
        return HorizontalPositionRelation(attribute: hoirzontalPosition, views: views)
    }
}