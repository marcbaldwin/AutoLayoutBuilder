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