import UIKit

public class LayoutGuideExpression {

    let layoutGuide: UILayoutSupport
    let attribute: VerticalAttribute
    var trueAttribute: NSLayoutAttribute { return verticalPositionToLayoutAttribute(self.attribute) }
    var constant: CGFloat = 0

    init(layoutGuide: UILayoutSupport, attribute: VerticalAttribute) {
        self.layoutGuide = layoutGuide
        self.attribute = attribute
    }
}

// MARK: Operators

public func +(lhs: LayoutGuideExpression, rhs: CGFloat) -> LayoutGuideExpression {
    lhs.constant = rhs
    return lhs
}

public func -(lhs: LayoutGuideExpression, rhs: CGFloat) -> LayoutGuideExpression {
    lhs.constant = -rhs
    return lhs
}