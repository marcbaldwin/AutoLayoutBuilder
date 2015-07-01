import UIKit

// MARK: == CGFloat
public protocol ConstrainableToValue {
    func constrainToValue(value: CGFloat) -> [NSLayoutConstraint]
}

public func ==(lhs: ConstrainableToValue, rhs: CGFloat) -> [NSLayoutConstraint] {
    return lhs.constrainToValue(rhs)
}