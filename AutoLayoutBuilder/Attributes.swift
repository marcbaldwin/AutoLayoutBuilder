import UIKit

// MARK: Horizontal
public enum HorizontalAttribute {

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
public enum VerticalAttribute {

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

// MARK: Aspect Ratio
public enum AspectRatioAttribute {
    case AspectRatio
}

// Extensions:

extension HorizontalAttribute {
    var raw: NSLayoutAttribute {
        switch self {
        case .CenterX: return .CenterX
        case .Left: return .Left
        case .Right: return .Right
        case .Leading: return .Leading
        case .Trailing: return .Trailing
        case .CenterXWithinMargins: return .CenterXWithinMargins
        case .LeftMargin: return .LeftMargin
        case .RightMargin: return .RightMargin
        case .LeadingMargin: return .LeadingMargin
        case .TrailingMargin: return .TrailingMargin
        }
    }
}

extension VerticalAttribute {
    var raw: NSLayoutAttribute {
        switch self {
        case .CenterY: return .CenterY
        case .Top: return .Top
        case .Bottom: return .Bottom
        case .Baseline: return .Baseline
        case .FirstBaseline: return .FirstBaseline
        case .CenterYWithinMargins: return .CenterYWithinMargins
        case .TopMargin: return .TopMargin
        case .BottomMargin: return .BottomMargin
        }
    }
}

extension DimensionAttribute {
    var raw: NSLayoutAttribute {
        switch self {
        case .Width: return .Width
        case .Height: return .Height
        }
    }
}