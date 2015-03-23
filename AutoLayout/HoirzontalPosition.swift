import UIKit

public enum HorizontalPositionAttribute {
    case CenterX
    case Left
    case Right
}

public struct HorizontalPositionConstraint {
    let views: [UIView]
    let attribute: HorizontalPositionAttribute
    let multiplier: CGFloat
    let constant: CGFloat
}

extension HorizontalPositionConstraint {

    var trueAttribute: NSLayoutAttribute {
        switch attribute {
        case .CenterX: return .CenterX
        case .Left: return .Left
        case .Right: return .Right
        }
    }
}

// MARK: Equality Operators

public func ==(lhs: HorizontalPositionConstraint, rhs: HorizontalPositionConstraint) -> [NSLayoutConstraint] {
    var constraints = [NSLayoutConstraint]()
    for view in lhs.views {
        constraints.append(NSLayoutConstraint(view, lhs.trueAttribute, .Equal, rhs.views.first!, rhs.trueAttribute, rhs.multiplier, rhs.constant))
    }
    return constraints
}

// MARK: Arithmetic Operators

public func *(lhs: HorizontalPositionConstraint, rhs: CGFloat) -> HorizontalPositionConstraint {
    return HorizontalPositionConstraint(views: lhs.views, attribute: lhs.attribute, multiplier: lhs.multiplier * rhs, constant: lhs.constant)
}

public func /(lhs: HorizontalPositionConstraint, rhs: CGFloat) -> HorizontalPositionConstraint {
    return lhs * (1/rhs)
}

public func +(lhs: HorizontalPositionConstraint, rhs: CGFloat) -> HorizontalPositionConstraint {
    return HorizontalPositionConstraint(views: lhs.views, attribute: lhs.attribute, multiplier: lhs.multiplier, constant: lhs.constant + rhs)
}

public func -(lhs: HorizontalPositionConstraint, rhs: CGFloat) -> HorizontalPositionConstraint {
    return lhs + (-rhs)
}

// MARK: Extensions

public extension UIView {

    subscript(hoirzontalPosition: HorizontalPositionAttribute) -> HorizontalPositionConstraint {
        return HorizontalPositionConstraint(views: [self], attribute: hoirzontalPosition, multiplier: 1, constant: 0)
    }
}

public extension Views {

    subscript(hoirzontalPosition: HorizontalPositionAttribute) -> HorizontalPositionConstraint {
        return HorizontalPositionConstraint(views: views, attribute: hoirzontalPosition, multiplier: 1, constant: 0)
    }
}