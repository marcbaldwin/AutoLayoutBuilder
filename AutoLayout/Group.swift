import Foundation
import UIKit

public struct Group {
    let views: [UIView]

    public init(_ views: [UIView]) {
        self.views = views
    }

    public init(_ views: UIView...) {
        self.views = views
    }
}