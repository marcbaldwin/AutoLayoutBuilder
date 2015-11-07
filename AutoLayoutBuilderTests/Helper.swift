import UIKit

extension NSLayoutConstraint {

    public override func isEqual(object: AnyObject?) -> Bool {

        if let rhs = object as? NSLayoutConstraint {
            var isEqual = true

            isEqual = isEqual && firstItem.isEqual(rhs.firstItem)

            if let secondItem: AnyObject = secondItem {
                if let rhsSecondItem: AnyObject = rhs.secondItem {
                    isEqual = isEqual && secondItem.isEqual(rhsSecondItem)
                }
                else {
                    return false
                }
            }
            else {
                isEqual = isEqual && rhs.secondItem == nil
            }

            isEqual = isEqual && firstAttribute == rhs.firstAttribute
            isEqual = isEqual && secondAttribute == rhs.secondAttribute
            isEqual = isEqual && multiplier == rhs.multiplier
            isEqual = isEqual && constant == rhs.constant
            isEqual = isEqual && relation == rhs.relation
            
            return isEqual
        }
        else {
            return false
        }
    }
}