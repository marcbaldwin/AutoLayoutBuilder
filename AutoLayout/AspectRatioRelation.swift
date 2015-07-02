import UIKit

class AspectRatioRelation: AbstractRelation {}

extension AspectRatioRelation: ConstrainableToValue {

    func constrainToValue(value: CGFloat, type: NSLayoutRelation) -> [NSLayoutConstraint] {
        return views.map { NSLayoutConstraint($0, .Width, type, $0, .Height, value, 0) }
    }
}