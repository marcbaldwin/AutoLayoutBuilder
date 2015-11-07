import UIKit

public func equalHeights(views: UIView...) -> [NSLayoutConstraint] {
    return equalHeights(views)
}

public func equalHeights(views: [UIView]) -> [NSLayoutConstraint] {
    let firstView = views.first!
    var constraints = [NSLayoutConstraint]()
    for view in views[1..<views.count] {
        constraints.append(NSLayoutConstraint(firstView, .Height, .Equal, view, .Height, 1, 0))
    }
    return constraints
}

public func equalWidths(views: UIView...) -> [NSLayoutConstraint] {
    return equalWidths(views)
}

public func equalWidths(views: [UIView]) -> [NSLayoutConstraint] {
    let firstView = views.first!
    var constraints = [NSLayoutConstraint]()
    for view in views[1..<views.count] {
        constraints.append(NSLayoutConstraint(firstView, .Width, .Equal, view, .Width, 1, 0))
    }
    return constraints
}
