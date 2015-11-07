import UIKit

public extension UIView {

    subscript(attribute: HorizontalAttribute) -> HorizontalExpression {
        return HorizontalExpression(attribute: attribute, views: [self])
    }

    subscript(attribute: VerticalAttribute) -> VerticalExpression {
        return VerticalExpression(attribute: attribute, views: [self])
    }

    subscript(attribute: EdgeAttribute) -> EdgeExpression {
        return EdgeExpression(views: [self])
    }

    subscript(attribute: CenterAttribute) -> CenterExpression {
        return CenterExpression(views: [self])
    }

    subscript(attribute: SizeAttribute) -> SizeExpression {
        return SizeExpression(views: [self])
    }

    subscript(attribute: DimensionAttribute) -> DimensionExpression {
        return DimensionExpression(attribute: attribute, views: [self])
    }

    subscript(attribute: AspectRatioAttribute) -> ConstrainableToValue {
        return AspectRatioExpression(views: [self])
    }
}

public extension Group {

    subscript(attribute: HorizontalAttribute) -> HorizontalExpression {
        return HorizontalExpression(attribute: attribute, views: views)
    }

    subscript(attribute: VerticalAttribute) -> VerticalExpression {
        return VerticalExpression(attribute: attribute, views: views)
    }

    subscript(attribute: EdgeAttribute) -> EdgeExpression {
        return EdgeExpression(views: views)
    }

    subscript(attribute: CenterAttribute) -> CenterExpression {
        return CenterExpression(views: views)
    }

    subscript(attribute: SizeAttribute) -> SizeExpression {
        return SizeExpression(views: views)
    }

    subscript(attribute: DimensionAttribute) -> DimensionExpression {
        return DimensionExpression(attribute: attribute, views: views)
    }

    subscript(attribute: AspectRatioAttribute) -> ConstrainableToValue {
        return AspectRatioExpression(views: views)
    }
}

public extension UIViewController {

    public var layoutGuides: (top: LayoutGuide, bottom: LayoutGuide) {
        return (top: LayoutGuide(layoutGuide: self.topLayoutGuide), bottom: LayoutGuide(layoutGuide: self.bottomLayoutGuide))
    }
}

public extension LayoutGuide {

    public subscript(attribute: VerticalAttribute) -> LayoutGuideExpression {
        return LayoutGuideExpression(layoutGuide: layoutGuide, attribute: attribute)
    }
}