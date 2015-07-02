import UIKit

public class DimensionRelation: AbstractSingleRelation {

    let attribute: DimensionAttribute

    init(attribute: DimensionAttribute, views: [UIView]) {
        self.attribute = attribute
        super.init(views: views)
    }

    private var trueAttribute: NSLayoutAttribute {
        switch attribute {
        case .Width: return .Width
        case .Height: return .Height
        }
    }
}

extension DimensionRelation: ConstrainableToValue {

    public func constrainToValue(value: CGFloat, type: NSLayoutRelation) -> [NSLayoutConstraint] {
        return views.map { NSLayoutConstraint($0, self.trueAttribute, type, nil, .NotAnAttribute, 1, value) }
    }
}

extension DimensionRelation: ConstrainableToRelation {

    typealias This = DimensionRelation

    public func constrainToRelation(relation: DimensionRelation, type: NSLayoutRelation) -> [NSLayoutConstraint] {
        return views.map { NSLayoutConstraint($0, self.trueAttribute, type, relation.views.first!, relation.trueAttribute, relation.multiplier, relation.constant) }
    }
}