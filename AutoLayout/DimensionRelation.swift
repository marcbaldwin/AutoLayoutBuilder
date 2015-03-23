import UIKit

public enum DimensionAttribute {
    case Width
    case Height
}

public class DimensionRelation: AbstractRelation {
    let attribute: DimensionAttribute

    init(attribute: DimensionAttribute, views: [UIView]) {
        self.attribute = attribute
        super.init(views: views)
    }
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
        return DimensionRelation(attribute: dimensionAttribute, views: [self])
    }
}

public extension Views {

    subscript(dimensionAttribute: DimensionAttribute) -> DimensionRelation {
        return DimensionRelation(attribute: dimensionAttribute, views: views)
    }
}