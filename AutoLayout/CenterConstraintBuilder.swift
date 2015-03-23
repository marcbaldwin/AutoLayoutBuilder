import UIKit

public enum CenterAttribute {
    case Center
}

public struct CenterConstraintBuilder {
    let views: [UIView]
    let attribute: CenterAttribute
    let multiplier: CGFloat
    let constant: CGFloat
}

// MARK: Equality Operators

public func ==(lhs: CenterConstraintBuilder, rhs: CenterConstraintBuilder) -> [NSLayoutConstraint] {
    var constraints = [NSLayoutConstraint]()
    for view in lhs.views {
        constraints.append(NSLayoutConstraint(view, .CenterX, .Equal, rhs.views.first!, .CenterX, rhs.multiplier, rhs.constant))
        constraints.append(NSLayoutConstraint(view, .CenterY, .Equal, rhs.views.first!, .CenterY, rhs.multiplier, rhs.constant))
    }
    return constraints
}

// MARK: Arithmetic Operators

public func *(lhs: CenterConstraintBuilder, rhs: CGFloat) -> CenterConstraintBuilder {
    return CenterConstraintBuilder(views: lhs.views, attribute: lhs.attribute, multiplier: lhs.multiplier * rhs, constant: lhs.constant)
}

public func /(lhs: CenterConstraintBuilder, rhs: CGFloat) -> CenterConstraintBuilder {
    return lhs * (1/rhs)
}

public func +(lhs: CenterConstraintBuilder, rhs: CGFloat) -> CenterConstraintBuilder {
    return CenterConstraintBuilder(views: lhs.views, attribute: lhs.attribute, multiplier: lhs.multiplier, constant: lhs.constant + rhs)
}

public func -(lhs: CenterConstraintBuilder, rhs: CGFloat) -> CenterConstraintBuilder {
    return lhs + (-rhs)
}

// MARK: Extensions

public extension UIView {

    subscript(dimensionAttribute: CenterAttribute) -> CenterConstraintBuilder {
        return CenterConstraintBuilder(views: [self], attribute: dimensionAttribute, multiplier: 1, constant: 0)
    }
}

public extension Views {

    subscript(dimensionAttribute: CenterAttribute) -> CenterConstraintBuilder {
        return CenterConstraintBuilder(views: views, attribute: dimensionAttribute, multiplier: 1, constant: 0)
    }
}