import UIKit

public enum VerticalPositionAttribute {
    case CenterY
    case Top
    case Bottom
}

public struct VerticalPositionRelation {
    let views: [UIView]
    let attribute: VerticalPositionAttribute
    let multiplier: CGFloat
    let constant: CGFloat
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

// MARK: Arithmetic Operators

public func *(lhs: VerticalPositionRelation, rhs: CGFloat) -> VerticalPositionRelation {
    return VerticalPositionRelation(views: lhs.views, attribute: lhs.attribute, multiplier: lhs.multiplier * rhs, constant: lhs.constant)
}

public func /(lhs: VerticalPositionRelation, rhs: CGFloat) -> VerticalPositionRelation {
    return lhs * (1/rhs)
}

public func +(lhs: VerticalPositionRelation, rhs: CGFloat) -> VerticalPositionRelation {
    return VerticalPositionRelation(views: lhs.views, attribute: lhs.attribute, multiplier: lhs.multiplier, constant: lhs.constant + rhs)
}

public func -(lhs: VerticalPositionRelation, rhs: CGFloat) -> VerticalPositionRelation {
    return lhs + (-rhs)
}

// MARK: Extensions

public extension UIView {

    subscript(verticalPosition: VerticalPositionAttribute) -> VerticalPositionRelation {
        return VerticalPositionRelation(views: [self], attribute: verticalPosition, multiplier: 1, constant: 0)
    }
}

public extension Views {

    subscript(verticalPosition: VerticalPositionAttribute) -> VerticalPositionRelation {
        return VerticalPositionRelation(views: views, attribute: verticalPosition, multiplier: 1, constant: 0)
    }
}