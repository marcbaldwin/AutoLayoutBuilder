import UIKit

public class AbstractRelation {

    public var views: [UIView]
    public var multiplier: CGFloat = 1

    init(views: [UIView]) {
        self.views = views
    }

    func plus(constant: CGFloat) {
        // Abstract
    }
}

// MARK: Arithmetic Operators

public func *<T: AbstractRelation>(lhs: T, rhs: CGFloat) -> T {
    lhs.multiplier *= rhs
    return lhs
}

public func /<T: AbstractRelation>(lhs: T, rhs: CGFloat) -> T {
    return lhs * (1/rhs)
}

public func +<T: AbstractRelation>(lhs: T, rhs: CGFloat) -> T {
    lhs.plus(rhs)
    return lhs
}

public func -<T: AbstractRelation>(lhs: T, rhs: CGFloat) -> T {
    return lhs + (-rhs)
}