import UIKit

public protocol Relation: class {

    typealias AttributeType
    var views: [UIView] { get }

    func add(constant: CGFloat)
    func multiplyBy(multiplier: CGFloat)
}

// MARK: Operators

public func *<T: Relation>(lhs: T, rhs: CGFloat) -> T {
    lhs.multiplyBy(rhs)
    return lhs
}

public func /<T: Relation>(lhs: T, rhs: CGFloat) -> T {
    return lhs * (1/rhs)
}

public func +<T: Relation>(lhs: T, rhs: CGFloat) -> T {
    lhs.add(rhs)
    return lhs
}

public func -<T: Relation>(lhs: T, rhs: CGFloat) -> T {
    return lhs + (-rhs)
}