import UIKit

public typealias CGFloatPair = (CGFloat, CGFloat)

// MARK: == CGFloat
public protocol ConstrainableToValue {
    func constrainToValue(value: CGFloat) -> [NSLayoutConstraint]
}

public func ==(lhs: ConstrainableToValue, rhs: CGFloat) -> [NSLayoutConstraint] {
    return lhs.constrainToValue(rhs)
}

// MARK: == CGSize
public protocol ConstrainableToSize {
    func constrainToSize(size: CGSize) -> [NSLayoutConstraint]
}

public func ==(lhs: ConstrainableToSize, rhs: CGSize) -> [NSLayoutConstraint] {
    return lhs.constrainToSize(rhs)
}

// MARK: == View[.Attribute]
public protocol ConstrainableToRelation {
    typealias This
    func constrainToRelation(relation: This) -> [NSLayoutConstraint]
}

public func ==<T1:ConstrainableToRelation, T2:ConstrainableToRelation where T1.This == T2>(lhs: T1, rhs: T2) -> [NSLayoutConstraint] {
    return lhs.constrainToRelation(rhs)
}

//
// MARK:
//

// MARK: Constant Relation
public protocol ConstantSingleRelation: class {
    func setConstant(constant: CGFloat)
}

public func +<T: ConstantSingleRelation>(lhs: T, rhs: CGFloat) -> T {
    lhs.setConstant(rhs)
    return lhs
}

public func -<T: ConstantSingleRelation>(lhs: T, rhs: CGFloat) -> T {
    lhs.setConstant(-rhs)
    return lhs
}

// MARK: Constant Tuple Relation
public protocol ConstantTupleRelation: class {
    func setConstant(constant: CGFloatPair)
}

public func +<T: ConstantTupleRelation>(lhs: T, rhs: CGFloatPair) -> T {
    lhs.setConstant(rhs)
    return lhs
}

public func -<T: ConstantTupleRelation>(lhs: T, rhs: CGFloatPair) -> T {
    lhs.setConstant((-rhs.0, -rhs.1))
    return lhs
}

// MARK: Multiplier Relation
public protocol MultiplierSingleRelation {
    func setMultiplier(multiplier: CGFloat)
}

public func *<T: MultiplierSingleRelation>(lhs: T, rhs: CGFloat) -> T {
    lhs.setMultiplier(rhs)
    return lhs
}

public func /<T: MultiplierSingleRelation>(lhs: T, rhs: CGFloat) -> T {
    lhs.setMultiplier(1/rhs)
    return lhs
}

// MARK: Multiplier Tuple Relation
public protocol MultiplierTupleRelation {
    func setMultiplier(multiplier: CGFloatPair)
}

public func *<T: MultiplierTupleRelation>(lhs: T, rhs: CGFloatPair) -> T {
    lhs.setMultiplier(rhs)
    return lhs
}

public func /<T: MultiplierTupleRelation>(lhs: T, rhs: CGFloatPair) -> T {
    lhs.setMultiplier((1/rhs.0, 1/rhs.1))
    return lhs
}