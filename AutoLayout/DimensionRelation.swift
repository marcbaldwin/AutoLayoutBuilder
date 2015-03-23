import UIKit

public enum DimensionAttribute {
    case Width
    case Height
}

public class DimensionRelation: AbstractSingleRelation {

    let attribute: DimensionAttribute
    override var trueAttribute: NSLayoutAttribute {
        switch attribute {
        case .Width: return .Width
        case .Height: return .Height
        }
    }

    init(attribute: DimensionAttribute, views: [UIView]) {
        self.attribute = attribute
        super.init(views: views)
    }
}

// MARK: Extensions

public extension UIView {

    subscript(dimensionAttribute: DimensionAttribute) -> DimensionRelation {
        return DimensionRelation(attribute: dimensionAttribute, views: [self])
    }
}

public extension Views {

    subscript(dimensionAttribute: DimensionAttribute) -> DimensionRelation {
        return DimensionRelation(attribute: dimensionAttribute, views: views)
    }
}