import Foundation

// MARK: Horizontal
public enum HorizontalPositionAttribute {

    case CenterX
    case Left
    case Right
    case Leading
    case Trailing

    case CenterXWithinMargins
    case LeftMargin
    case RightMargin
    case LeadingMargin
    case TrailingMargin
}

// MARK: Vertical
public enum VerticalPositionAttribute {

    case CenterY
    case Top
    case Bottom
    case Baseline
    case FirstBaseline

    case CenterYWithinMargins
    case TopMargin
    case BottomMargin
}

// MARK: Center
public enum CenterAttribute {
    case Center
}

// MARK: Edge
public enum EdgeAttribute {
    case Edges
}

// MARK: Dimension
public enum DimensionAttribute {
    case Width
    case Height
}

// MARK: Size
public enum SizeAttribute {
    case Size
}