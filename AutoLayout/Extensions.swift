import UIKit

public extension UIView {

    subscript(attribute: HorizontalAttribute) -> HorizontalRelation {
        return HorizontalRelation(attribute: attribute, views: [self])
    }

    subscript(attribute: VerticalAttribute) -> VerticalRelation {
        return VerticalRelation(attribute: attribute, views: [self])
    }

    subscript(attribute: EdgeAttribute) -> EdgeRelation {
        return EdgeRelation(attribute: attribute, views: [self])
    }

    subscript(attribute: CenterAttribute) -> CenterRelation {
        return CenterRelation(attribute: attribute, views: [self])
    }

    subscript(attribute: SizeAttribute) -> SizeRelation {
        return SizeRelation(attribute: attribute, views: [self])
    }

    subscript(attribute: DimensionAttribute) -> DimensionRelation {
        return DimensionRelation(attribute: attribute, views: [self])
    }

    subscript(attribute: AspectRatioAttribute) -> AspectRatioRelation {
        return AspectRatioRelation(views: [self])
    }
}

public extension Group {

    subscript(attribute: HorizontalAttribute) -> HorizontalRelation {
        return HorizontalRelation(attribute: attribute, views: views)
    }

    subscript(attribute: VerticalAttribute) -> VerticalRelation {
        return VerticalRelation(attribute: attribute, views: views)
    }

    subscript(attribute: EdgeAttribute) -> EdgeRelation {
        return EdgeRelation(attribute: attribute, views: views)
    }

    subscript(attribute: CenterAttribute) -> CenterRelation {
        return CenterRelation(attribute: attribute, views: views)
    }

    subscript(attribute: SizeAttribute) -> SizeRelation {
        return SizeRelation(attribute: attribute, views: views)
    }

    subscript(attribute: DimensionAttribute) -> DimensionRelation {
        return DimensionRelation(attribute: attribute, views: views)
    }

    subscript(attribute: AspectRatioAttribute) -> AspectRatioRelation {
        return AspectRatioRelation(views: views)
    }
}