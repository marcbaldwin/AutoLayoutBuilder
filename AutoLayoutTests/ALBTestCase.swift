import Foundation
import XCTest
import UIKit

class ALBTestCase: XCTestCase {

    let viewController = UIViewController()
    let superview = UIView()
    let view1 = UIView()
    let view2 = UIView()
    let view3 = UIView()

    var constraints: [NSLayoutConstraint]?

    override func setUp() {
        super.setUp()

        superview.addSubview(view1)
        superview.addSubview(view2)
        superview.addSubview(view3)
    }

    override func tearDown() {
        super.tearDown()
        if let constraints = constraints {
            constraints.map { $0.active = true }
        }
    }
}