import UIKit

public class CenterRelation: AbstractDualRelation { }

extension CenterRelation: ConstrainableToRelation {

    typealias This = CenterRelation

    public func constrainToRelation(relation: CenterRelation) -> [NSLayoutConstraint] {
        var constraints = [NSLayoutConstraint]()
        for lhsView in views {
            constraints.append(NSLayoutConstraint(lhsView, .CenterX, .Equal, relation.views.first!, .CenterX, relation.multiplier.0, relation.constant.0))
            constraints.append(NSLayoutConstraint(lhsView, .CenterY, .Equal, relation.views.first!, .CenterY, relation.multiplier.1, relation.constant.1))
        }
        return constraints
    }
}