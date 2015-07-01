import UIKit

public class EdgeRelation: AbstractRelation {

    var constant: (l: CGFloat, r: CGFloat, t: CGFloat, b: CGFloat) = (0, 0, 0, 0)
    var multiplier: (l: CGFloat, r: CGFloat, t: CGFloat, b: CGFloat) = (1, 1, 1, 1)
}

extension EdgeRelation: MultiplierSingleRelation {

    public func setMultiplier(multiplier: CGFloat) {
        self.multiplier = (multiplier, multiplier, multiplier, multiplier)
    }
}

extension EdgeRelation: ConstantSingleRelation {

    public func setConstant(constant: CGFloat) {
        self.constant = (-constant, constant, -constant, constant)
    }
}

extension EdgeRelation: ConstrainableToRelation {

    typealias This = EdgeRelation

    public func constrainToRelation(relation: EdgeRelation) -> [NSLayoutConstraint] {
        var constraints = [NSLayoutConstraint]()
        for view in views {
            constraints.append(NSLayoutConstraint(view, .Left, .Equal, relation.views.first!, .Left, relation.multiplier.l, relation.constant.l))
            constraints.append(NSLayoutConstraint(view, .Right, .Equal, relation.views.first!, .Right, relation.multiplier.r, relation.constant.r))
            constraints.append(NSLayoutConstraint(view, .Top, .Equal, relation.views.first!, .Top, relation.multiplier.t, relation.constant.t))
            constraints.append(NSLayoutConstraint(view, .Bottom, .Equal, relation.views.first!, .Bottom, relation.multiplier.b, relation.constant.b))
        }
        return constraints
    }
}