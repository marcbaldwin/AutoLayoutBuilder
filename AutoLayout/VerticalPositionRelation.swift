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
    public var trueAttribute: NSLayoutAttribute {
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

    init(attribute: VerticalPositionAttribute, views: [UIView]) {
        self.attribute = attribute
        super.init(views: views)
    }
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