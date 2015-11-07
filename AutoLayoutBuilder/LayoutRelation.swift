import UIKit

public enum LayoutDirection {

    case Horizontal
    case LeadingToTrailing

    case Vertical
}

public class LayoutRelation {

    var views: [UIView]
    var margins: [CGFloat]

    public init(views: UIView...) {
        self.views = views
        self.margins = [0]
    }
}

// MARK: Operators

infix operator ~ { associativity left precedence 100 }

public func ~(lhs: LayoutDirection, rhs: LayoutRelation) -> [NSLayoutConstraint] {
    return makeLayoutConstraints(lhs, views: rhs.views, margins: rhs.margins)
}

public func ~(lhs: LayoutDirection, rhs: Group) -> [NSLayoutConstraint] {
    return makeLayoutConstraints(lhs, views: rhs.views, margins: nil)
}

public func |(lhs: UIView, rhs: UIView) -> LayoutRelation {
    return LayoutRelation(views: lhs, rhs)
}

public func |(lhs: LayoutRelation, rhs: UIView) -> LayoutRelation {
    lhs.views.append(rhs)
    if lhs.margins.count < lhs.views.count-1 {
        lhs.margins.append(0)
    }
    return lhs
}

public func |(lhs: LayoutRelation, rhs: CGFloat) -> LayoutRelation {
    lhs.margins.append(rhs)
    return lhs
}

public func |(lhs: UIView, rhs: CGFloat) -> LayoutRelation {
    let layoutRelation = LayoutRelation(views: lhs)
    layoutRelation.margins[layoutRelation.margins.count-1] = rhs
    return layoutRelation
}

// MARK: Internal

internal func makeLayoutConstraints(direction: LayoutDirection, views: [UIView], margins: [CGFloat]?) -> [NSLayoutConstraint] {
    let safeMargins = margins == nil ? Array<CGFloat>(count:views.count, repeatedValue: 0) : margins!
    var constraints = [NSLayoutConstraint]()
    for i in 1 ..< views.count {
        switch direction {
        case .Horizontal:
            constraints.append(NSLayoutConstraint(views[i], .Left, .Equal, views[i-1], .Right, 1, safeMargins[i-1]))
        case .LeadingToTrailing:
            constraints.append(NSLayoutConstraint(views[i], .Leading, .Equal, views[i-1], .Trailing, 1, safeMargins[i-1]))
        case .Vertical:
            constraints.append(NSLayoutConstraint(views[i], .Top, .Equal, views[i-1], .Bottom, 1, safeMargins[i-1]))
        }
    }
    return constraints
}