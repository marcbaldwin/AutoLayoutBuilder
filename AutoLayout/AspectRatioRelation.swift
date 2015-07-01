import UIKit

class AspectRatioRelation {

    let views: [UIView]

    init(views: [UIView]) {
        self.views = views
    }
}

extension AspectRatioRelation: ConstrainableToValue {

    func constrainToValue(value: CGFloat) -> [NSLayoutConstraint] {
        var constraints = [NSLayoutConstraint]()
        for view in views {
            constraints.append(NSLayoutConstraint(view, .Width, .Equal, view, .Height, value, 0))
        }
        return constraints
    }
}