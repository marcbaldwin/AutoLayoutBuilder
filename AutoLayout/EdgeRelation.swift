import UIKit

public enum EdgeAttribute {
    case Edges
}

public class EdgeRelation: AbstractRelation {

    let attribute: EdgeAttribute
    var constant: (l: CGFloat, r: CGFloat, t: CGFloat, b: CGFloat) = (0, 0, 0, 0)

    init(attribute: EdgeAttribute, views: [UIView]) {
        self.attribute = attribute
        super.init(views: views)
    }

    override func plus(constant: CGFloat) {
        self.constant = (
            self.constant.l - constant,
            self.constant.r + constant,
            self.constant.t - constant,
            self.constant.b + constant
        )
    }
}

// MARK: Equality Operators

public func ==(lhs: EdgeRelation, rhs: EdgeRelation) -> [NSLayoutConstraint] {
    var constraints = [NSLayoutConstraint]()
    for view in lhs.views {
        constraints.append(NSLayoutConstraint(view, .Left, .Equal, rhs.views.first!, .Left, rhs.multiplier, rhs.constant.l))
        constraints.append(NSLayoutConstraint(view, .Right, .Equal, rhs.views.first!, .Right, rhs.multiplier, rhs.constant.r))
        constraints.append(NSLayoutConstraint(view, .Top, .Equal, rhs.views.first!, .Top, rhs.multiplier, rhs.constant.t))
        constraints.append(NSLayoutConstraint(view, .Bottom, .Equal, rhs.views.first!, .Bottom, rhs.multiplier, rhs.constant.b))
    }
    return constraints
}

// MARK: Extensions

public extension UIView {

    subscript(dimensionAttribute: EdgeAttribute) -> EdgeRelation {
        return EdgeRelation(attribute: dimensionAttribute, views: [self])
    }
}

public extension Views {

    subscript(dimensionAttribute: EdgeAttribute) -> EdgeRelation {
        return EdgeRelation(attribute: dimensionAttribute, views: views)
    }
}