# AutoLayoutBuilder
A DSL for Apple's Auto-Layout written in Swift

## Why use AutoLayoutBuilder?
* **Expressive** - Constraints are extremely readable and concise
* **Fast** - Write fewer lines of code, and shorter ones at that
* **Safe** - Invalid constraints are compiler errors

## Examples

````Swift
// Example: Left equals right
let constraints = view1[.Left] == view2[.Right]

// Example: Left equals right with margin
let constraints = view1[.Left] == view2[.Right] + 10

// Example: Equal centers
let constraints = view1[.Center] == view2[.Center]

// Example: Equal edges
let constraints = view1[.Edges] == view2[.Edges]

// Example: Equal edges with margin
let constraints = view1[.Edges] == view2[.Edges] - 5

// Example: Equal sizes
let constraints = view1[.Size] == view2[.Size]

// Example: Fixed size
let constraints = view1[.Size] == CGSize(width: 50, height: 20)

// Example: Equal widths
let constraints = view1[.Width] == view2[.Width]

// Example: Equal width and height
let constraints = view1[.Width] == view1[.Height]

// Example: Horizontal layout
let constraints = .Hoirzontal ~ view1 | 5 | view2 | 5 | view3

// Example: Vertical layout
let constraints = .Vertical ~ view1 | 5 | view2 | 5 | view3
