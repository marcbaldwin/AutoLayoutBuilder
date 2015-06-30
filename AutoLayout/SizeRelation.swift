import UIKit

public class SizeRelation: AbstractDualRelation, DualRelation {

    typealias AttributeType = SizeAttribute
    let attribute: SizeAttribute
    public var trueAttributes: (NSLayoutAttribute, NSLayoutAttribute) {
        switch attribute {
        case .Size: return (.Width, .Height)
        }
    }

    init(attribute: SizeAttribute, views: [UIView]) {
        self.attribute = attribute
        super.init(views: views)
    }
}

// MARK: Operators

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

public extension Group {

    subscript(dimensionAttribute: SizeAttribute) -> SizeRelation {
        return SizeRelation(attribute: dimensionAttribute, views: views)
    }
}