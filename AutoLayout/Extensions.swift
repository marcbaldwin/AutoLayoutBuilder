import UIKit

public extension UIView {

    subscript(attribute: HorizontalAttribute) -> HorizontalPositionRelation {
        return HorizontalPositionRelation(attribute: attribute, views: [self])
    }

    subscript(attribute: VerticalAttribute) -> VerticalPositionRelation {
        return VerticalPositionRelation(attribute: attribute, views: [self])
    }

    subscript(attribute: EdgeAttribute) -> EdgeRelation {
        return EdgeRelation(attribute: attribute, views: [self])
    }

    subscript(attribute: CenterAttribute) -> CenterPositionRelation {
        return CenterPositionRelation(attribute: attribute, views: [self])
    }

    subscript(attribute: SizeAttribute) -> SizeRelation {
        return SizeRelation(attribute: attribute, views: [self])
    }

    subscript(attribute: DimensionAttribute) -> DimensionRelation {
        return DimensionRelation(attribute: attribute, views: [self])
    }
}

public extension Group {

    subscript(attribute: HorizontalAttribute) -> HorizontalPositionRelation {
        return HorizontalPositionRelation(attribute: attribute, views: views)
    }

    subscript(attribute: VerticalAttribute) -> VerticalPositionRelation {
        return VerticalPositionRelation(attribute: attribute, views: views)
    }

    subscript(attribute: EdgeAttribute) -> EdgeRelation {
        return EdgeRelation(attribute: attribute, views: views)
    }

    subscript(attribute: CenterAttribute) -> CenterPositionRelation {
        return CenterPositionRelation(attribute: attribute, views: views)
    }

    subscript(attribute: SizeAttribute) -> SizeRelation {
        return SizeRelation(attribute: attribute, views: views)
    }

    subscript(attribute: DimensionAttribute) -> DimensionRelation {
        return DimensionRelation(attribute: attribute, views: views)
    }
}