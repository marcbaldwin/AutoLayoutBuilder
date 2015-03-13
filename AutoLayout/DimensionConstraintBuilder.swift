import UIKit

public enum DimensionAttribute {
    case Width
    case Height
}

public struct DimensionConstraintBuilder {
    let views: [UIView]
    let attribute: DimensionAttribute
    let multiplier: CGFloat
    let constant: CGFloat
}

extension DimensionConstraintBuilder {

    var trueAttribute: NSLayoutAttribute {
        switch attribute {
        case .Width: return .Width
        case .Height: return .Height
        }
    }
}

// MARK: Operator Overloads

public func ==(lhs: DimensionConstraintBuilder, rhs: DimensionConstraintBuilder) -> [NSLayoutConstraint] {
    var constraints = [NSLayoutConstraint]()
    for view in lhs.views {
        constraints.append(NSLayoutConstraint(view, lhs.trueAttribute, .Equal, rhs.views.first!, rhs.trueAttribute, rhs.multiplier, rhs.constant))
    }
    return constraints
}

public func ==(lhs: DimensionConstraintBuilder, rhs: CGFloat) -> [NSLayoutConstraint] {
    var constraints = [NSLayoutConstraint]()
    for view in lhs.views {
        constraints.append(NSLayoutConstraint(view, lhs.trueAttribute, .Equal, nil, .NotAnAttribute, 1, rhs))
    }
    return constraints
}

public func *(lhs: DimensionConstraintBuilder, rhs: CGFloat) -> DimensionConstraintBuilder {
    return DimensionConstraintBuilder(views: lhs.views, attribute: lhs.attribute, multiplier: lhs.multiplier * rhs, constant: lhs.constant)
}

public func /(lhs: DimensionConstraintBuilder, rhs: CGFloat) -> DimensionConstraintBuilder {
    return lhs * (1/rhs)
}

public func +(lhs: DimensionConstraintBuilder, rhs: CGFloat) -> DimensionConstraintBuilder {
    return DimensionConstraintBuilder(views: lhs.views, attribute: lhs.attribute, multiplier: lhs.multiplier, constant: lhs.constant + rhs)
}

public func -(lhs: DimensionConstraintBuilder, rhs: CGFloat) -> DimensionConstraintBuilder {
    return lhs + (-rhs)
}

// MARK: Extensions

public extension UIView {

    subscript(dimensionAttribute: DimensionAttribute) -> DimensionConstraintBuilder {
        return DimensionConstraintBuilder(views: [self], attribute: dimensionAttribute, multiplier: 1, constant: 0)
    }
}

public extension Views {

    subscript(dimensionAttribute: DimensionAttribute) -> DimensionConstraintBuilder {
        return DimensionConstraintBuilder(views: views, attribute: dimensionAttribute, multiplier: 1, constant: 0)
    }
}