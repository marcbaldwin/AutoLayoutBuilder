# AutoLayoutBuilder [![Build Status](https://travis-ci.org/marcbaldwin/AutoLayoutBuilder.svg?branch=master)](https://travis-ci.org/marcbaldwin/AutoLayoutBuilder)
A DSL for Apple's Auto-Layout written in Swift

## Why use AutoLayoutBuilder?
* **Expressive** - Constraints are extremely readable and concise
* **Fast** - Write fewer lines of code, and shorter ones at that
* **Safe** - Invalid constraints are compiler errors
* **Flexible** - Attributes are supplied as arguments, so can be varied at runtime

## Examples

````Swift
// Example: Left equals right
let constraints = view1[.Left] == view2[.Right]

// Example: Center X of view1, view2 and view3 equal to center X of view4
let constraints = Group(view1, view2, view3)[.CenterX] == view4[.CenterX]

// Example: Left equals left with margin
let constraints = view1[.Left] == view2[.Left] + 10

// Example: Equal X and Y centers
let constraints = view1[.Center] == view2[.Center]

// Example: Equal X centers with margin
let constraints = view1[.CenterX] == view2[.CenterX] - 10

// Example: CenterY equals Top with margin
let constraints = view1[.CenterY] == view2[.Top] - 10

// Example: Equal edges
let constraints = view1[.Edges] == view2[.Edges]

// Example: Equal edges with margin
let constraints = view1[.Edges] == view2[.Edges] - 5

// Example: Equal sizes
let constraints = view1[.Size] == view2[.Size]

// Example: Greater than or equal sizes
let constraints = view1[.Size] >= view2[.Size]

// Example: Relative sizes
let constraints = view1[.Size] == view2[.Size] * 0.5

// Example: Fixed size
let constraints = view1[.Size] == CGSize(width: 50, height: 20)

// Example: Equal widths
let constraints = view1[.Width] == view2[.Width]

// Example: Equal width and height
let constraints = view1[.Width] == view1[.Height]

// Example: Horizontal layout with margins
let constraints = .Hoirzontal ~ view1 | 5 | view2 | 5 | view3

// Example: Vertical layout with margins
let constraints = .Vertical ~ view1 | 5 | view2 | 5 | view3
