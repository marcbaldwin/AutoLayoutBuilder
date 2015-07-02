import UIKit

public class SizeRelation: AbstractDualRelation { }

extension SizeRelation: ConstrainableToSize {

    public func constrainToSize(size: CGSize) -> [NSLayoutConstraint] {
        return views.flatMap { [
            NSLayoutConstraint($0, .Width, .Equal, nil, .NotAnAttribute, 1, size.width),
            NSLayoutConstraint($0, .Height, .Equal, nil, .NotAnAttribute, 1, size.height)
            ]
        }
    }
}

extension SizeRelation: ConstrainableToRelation {

    typealias This = SizeRelation
    
    public func constrainToRelation(relation: SizeRelation, type: NSLayoutRelation) -> [NSLayoutConstraint] {
        return views.flatMap { [
            NSLayoutConstraint($0, .Width, type, relation.views.first!, .Width, relation.multiplier.0, relation.constant.0),
            NSLayoutConstraint($0, .Height, type, relation.views.first!, .Height, relation.multiplier.1, relation.constant.1)
            ]
        }
    }
}