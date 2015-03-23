import UIKit

public enum HorizontalPositionAttribute {
    case CenterX
    case Left
    case Right
}

public class HorizontalPositionRelation: AbstractRelation {
    let attribute: HorizontalPositionAttribute

    init(attribute: HorizontalPositionAttribute, views: [UIView]) {
        self.attribute = attribute
        super.init(views: views)
    }
}

extension HorizontalPositionRelation {

    var trueAttribute: NSLayoutAttribute {
        switch attribute {
        case .CenterX: return .CenterX
        case .Left: return .Left
        case .Right: return .Right
        }
    }
}

// MARK: Equality Operators

public func ==(lhs: HorizontalPositionRelation, rhs: HorizontalPositionRelation) -> [NSLayoutConstraint] {
    var constraints = [NSLayoutConstraint]()
    for view in lhs.views {
        constraints.append(NSLayoutConstraint(view, lhs.trueAttribute, .Equal, rhs.views.first!, rhs.trueAttribute, rhs.multiplier, rhs.constant))
    }
    return constraints
}

// MARK: Extensions

public extension UIView {

    subscript(hoirzontalPosition: HorizontalPositionAttribute) -> HorizontalPositionRelation {
        return HorizontalPositionRelation(attribute: hoirzontalPosition, views: [self])
    }
}

public extension Views {

    subscript(hoirzontalPosition: HorizontalPositionAttribute) -> HorizontalPositionRelation {
        return HorizontalPositionRelation(attribute: hoirzontalPosition, views: views)
    }
}