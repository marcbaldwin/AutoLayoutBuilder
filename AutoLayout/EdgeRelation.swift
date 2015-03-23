import UIKit

public enum EdgeAttribute {
    case Edges
}

public struct EdgeRelation {
    let views: [UIView]
    let attribute: EdgeAttribute
    let multiplier: CGFloat
    let constant: CGFloat
}

// MARK: Equality Operators

public func ==(lhs: EdgeRelation, rhs: EdgeRelation) -> [NSLayoutConstraint] {
    var constraints = [NSLayoutConstraint]()
    for view in lhs.views {
        constraints.append(NSLayoutConstraint(view, .Left, .Equal, rhs.views.first!, .Left, rhs.multiplier, rhs.constant))
        constraints.append(NSLayoutConstraint(view, .Right, .Equal, rhs.views.first!, .Right, rhs.multiplier, rhs.constant))
        constraints.append(NSLayoutConstraint(view, .Top, .Equal, rhs.views.first!, .Top, rhs.multiplier, rhs.constant))
        constraints.append(NSLayoutConstraint(view, .Bottom, .Equal, rhs.views.first!, .Bottom, rhs.multiplier, rhs.constant))
    }
    return constraints
}

// MARK: Arithmetic Operators

public func *(lhs: EdgeRelation, rhs: CGFloat) -> EdgeRelation {
    return EdgeRelation(views: lhs.views, attribute: lhs.attribute, multiplier: lhs.multiplier * rhs, constant: lhs.constant)
}

public func /(lhs: EdgeRelation, rhs: CGFloat) -> EdgeRelation {
    return lhs * (1/rhs)
}

public func +(lhs: EdgeRelation, rhs: CGFloat) -> EdgeRelation {
    return EdgeRelation(views: lhs.views, attribute: lhs.attribute, multiplier: lhs.multiplier, constant: lhs.constant + rhs)
}

public func -(lhs: EdgeRelation, rhs: CGFloat) -> EdgeRelation {
    return lhs + (-rhs)
}

// MARK: Extensions

public extension UIView {

    subscript(dimensionAttribute: EdgeAttribute) -> EdgeRelation {
        return EdgeRelation(views: [self], attribute: dimensionAttribute, multiplier: 1, constant: 0)
    }
}

public extension Views {

    subscript(dimensionAttribute: EdgeAttribute) -> EdgeRelation {
        return EdgeRelation(views: views, attribute: dimensionAttribute, multiplier: 1, constant: 0)
    }
}