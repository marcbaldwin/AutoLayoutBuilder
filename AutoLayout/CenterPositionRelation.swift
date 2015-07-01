import UIKit

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