import UIKit

extension NSLayoutConstraint: Equatable {}

public func ==(lhs: NSLayoutConstraint, rhs: NSLayoutConstraint) -> Bool {

    var isEqual = true

    isEqual = isEqual && lhs.firstItem.isEqual(rhs.firstItem)

    if let secondItem: AnyObject = lhs.secondItem {
        if let rhsSecondItem: AnyObject = rhs.secondItem {
            isEqual = isEqual && secondItem.isEqual(rhsSecondItem)
        }
        else {
            return false
        }
    }
    else {
        isEqual && rhs.secondItem == nil
    }

    isEqual = isEqual && lhs.firstAttribute == rhs.firstAttribute
    isEqual = isEqual && lhs.secondAttribute == rhs.secondAttribute
    isEqual = isEqual && lhs.multiplier == rhs.multiplier
    isEqual = isEqual && lhs.constant == rhs.constant
    isEqual = isEqual && lhs.relation == rhs.relation

    return isEqual
}