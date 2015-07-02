import UIKit

public class DimensionRelation: AbstractSingleRelationA {

    let attribute: DimensionAttribute

    init(attribute: DimensionAttribute, views: [UIView]) {
        self.attribute = attribute
        super.init(views: views)
    }

    private func trueAttribute() -> NSLayoutAttribute {
        switch attribute {
        case .Width: return .Width
        case .Height: return .Height
        }
    }
}

extension DimensionRelation: ConstrainableToValue {

    public func constrainToValue(value: CGFloat, type: NSLayoutRelation) -> [NSLayoutConstraint] {
        var constraints = [NSLayoutConstraint]()
        for view in views {
            constraints.append(NSLayoutConstraint(view, trueAttribute(), type, nil, .NotAnAttribute, 1, value))
        }
        return constraints
    }
}

extension DimensionRelation: ConstrainableToRelation {

    typealias This = DimensionRelation

    public func constrainToRelation(relation: DimensionRelation, type: NSLayoutRelation) -> [NSLayoutConstraint] {
        var constraints = [NSLayoutConstraint]()
        for view in views {
            constraints.append(NSLayoutConstraint(view, trueAttribute(), type, relation.views.first!, trueAttribute(), relation.multiplier, relation.constant))
        }
        return constraints
    }
}