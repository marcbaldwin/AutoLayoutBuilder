import UIKit

public enum DimensionAttribute {
    case Width
    case Height
}

public struct DimensionRelation {
    let views: [UIView]
    let attribute: DimensionAttribute
    let multiplier: CGFloat
    let constant: CGFloat
}

extension DimensionRelation {

    var trueAttribute: NSLayoutAttribute {
        switch attribute {
        case .Width: return .Width
        case .Height: return .Height
        }
    }
}

// MARK: Equality Operators

public func ==(lhs: DimensionRelation, rhs: CGFloat) -> [NSLayoutConstraint] {
    var constraints = [NSLayoutConstraint]()
    for view in lhs.views {
        constraints.append(NSLayoutConstraint(view, lhs.trueAttribute, .Equal, nil, .NotAnAttribute, 1, rhs))
    }
    return constraints
}

public func ==(lhs: DimensionRelation, rhs: DimensionRelation) -> [NSLayoutConstraint] { return makeDimensionRelationConstraints(lhs, rhs, .Equal) }

// MARK: Inequality Operators

public func >=(lhs: DimensionRelation, rhs: DimensionRelation) -> [NSLayoutConstraint] { return makeDimensionRelationConstraints(lhs, rhs, .GreaterThanOrEqual) }

public func <=(lhs: DimensionRelation, rhs: DimensionRelation) -> [NSLayoutConstraint] { return makeDimensionRelationConstraints(lhs, rhs, .LessThanOrEqual) }

// MARK: Arithmetic Operators

public func *(lhs: DimensionRelation, rhs: CGFloat) -> DimensionRelation {
    return DimensionRelation(views: lhs.views, attribute: lhs.attribute, multiplier: lhs.multiplier * rhs, constant: lhs.constant)
}

public func /(lhs: DimensionRelation, rhs: CGFloat) -> DimensionRelation {
    return lhs * (1/rhs)
}

public func +(lhs: DimensionRelation, rhs: CGFloat) -> DimensionRelation {
    return DimensionRelation(views: lhs.views, attribute: lhs.attribute, multiplier: lhs.multiplier, constant: lhs.constant + rhs)
}

public func -(lhs: DimensionRelation, rhs: CGFloat) -> DimensionRelation {
    return lhs + (-rhs)
}

internal func makeDimensionRelationConstraints(lhs: DimensionRelation, rhs: DimensionRelation, relation: NSLayoutRelation) -> [NSLayoutConstraint] {
    var constraints = [NSLayoutConstraint]()
    for view in lhs.views {
        constraints.append(NSLayoutConstraint(view, lhs.trueAttribute, relation, rhs.views.first!, rhs.trueAttribute, rhs.multiplier, rhs.constant))
    }
    return constraints
}

// MARK: Extensions

public extension UIView {

    subscript(dimensionAttribute: DimensionAttribute) -> DimensionRelation {
        return DimensionRelation(views: [self], attribute: dimensionAttribute, multiplier: 1, constant: 0)
    }
}

public extension Views {

    subscript(dimensionAttribute: DimensionAttribute) -> DimensionRelation {
        return DimensionRelation(views: views, attribute: dimensionAttribute, multiplier: 1, constant: 0)
    }
}