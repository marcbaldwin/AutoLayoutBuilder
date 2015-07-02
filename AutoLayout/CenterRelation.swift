import UIKit

public class CenterRelation: AbstractDualRelation { }

extension CenterRelation: ConstrainableToRelation {

    typealias This = CenterRelation

    public func constrainToRelation(relation: CenterRelation, type: NSLayoutRelation) -> [NSLayoutConstraint] {
        var constraints = [NSLayoutConstraint]()
        for lhsView in views {
            constraints.append(NSLayoutConstraint(lhsView, .CenterX, type, relation.views.first!, .CenterX, relation.multiplier.0, relation.constant.0))
            constraints.append(NSLayoutConstraint(lhsView, .CenterY, type, relation.views.first!, .CenterY, relation.multiplier.1, relation.constant.1))
        }
        return constraints
    }
}