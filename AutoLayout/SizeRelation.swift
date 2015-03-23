import UIKit

public enum SizeAttribute {
    case Size
}

public struct SizeRelation {
    let views: [UIView]
    let attribute: SizeAttribute
    let multiplier: CGFloat
    let constant: CGFloat
}

// MARK: Equality Operators

public func ==(lhs: SizeRelation, rhs: SizeRelation) -> [NSLayoutConstraint] {
    var constraints = [NSLayoutConstraint]()
    for view in lhs.views {
        constraints.append(NSLayoutConstraint(view, .Width, .Equal, rhs.views.first!, .Width, rhs.multiplier, rhs.constant))
        constraints.append(NSLayoutConstraint(view, .Height, .Equal, rhs.views.first!, .Height, rhs.multiplier, rhs.constant))
    }
    return constraints
}

public func ==(lhs: SizeRelation, rhs: CGSize) -> [NSLayoutConstraint] {
    var constraints = [NSLayoutConstraint]()
    for view in lhs.views {
        constraints.append(NSLayoutConstraint(view, .Width, .Equal, nil, .NotAnAttribute, 1, rhs.width))
        constraints.append(NSLayoutConstraint(view, .Height, .Equal, nil, .NotAnAttribute, 1, rhs.height))
    }
    return constraints
}

// MARK: Arithmetic Operators

public func *(lhs: SizeRelation, rhs: CGFloat) -> SizeRelation {
    return SizeRelation(views: lhs.views, attribute: lhs.attribute, multiplier: lhs.multiplier * rhs, constant: lhs.constant)
}

public func /(lhs: SizeRelation, rhs: CGFloat) -> SizeRelation {
    return lhs * (1/rhs)
}

public func +(lhs: SizeRelation, rhs: CGFloat) -> SizeRelation {
    return SizeRelation(views: lhs.views, attribute: lhs.attribute, multiplier: lhs.multiplier, constant: lhs.constant + rhs)
}

public func -(lhs: SizeRelation, rhs: CGFloat) -> SizeRelation {
    return lhs + (-rhs)
}

// MARK: Extensions

public extension UIView {

    subscript(dimensionAttribute: SizeAttribute) -> SizeRelation {
        return SizeRelation(views: [self], attribute: dimensionAttribute, multiplier: 1, constant: 0)
    }
}

public extension Views {

    subscript(dimensionAttribute: SizeAttribute) -> SizeRelation {
        return SizeRelation(views: views, attribute: dimensionAttribute, multiplier: 1, constant: 0)
    }
}