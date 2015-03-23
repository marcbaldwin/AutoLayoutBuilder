import UIKit

public enum CenterAttribute {
    case Center
}

public class CenterPositionRelation: AbstractRelation {
    let attribute: CenterAttribute

    init(attribute: CenterAttribute, views: [UIView]) {
        self.attribute = attribute
        super.init(views: views)
    }
}

// MARK: Equality Operators

public func ==(lhs: CenterPositionRelation, rhs: CenterPositionRelation) -> [NSLayoutConstraint] {
    var constraints = [NSLayoutConstraint]()
    for view in lhs.views {
        constraints.append(NSLayoutConstraint(view, .CenterX, .Equal, rhs.views.first!, .CenterX, rhs.multiplier, rhs.constant))
        constraints.append(NSLayoutConstraint(view, .CenterY, .Equal, rhs.views.first!, .CenterY, rhs.multiplier, rhs.constant))
    }
    return constraints
}

// MARK: Extensions

public extension UIView {

    subscript(dimensionAttribute: CenterAttribute) -> CenterPositionRelation {
        return CenterPositionRelation(attribute: dimensionAttribute, views: [self])
    }
}

public extension Views {

    subscript(dimensionAttribute: CenterAttribute) -> CenterPositionRelation {
        return CenterPositionRelation(attribute: dimensionAttribute, views: views)
    }
}