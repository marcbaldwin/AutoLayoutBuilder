import UIKit

public class AspectRatioRelation {

    let views: [UIView]

    init(views: [UIView]) {
        self.views = views
    }
}

public func ==(lhs: AspectRatioRelation, rhs: CGFloat) -> [NSLayoutConstraint] {
    var constraints = [NSLayoutConstraint]()
    for view in lhs.views {
        constraints.append(NSLayoutConstraint(view, .Width, .Equal, view, .Height, rhs, 0))
    }
    return constraints
}