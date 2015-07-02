import UIKit

public class EdgeRelation: AbstractRelation {

    var constant: CGFloatQuad = (0, 0, 0, 0)
    var multiplier: CGFloatQuad = (1, 1, 1, 1)
}

extension EdgeRelation: MultiplierSingleRelation {

    public func setMultiplier(multiplier: CGFloat) {
        self.multiplier = (multiplier, multiplier, multiplier, multiplier)
    }
}

extension EdgeRelation: ConstantSingleRelation {

    public func setConstant(constant: CGFloat) {
        self.constant = (-constant, -constant, constant, constant)
    }
}

extension EdgeRelation: ConstantQuadRelation {

    public func setConstant(constant: CGFloatQuad) {
        self.constant = constant
    }
}

extension EdgeRelation: ConstrainableToRelation {

    typealias This = EdgeRelation

    public func constrainToRelation(relation: EdgeRelation, type: NSLayoutRelation) -> [NSLayoutConstraint] {
        var constraints = [NSLayoutConstraint]()
        for view in views {
            constraints.append(NSLayoutConstraint(view, .Left, type, relation.views.first!, .Left, relation.multiplier.1, relation.constant.1))
            constraints.append(NSLayoutConstraint(view, .Right, type, relation.views.first!, .Right, relation.multiplier.3, relation.constant.3))
            constraints.append(NSLayoutConstraint(view, .Top, type, relation.views.first!, .Top, relation.multiplier.0, relation.constant.0))
            constraints.append(NSLayoutConstraint(view, .Bottom, type, relation.views.first!, .Bottom, relation.multiplier.2, relation.constant.2))
        }
        return constraints
    }
}