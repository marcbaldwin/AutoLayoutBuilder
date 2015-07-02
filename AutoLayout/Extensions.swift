import UIKit

public extension UIView {

    subscript(attribute: HorizontalAttribute) -> HorizontalRelation {
        return HorizontalRelation(attribute: attribute, views: [self])
    }

    subscript(attribute: VerticalAttribute) -> VerticalRelation {
        return VerticalRelation(attribute: attribute, views: [self])
    }

    subscript(attribute: EdgeAttribute) -> EdgeRelation {
        return EdgeRelation(views: [self])
    }

    subscript(attribute: CenterAttribute) -> CenterRelation {
        return CenterRelation(views: [self])
    }

    subscript(attribute: SizeAttribute) -> SizeRelation {
        return SizeRelation(views: [self])
    }

    subscript(attribute: DimensionAttribute) -> DimensionRelation {
        return DimensionRelation(attribute: attribute, views: [self])
    }

    subscript(attribute: AspectRatioAttribute) -> ConstrainableToValue {
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
        return EdgeRelation(views: views)
    }

    subscript(attribute: CenterAttribute) -> CenterRelation {
        return CenterRelation(views: views)
    }

    subscript(attribute: SizeAttribute) -> SizeRelation {
        return SizeRelation(views: views)
    }

    subscript(attribute: DimensionAttribute) -> DimensionRelation {
        return DimensionRelation(attribute: attribute, views: views)
    }

    subscript(attribute: AspectRatioAttribute) -> ConstrainableToValue {
        return AspectRatioRelation(views: views)
    }
}

public extension UIViewController {

    public var layoutGuides: (top: LayoutGuide, bottom: LayoutGuide) {
        return (top: LayoutGuide(layoutGuide: self.topLayoutGuide), bottom: LayoutGuide(layoutGuide: self.bottomLayoutGuide))
    }
}

public extension LayoutGuide {

    public subscript(attribute: VerticalAttribute) -> LayoutGuideRelation {
        return LayoutGuideRelation(layoutGuide: layoutGuide, attribute: attribute)
    }
}