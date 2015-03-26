import UIKit

public class BuilderGroup {
    var constraints = [NSLayoutConstraint]()

    public func activateConstraints(active: Bool) {
        for constraint in constraints {
            constraint.active = active
        }
    }
}


public func += (lhs: BuilderGroup, rhs: [NSLayoutConstraint]) {
    lhs.constraints += rhs
}

public class Builder {
    var keyedBuilders = ["" : BuilderGroup()]
    public init() {}
}

public extension Builder {

    subscript (key: String) -> BuilderGroup {
        return self.key(key)
    }

    public func key(key: String) -> BuilderGroup {
        if let builderGroup = keyedBuilders[key] {
            return builderGroup
        }
        else {
            let builderGroup = BuilderGroup()
            keyedBuilders[key] = builderGroup
            return builderGroup
        }
    }
}

public extension Builder {

    public func activateConstraints(active: Bool) {
        for builderGroup in keyedBuilders {
            builderGroup.1.activateConstraints(active)
        }
    }

    public func activateConstraintsExcludingKeys(keys: String...) {
        for (key, builderGroup) in keyedBuilders {
            if !contains(keys, key) {
                builderGroup.activateConstraints(true)
            }
        }
    }

    public func activateConstraintsWithKeys(keys: String...) {
        for (key, builderGroup) in keyedBuilders {
            if contains(keys, key) {
                builderGroup.activateConstraints(true)
            }
        }
    }
}

public func += (lhs: Builder, rhs: [NSLayoutConstraint]) {
    lhs.keyedBuilders[""]! += rhs
}

extension NSLayoutConstraint {

    convenience init(_ view1: AnyObject, _ attr1: NSLayoutAttribute, _ relation: NSLayoutRelation, _ view2: AnyObject?, _ attr2: NSLayoutAttribute, _ multiplier: CGFloat, _ c: CGFloat) {
        self.init(item: view1, attribute: attr1, relatedBy: relation, toItem: view2, attribute: attr2, multiplier: multiplier, constant: c)
    }
}

public func equalHeights(views: UIView...) -> [NSLayoutConstraint] {
    return equalHeights(views)
}

public func equalHeights(views: [UIView]) -> [NSLayoutConstraint] {
    let firstView = views.first!
    var constraints = [NSLayoutConstraint]()
    for view in views[1..<views.count] {
        constraints.append(NSLayoutConstraint(firstView, .Height, .Equal, view, .Height, 1, 0))
    }
    return constraints
}

public func equalWidths(views: UIView...) -> [NSLayoutConstraint] {
    return equalWidths(views)
}

public func equalWidths(views: [UIView]) -> [NSLayoutConstraint] {
    let firstView = views.first!
    var constraints = [NSLayoutConstraint]()
    for view in views[1..<views.count] {
        constraints.append(NSLayoutConstraint(firstView, .Width, .Equal, view, .Width, 1, 0))
    }
    return constraints
}

public func activate(constraints: [NSLayoutConstraint]) {
    for constraint in constraints {
        constraint.active = true
    }
}