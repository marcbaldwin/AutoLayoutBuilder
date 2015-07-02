import UIKit

public class LayoutGuideRelation {

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

public func +(lhs: LayoutGuideRelation, rhs: CGFloat) -> LayoutGuideRelation {
    lhs.constant = rhs
    return lhs
}

public func -(lhs: LayoutGuideRelation, rhs: CGFloat) -> LayoutGuideRelation {
    lhs.constant = -rhs
    return lhs
}