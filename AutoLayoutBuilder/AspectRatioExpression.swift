import UIKit

class AspectRatioExpression: Expression {}

extension AspectRatioExpression: ConstrainableToValue {

    func constrainToValue(value: CGFloat, relation: NSLayoutRelation) -> [NSLayoutConstraint] {
        return views.map { NSLayoutConstraint($0, .Width, relation, $0, .Height, value, 0) }
    }
}