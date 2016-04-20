[![Swift](https://img.shields.io/badge/Swift-2.2-orange.svg?style=flat)](https://developer.apple.com/swift/)
[![Platforms](https://img.shields.io/badge/platform-osx%20%7C%20ios-lightgrey.svg)](https://developer.apple.com/swift/)
[![License](https://img.shields.io/badge/license-MIT-71787A.svg)](https://tldrlegal.com/license/mit-license)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
![banner](http://pyroh.github.io/ressources/CoreGeometry/Banner.png)
## Goals
`CoreGeometry` is a collection of helpers, extensions, types or even operators that make `CoreGraphics` programming easier.  
`CoreGeometry` isn't focused on drawing but (as its name suggests) helps the programmer to deal with angles, rectangles, points, vectors and any rotation or translation that could happen to them. It also introduces `CGAngle` a struct that contains an angle value and make angle rotations and algebra easier. 

## Requirements
- OS X 10.10+ / iOS 8.0+
- Xcode 7.3+
- Swift 2.2

## Setup
### Using Carthage
Add `github "Pyroh/CoreGeometry ~> 1.0"` to your `Cartfile` and run `carthage update`. If you need help using Carthage you can take a look at their [Getting Started](https://github.com/Carthage/Carthage#getting-started) section.

### Manually
1. Clone this repository.
2. Build the `CoreGeometry` project.
3. Add the resulting `framework` file to your project.
4. ?
5. Profit.

## Quickstart
> Because every view on iOS is flipped by default keep in mind that `CGAngle` objects rotate clockwise. On OS X they rotate counter-clockwise as expected.

Once you `import CoreGeometry` you gain access to a lot of things:

### `CGAngle`
`CGAngle` is the missing type of `CoreGraphics`. It's designed the way `CGFloat` is designed and can be used flawlessly as any numeric value. It's as easy as writing `let angle: CGAngle = 2.234`. You want to use the value as a `CGFloat` ? It's easy: `angle.native`

#### Properties
- `native` (`CGFloat` *get* *set*) is the native value.
- `degree` (`CGFloat` *get* *set*) is the angle value in degrees.
- `normalized` (`CGAngle` *get*) is the normalized value in radians normalized in range `0..<2π`.

#### Constants
Besides `CGAngleZero` you can find four additional constant:

<table>
<tr><th>Constant</th><th>Radians</th><th>Degrees</th></tr>
<tr><td><code>PI_4</code></td><td>π/4</td><td>45°</td></tr>
<tr><td><code>PI_2</code></td><td>π/2</td><td>90°</td></tr>
<tr><td><code>PI</code></td><td>π</td><td>180°</td></tr>
<tr><td><code>PI2</code></td><td>2π</td><td>360°</td></tr>
</table>

#### Algebra
You can use `+-*/%` between any `CGAngle` or `CGFloat` instances and even integer or float literals. It always returns a `CGAngle` instance.

#### The `°` operator
If writing `let angle: CGAngle = 2.234` is easy, writing `let angle = 128°` is easier ! Who doesn't fluently speak radians can now express itself freely in degrees. The `°` operator is designed to take any numerical value, treat it as an angle value in degrees and return the corresponding `CGAngle` instance.  

### Extensions
> Like any other struct of `CoreGraphics` numerical values passed to `CoreGeometry`'s struct methods or initializers can be either of type `Int`, `Double` or `CGFloat`.

#### `CGPoint`
##### Rotate
You can get a copy of a `CGPoint` rotated around a center:
```Swift
let point = CGPoint(x: 10, y: 10)
// {x: -10 y: -10}
let rotated = point.rotated(relativeTo: CGPointZero, by: CGAngle.PI)
```

Or you can do it *in place*:
```Swift
var point = CGPoint(x: 10, y: 10)
// {x: -10 y: -10}
point.rotateInPlace(relativeTo: CGPointZero, by: CGAngle.PI)
```

##### Translate
You can also get a copy of a translated `CGPoint`:
```Swift
let point = CGPoint(x: 10, y: 10)
// {x: 20 y: 20}
let translated = point.translated(byTx: 10, ty: 10)
```

Or you can do it *in place*:
```Swift
var point = CGPoint(x: 10, y: 10)
// {x: 20 y: 20}
point.translateInPlace(byTx: 10, ty: 10)
```

(These methods also accept one `CGVector` argument)

##### Misc.
Speaking of vectors you can get the vector that exists between 2 `CGPoints`:
```Swift
let point = CGPoint(x: 10, y: 10)
// {dx: 10 dy: 10}
point.getVector(CGPoint(x: 20, y: 20))
```

#### `CGRect`
##### Rotate & translate
As `CGPoint` you can rotate and translate any `CGRect` instance:

```Swift
let rect1 = CGRect(x: 10, y: 10, width: 50, height: 50)
// {x -60 y 10 w 50 h 50}
let rect2 = rect1.rotated(relativeTo: CGPointZero, by: 90°)

var rect3 = CGRect(x: 10, y: 10, width: 50, height: 50)
// {x -60 y 10 w 50 h 50}
rect3.rotateInPlace(relativeTo: CGPointZero, by: 90°)

let rect4 = CGRect(x: 10, y: 10, width: 50, height: 50)
// {x 20 y 20 w 50 h 50}
let rect5 = rect4.translated(byTx: 10, ty: 10)

var rect6 = CGRect(x: 10, y: 10, width: 50, height: 50)
// {x 20 y 20 w 50 h 50}
rect6.translateInPlace(tx: 10, ty: 10)
```

##### Center
With `CoreGeometry` you have now access to a new property: `center`. It's of type `CGPoint` and represents the rect's center:

```Swift
// {x 20 y 20}
CGRect(x: 0, y: 0, width: 40, height: 40).center
```

You also can initialize a `CGRect` instance specifying its center rather than its origin:

```Swift
// {x 0 y 0 w 40 h 40}
CGRect(center: CGPoint(x: 20, y: 20), size: CGSize(width: 40, height: 40))
```

If you want to align a rect's center with a point you just do:
```Swift
let rect = CGRect(center: CGPoint(x: 20, y: 20), size: CGSize(width: 40, height: 40))
// {x -20 y -20 w 40 h 40}
let centered = rect.centered(at: CGPointZero)
```

Or *in place*:
```Swift
var rect = CGRect(center: CGPoint(x: 20, y: 20), size: CGSize(width: 40, height: 40))
// {x -20 y -20 w 40 h 40}
rect.centerInPlace(CGPointZero)
```

##### Slide
Finally you should want to translate a rect circularly around a point you can, in `CoreGeometry` it's called *sliding*:

```Swift
let rect = CGRect(center: CGPoint(x: 60, y: 60), size: CGSize(width: 40, height: 40))
// {x -80 y 40 w 40 h 40}
let slided = rect.slided(relativeTo: CGPointZero, by: 90°)
```

Of course it's also do-able *in place*:
```Swift
var rect = CGRect(center: CGPoint(x: 60, y: 60), size: CGSize(width: 40, height: 40))
// {x -80 y 40 w 40 h 40}
rect.slideInPlace(relativeTo: CGPointZero, by: 90°)
```

#### `CGSize`
Besides an initializer `CoreGeometry` brings only to `CGSize` `*` and `/` operators to  that make possible things like these:

```Swift
// See ? New initializer ! 
// {w 22 h 22}
let size = CGSize(square: 22)
// {w 44 h 44}
size * 2
// {w 11 h 11}
size / 2
```

#### `CGVector`
You can now retrieve vector's magnitude and orientation easily:

```Swift
let vector = CGVector(dx: 10, dy: 10)
// 45°
let direction = vector.direction.degree
// 10√2
let magnitude = vector.magnitude
```

And if you want to reverse a vector:
```Swift
let vector = CGVector(dx: 23, dy: 23)
// {dx: -23 dy: -23}
let reversed = vector.reversed()
```

As usual you can do it *in place*:
```Swift
var vector = CGVector(dx: 23, dy: 23)
// {dx: -23 dy: -23}
vector.reverseInPlace()
```

### Operators
`CoreGeometry` brings three other operators in addition to `°`.

#### ±
This operator return `true` if `-rhs < lhs > rhs`, `false ` otherwise.

#### ±=
This operator return `true` if `-rhs ≤ lhs ≥ rhs`, `false ` otherwise.

#### =~ 
This operator where solely made to test `CoreGeometry` functionalities.  
When using rotations and matrix calculation and due to floats rounding sometimes values that should be equal are not. Thanks to the `=~` operator we can easily test if a `CGAngle` is *barely* equal to another.  
Feel free to use it as you wish.

## License
`CoreGeometry` is released under the MIT license. See LICENSE for details. 

## Contributing
Feel free to contribute by making pull-requests.  
