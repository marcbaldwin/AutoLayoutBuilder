import UIKit

public class LayoutGuideRelation {

    let layoutGuide: UILayoutSupport
    var attribute: VerticalAttribute!
    var trueAttribute: NSLayoutAttribute { return verticalPositionToLayoutAttribute(self.attribute) }
    var constant: CGFloat = 0

    init(_ layoutGuide: UILayoutSupport) {
        self.layoutGuide = layoutGuide
    }

    public subscript(attribute: VerticalAttribute) -> LayoutGuideRelation {
        self.attribute = attribute
        return self
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

// MARK: Extensions

public extension UIViewController {

    public var layoutGuides: (top: LayoutGuideRelation, bottom: LayoutGuideRelation) {
        return (top: LayoutGuideRelation(self.topLayoutGuide), bottom: LayoutGuideRelation(self.bottomLayoutGuide))
    }
}