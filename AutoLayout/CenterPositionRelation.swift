import UIKit

public enum CenterAttribute {
    case Center
}

public class CenterPositionRelation: AbstractDualRelation, DualRelation {

    typealias AttributeType = CenterAttribute
    let attribute: CenterAttribute
    public var trueAttributes: (NSLayoutAttribute, NSLayoutAttribute) {
        switch attribute {
        case .Center: return (.CenterX, .CenterY)
        }
    }

    init(attribute: CenterAttribute, views: [UIView]) {
        self.attribute = attribute
        super.init(views: views)
    }
}

// MARK: Extensions

public extension UIView {

    subscript(dimensionAttribute: CenterAttribute) -> CenterPositionRelation {
        return CenterPositionRelation(attribute: dimensionAttribute, views: [self])
    }
}

public extension Group {

    subscript(dimensionAttribute: CenterAttribute) -> CenterPositionRelation {
        return CenterPositionRelation(attribute: dimensionAttribute, views: views)
    }
}