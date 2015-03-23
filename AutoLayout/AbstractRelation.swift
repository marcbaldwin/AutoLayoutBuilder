import UIKit

public class AbstractRelation {
    let views: [UIView]
    var multiplier: CGFloat = 1
    var constant: CGFloat = 0

    init(views: [UIView]) {
        self.views = views
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
    lhs.constant += rhs
    return lhs
}

public func -<T: AbstractRelation>(lhs: T, rhs: CGFloat) -> T {
    return lhs + (-rhs)
}