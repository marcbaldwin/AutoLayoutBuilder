import UIKit

public class HorizontalPositionRelation: AbstractSingleRelation, SingleRelation {

    typealias AttributeType = HorizontalPositionAttribute
    let attribute: HorizontalPositionAttribute
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