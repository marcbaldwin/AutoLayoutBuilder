import UIKit

public class CenterRelation: AbstractDualRelation { }

extension CenterRelation: ConstrainableToRelation {

    typealias This = CenterRelation

    public func constrainToRelation(relation: CenterRelation, type: NSLayoutRelation) -> [NSLayoutConstraint] {
        return views.flatMap { [
            NSLayoutConstraint($0, .CenterX, type, relation.views.first!, .CenterX, relation.multiplier.0, relation.constant.0),
            NSLayoutConstraint($0, .CenterY, type, relation.views.first!, .CenterY, relation.multiplier.1, relation.constant.1)
            ]
        }
    }
}