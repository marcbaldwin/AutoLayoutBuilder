import UIKit

public class EdgeRelation: AbstractRelation, Relation {

    typealias AttributeType = EdgeAttribute
    let attribute: EdgeAttribute
    var constant: (l: CGFloat, r: CGFloat, t: CGFloat, b: CGFloat) = (0, 0, 0, 0)
    var multiplier: (l: CGFloat, r: CGFloat, t: CGFloat, b: CGFloat) = (1, 1, 1, 1)

    init(attribute: EdgeAttribute, views: [UIView]) {
        self.attribute = attribute
        super.init(views: views)
    }

    public func add(constant: CGFloat) {
        self.constant = (
            self.constant.l - constant,
            self.constant.r + constant,
            self.constant.t - constant,
            self.constant.b + constant
        )
    }

    public func multiplyBy(multiplier: CGFloat) {
        self.multiplier = (
            self.multiplier.l * multiplier,
            self.multiplier.r * multiplier,
            self.multiplier.t * multiplier,
            self.multiplier.b * multiplier
        )
    }
}

// MARK: Operators

public func ==(lhs: EdgeRelation, rhs: EdgeRelation) -> [NSLayoutConstraint] {
    var constraints = [NSLayoutConstraint]()
    for view in lhs.views {
        constraints.append(NSLayoutConstraint(view, .Left, .Equal, rhs.views.first!, .Left, rhs.multiplier.l, rhs.constant.l))
        constraints.append(NSLayoutConstraint(view, .Right, .Equal, rhs.views.first!, .Right, rhs.multiplier.r, rhs.constant.r))
        constraints.append(NSLayoutConstraint(view, .Top, .Equal, rhs.views.first!, .Top, rhs.multiplier.t, rhs.constant.t))
        constraints.append(NSLayoutConstraint(view, .Bottom, .Equal, rhs.views.first!, .Bottom, rhs.multiplier.b, rhs.constant.b))
    }
    return constraints
}

// MARK: Extensions

public extension UIView {

    subscript(dimensionAttribute: EdgeAttribute) -> EdgeRelation {
        return EdgeRelation(attribute: dimensionAttribute, views: [self])
    }
}

public extension Group {

    subscript(dimensionAttribute: EdgeAttribute) -> EdgeRelation {
        return EdgeRelation(attribute: dimensionAttribute, views: views)
    }
}