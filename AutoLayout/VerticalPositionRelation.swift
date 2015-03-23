import UIKit

public enum VerticalPositionAttribute {
    case CenterY
    case Top
    case Bottom
}

public class VerticalPositionRelation: AbstractRelation {

    let attribute: VerticalPositionAttribute

    init(attribute: VerticalPositionAttribute, views: [UIView]) {
        self.attribute = attribute
        super.init(views: views)
    }
}

extension VerticalPositionRelation {

    var trueAttribute: NSLayoutAttribute {
        switch attribute {
        case .CenterY: return .CenterY
        case .Top: return .Top
        case .Bottom: return .Bottom
        }
    }
}

// MARK: Equality Operators

public func ==(lhs: VerticalPositionRelation, rhs: VerticalPositionRelation) -> [NSLayoutConstraint] {
    var constraints = [NSLayoutConstraint]()
    for view in lhs.views {
        constraints.append(NSLayoutConstraint(view, lhs.trueAttribute, .Equal, rhs.views.first!, rhs.trueAttribute, rhs.multiplier, rhs.constant))
    }
    return constraints
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