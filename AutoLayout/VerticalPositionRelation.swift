import UIKit

public enum VerticalPositionAttribute {
    case CenterY
    case Top
    case Bottom
}

public class VerticalPositionRelation: AbstractSingleRelation, SingleRelation {

    typealias AttributeType = VerticalPositionAttribute
    let attribute: VerticalPositionAttribute
    public var trueAttribute: NSLayoutAttribute {
        switch attribute {
        case .CenterY: return .CenterY
        case .Top: return .Top
        case .Bottom: return .Bottom
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

public extension Views {

    subscript(verticalPosition: VerticalPositionAttribute) -> VerticalPositionRelation {
        return VerticalPositionRelation(attribute: verticalPosition, views: views)
    }
}