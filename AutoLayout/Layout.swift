import UIKit

public class LayoutGroup {
    var constraints = [NSLayoutConstraint]()

    public func activateConstraints(active: Bool) {
        for constraint in constraints {
            constraint.active = active
        }
    }
}

public func += (lhs: LayoutGroup, rhs: [NSLayoutConstraint]) {
    lhs.constraints += rhs
}

public class Layout {
    var keyedBuilders = ["" : LayoutGroup()]
    public init() {}
}

public extension Layout {

    subscript (key: String) -> LayoutGroup {
        return self.key(key)
    }

    public func key(key: String) -> LayoutGroup {
        if let builderGroup = keyedBuilders[key] {
            return builderGroup
        }
        else {
            let builderGroup = LayoutGroup()
            keyedBuilders[key] = builderGroup
            return builderGroup
        }
    }
}

public extension Layout {

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

public func += (lhs: Layout, rhs: [NSLayoutConstraint]) {
    lhs.keyedBuilders[""]! += rhs
}