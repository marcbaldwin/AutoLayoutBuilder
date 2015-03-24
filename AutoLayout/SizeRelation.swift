import UIKit

public enum SizeAttribute {
    case Size
}

public class SizeRelation: AbstractRelation {

    let attribute: SizeAttribute
    var constant: (width: CGFloat, height: CGFloat) = (0, 0)

    init(attribute: SizeAttribute, views: [UIView]) {
        self.attribute = attribute
        super.init(views: views)
    }

    override func plus(constant: CGFloat) {
        self.constant = (self.constant.width + constant, self.constant.height + constant)
    }
}

// MARK: Equality Operators

public func ==(lhs: SizeRelation, rhs: SizeRelation) -> [NSLayoutConstraint] {
    var constraints = [NSLayoutConstraint]()
    for view in lhs.views {
        constraints.append(NSLayoutConstraint(view, .Width, .Equal, rhs.views.first!, .Width, rhs.multiplier, rhs.constant.width))
        constraints.append(NSLayoutConstraint(view, .Height, .Equal, rhs.views.first!, .Height, rhs.multiplier, rhs.constant.height))
    }
    return constraints
}

public func ==(lhs: SizeRelation, rhs: CGSize) -> [NSLayoutConstraint] {
    var constraints = [NSLayoutConstraint]()
    for view in lhs.views {
        constraints.append(NSLayoutConstraint(view, .Width, .Equal, nil, .NotAnAttribute, 1, rhs.width))
        constraints.append(NSLayoutConstraint(view, .Height, .Equal, nil, .NotAnAttribute, 1, rhs.height))
    }
    return constraints
}

// MARK: Extensions

public extension UIView {

    subscript(dimensionAttribute: SizeAttribute) -> SizeRelation {
        return SizeRelation(attribute: dimensionAttribute, views: [self])
    }
}

public extension Views {

    subscript(dimensionAttribute: SizeAttribute) -> SizeRelation {
        return SizeRelation(attribute: dimensionAttribute, views: views)
    }
}