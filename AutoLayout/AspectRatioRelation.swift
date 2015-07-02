import UIKit

class AspectRatioRelation: AbstractRelation {}

extension AspectRatioRelation: ConstrainableToValue {

    func constrainToValue(value: CGFloat, type: NSLayoutRelation) -> [NSLayoutConstraint] {
        var constraints = [NSLayoutConstraint]()
        for view in views {
            constraints.append(NSLayoutConstraint(view, .Width, type, view, .Height, value, 0))
        }
        return constraints
    }
}