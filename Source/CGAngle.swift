//
//  CGAngle.swift
//  TestIOS1
//
//  Created by Pierre TACCHI on 31/03/16.
//  Copyright © 2016 Pyrolyse. All rights reserved.
//

@_exported import CoreGraphics

internal let CG_PI_4 = CGFloat(M_PI_4)
internal let CG_PI_2 = CGFloat(M_PI_2)
internal let CG_PI = CGFloat(M_PI)
internal let CG_2_PI = 2.0 * CGFloat(M_PI)

public var CGAngleZero: CGAngle { return CGAngle() }

/**
 A structure that contains an angle value in radian.
 */
public struct CGAngle {
        /// The angle native value in radian.
    public var native: CGFloat

    @_transparent public init() {
        self.native = 0.0
    }

    @_transparent public init(_ value: CGFloat) {
        self.native = value
    }

    @_transparent public init(degree: CGFloat) {
        self.native = degree / 180 * CG_PI
    }
}

extension CGAngle {
        /// The normalized value in `0..<2π`
    public var normalized: CGAngle {
        @_transparent get {
            return CGAngle((CG_2_PI + native % CG_2_PI) % CG_2_PI)
        }
    }

        /// The angle value in degrees.
    @_transparent
    public var degree: CGFloat {
        get {
            return self.native * 180.0 / CG_PI
        }
        set {
            self = degree°
        }
    }

        /// The sine value of the angle.
    public var sin: CGFloat {
        @_transparent
        get {
            return CoreGeometry.sin(self)
        }
    }

        /// The cosine value of the angle.
    public var cos: CGFloat {
        @_transparent
        get {
            return CoreGeometry.cos(self)
        }
    }

        /// The tangent value of the angle.
    public var tan: CGFloat {
        @_transparent
        get {
            return CoreGeometry.tan(self)
        }
    }

    @_transparent public init(_ value: Float) {
        self.native = CGFloat(value)
    }

    @_transparent public init(_ value: Double) {
        self.native = CGFloat(value)
    }
}

extension CGAngle {
    @_transparent public init(degree: Float) {
        self.native = CGFloat(degree) / 180 * CG_PI
    }

    @_transparent public init(degree: Double) {
        self.native = CGFloat(degree) / 180 * CG_PI
    }

    @_transparent public init(degree: UInt8) {
        self.native = CGFloat(degree) / 180 * CG_PI
    }

    @_transparent public init(degree: Int8) {
        self.native = CGFloat(degree) / 180 * CG_PI
    }

    @_transparent public init(degree: UInt16) {
        self.native = CGFloat(degree) / 180 * CG_PI
    }

    @_transparent public init(degree: Int16) {
        self.native = CGFloat(degree) / 180 * CG_PI
    }

    @_transparent public init(degree: UInt32) {
        self.native = CGFloat(degree) / 180 * CG_PI
    }

    @_transparent public init(degree: Int32) {
        self.native = CGFloat(degree) / 180 * CG_PI
    }

    @_transparent public init(degree: UInt64) {
        self.native = CGFloat(degree) / 180 * CG_PI
    }

    @_transparent public init(degree: Int64) {
        self.native = CGFloat(degree) / 180 * CG_PI
    }

    @_transparent public init(degree: UInt) {
        self.native = CGFloat(degree) / 180 * CG_PI
    }

    @_transparent public init(degree: Int) {
        self.native = CGFloat(degree) / 180 * CG_PI
    }
}

extension CGAngle {
    @_transparent public static var min: CGAngle {
            return CGAngle(CGFloat.min)
    }

    @_transparent public static var max: CGAngle {
        return CGAngle(CGFloat.max)
    }
}

extension CGAngle: Strideable {
    @warn_unused_result
    public func advancedBy(n: CGAngle) -> CGAngle {
        return CGAngle(self.native + n.native)
    }

    @warn_unused_result
    public func distanceTo(other: CGAngle) -> CGAngle {
        return CGAngle(other.native - self.native)
    }
}

extension CGAngle: FloatingPointType {
    public typealias _BitsType = UInt

    public static func _fromBitPattern(bits: UInt) -> CGAngle {
        return CGAngle(CGFloat._fromBitPattern(CGFloat._BitsType(bits)))
    }

    public func _toBitPattern() -> UInt {
        return UInt(native._toBitPattern())
    }

    @_transparent public init(_ value: UInt8) {
        self.native = CGFloat(value)
    }

    @_transparent public init(_ value: Int8) {
        self.native = CGFloat(value)
    }

    @_transparent public init(_ value: UInt16) {
        self.native = CGFloat(value)
    }

    @_transparent public init(_ value: Int16) {
        self.native = CGFloat(value)
    }

    @_transparent public init(_ value: UInt32) {
        self.native = CGFloat(value)
    }

    @_transparent public init(_ value: Int32) {
        self.native = CGFloat(value)
    }

    @_transparent public init(_ value: UInt64) {
        self.native = CGFloat(value)
    }

    @_transparent public init(_ value: Int64) {
        self.native = CGFloat(value)
    }

    @_transparent public init(_ value: UInt) {
        self.native = CGFloat(value)
    }

    @_transparent public init(_ value: Int) {
        self.native = CGFloat(value)
    }

    public static var infinity: CGAngle {
        return CGAngle(CGFloat.infinity)
    }

    public static var NaN: CGAngle {
        return CGAngle(CGFloat.NaN)
    }

    public static var quietNaN: CGAngle {
        return CGAngle(CGFloat.quietNaN)
    }

    public var isSignMinus: Bool {
        return native.isSignMinus
    }

    public var isNormal: Bool {
        return native.isNormal
    }

    public var isFinite: Bool {
        return native.isFinite
    }

    public var isZero: Bool {
        return native.isZero
    }

    public var isSubnormal: Bool {
        return native.isSubnormal
    }

    public var isInfinite: Bool {
        return native.isInfinite
    }

    public var isNaN: Bool {
        return native.isNaN
    }

    public var isSignaling: Bool {
        return native.isSignaling
    }

    public var floatingPointClass: FloatingPointClassification {
        return native.floatingPointClass
    }
}

extension CGAngle {
        /// An angle contant with value of π/4
    public static var PI_4: CGAngle {
        return CGAngle(M_PI_4)
    }

        /// An angle contant with value of π/2
    public static var PI_2: CGAngle {
        return CGAngle(M_PI_2)
    }

        /// An angle contant with value of π
    public static var PI: CGAngle {
        return CGAngle(M_PI)
    }

        /// An angle contant with value of 2π
    public static var PI2: CGAngle {
        return CGAngle(CG_2_PI)
    }
}

@available(*, unavailable, message="use CGAngle.min")
public var CGFLOAT_MIN: CGAngle {
    fatalError("can't retrieve unavailable property")
}

@available(*, unavailable, message="use CGAngle.max")
public var CGFLOAT_MAX: CGAngle {
    fatalError("can't retrieve unavailable property")
}

extension CGAngle: CustomReflectable {
    public func customMirror() -> Mirror {
        return Mirror(reflecting: native)
    }
}

@_transparent extension CGAngle: CustomStringConvertible {
    public var description: String {
        return native.description
    }
}

@_transparent extension CGAngle: Hashable {
    public var hashValue: Int {
        return native.hashValue
    }
}

@_transparent extension CGAngle: FloatLiteralConvertible {
    /// Create an instance initialized to `value`.
    public init(floatLiteral value: CGFloat.NativeType) {
        self = CGAngle(value)
    }
}

@_transparent extension CGAngle: IntegerLiteralConvertible {
    /// Create an instance initialized to `value`.
    public init(integerLiteral value: Int) {
        self = CGAngle(value)
    }
}

@_transparent extension CGAngle: AbsoluteValuable {
    /// Returns the absolute value of `x`
    @_transparent
    @warn_unused_result
    public static func abs(x: CGAngle) -> CGAngle {
        return CGAngle(CGFloat.abs(x.native))
    }
}

@_transparent extension UInt8 {
    public init(_ value: CGAngle) {
        self = UInt8(value.native)
    }
}

@_transparent extension Int8 {
    public init(_ value: CGAngle) {
        self = Int8(value.native)
    }
}

@_transparent extension UInt16 {
    public init(_ value: CGAngle) {
        self = UInt16(value.native)
    }
}


@_transparent extension Int16 {
    public init(_ value: CGAngle) {
        self = Int16(value.native)
    }
}

@_transparent extension UInt32 {
    public init(_ value: CGAngle) {
        self = UInt32(value.native)
    }
}

@_transparent extension Int32 {
    public init(_ value: CGAngle) {
        self = Int32(value.native)
    }
}

@_transparent extension UInt64 {
    public init(_ value: CGAngle) {
        self = UInt64(value.native)
    }
}

@_transparent extension Int64 {
    public init(_ value: CGAngle) {
        self = Int64(value.native)
    }
}

@_transparent extension UInt {
    public init(_ value: CGAngle) {
        self = UInt(value.native)
    }
}

@_transparent extension Int {
    public init(_ value: CGAngle) {
        self = Int(value.native)
    }
}


@_transparent extension Double {
    public init(_ value: CGAngle) {
        self = Double(value.native)
    }
}

@_transparent extension Float {
    public init(_ value: CGAngle) {
        self = Float(value.native)
    }
}

@_transparent extension CGFloat {
    public init(_ value: CGAngle) {
        self = value.native
    }
}

// Comparisons.
@_transparent extension CGAngle: Equatable { }

@_transparent
@warn_unused_result
public func ==(lhs: CGAngle, rhs: CGAngle) -> Bool {
    return lhs.native == rhs.native
}

@_transparent
@warn_unused_result
public func =~(lhs: CGAngle, rhs: CGAngle) -> Bool {
    return lhs.normalized.native - rhs.normalized.native ± CGFloat(FLT_EPSILON)
}

@_transparent extension CGAngle: Comparable { }

@_transparent
@warn_unused_result
public func <(lhs: CGAngle, rhs: CGAngle) -> Bool {
    return lhs.native < rhs.native
}

// CGAngle unary operators
@_transparent
@warn_unused_result
public prefix func + (x: CGAngle) -> CGAngle { return x }

@_transparent
@warn_unused_result
public prefix func - (x: CGAngle) -> CGAngle { return CGAngle(-x.native) }

@_transparent
public prefix func ++ (inout x: CGAngle) -> CGAngle {
    x.native = CGAngle(x.native + 1.0).native
    return x
}

@_transparent
public prefix func -- (inout x: CGAngle) -> CGAngle {
    x.native = CGAngle(x.native - 1.0).native
    return x
}

@_transparent
public postfix func ++ (inout x: CGAngle) -> CGAngle {
    let tmp = x
    x.native = CGAngle(x.native + 1.0).native
    return tmp
}

@_transparent
public postfix func -- (inout x: CGAngle) -> CGAngle {
    let tmp = x
    x.native = CGAngle(x.native - 1.0).native
    return tmp
}

// CGAngle arithmetic
@_transparent
@warn_unused_result
public func +(lhs: CGAngle, rhs: CGAngle) -> CGAngle {
    return CGAngle(lhs.native + rhs.native)
}

@_transparent
@warn_unused_result
public func +(lhs: CGAngle, rhs: CGFloat) -> CGAngle {
    return CGAngle(lhs.native + rhs)
}

@_transparent
@warn_unused_result
public func -(lhs: CGAngle, rhs: CGAngle) -> CGAngle {
    return CGAngle(lhs.native - rhs.native)
}

@_transparent
@warn_unused_result
public func -(lhs: CGAngle, rhs: CGFloat) -> CGAngle {
    return CGAngle(lhs.native + rhs)
}

@_transparent
@warn_unused_result
public func *(lhs: CGAngle, rhs: CGAngle) -> CGAngle {
    return CGAngle(lhs.native * rhs.native)
}

@_transparent
@warn_unused_result
public func *(lhs: CGAngle, rhs: CGFloat) -> CGAngle {
    return CGAngle(lhs.native + rhs)
}

@_transparent
@warn_unused_result
public func /(lhs: CGAngle, rhs: CGAngle) -> CGAngle {
    return CGAngle(lhs.native / rhs.native)
}
@_transparent
@warn_unused_result
public func /(lhs: CGAngle, rhs: CGFloat) -> CGAngle {
    return CGAngle(lhs.native + rhs)
}

@_transparent
@warn_unused_result
public func %(lhs: CGAngle, rhs: CGAngle) -> CGAngle {
    return CGAngle(lhs.native % rhs.native)
}

@_transparent
@warn_unused_result
public func %(lhs: CGAngle, rhs: CGFloat) -> CGAngle {
    return CGAngle(lhs.native + rhs)
}

// CGAngle assignment operators.
@_transparent
public func +=(inout lhs: CGAngle, rhs: CGAngle) {
    lhs.native = CGAngle(lhs.native + rhs.native).native
}

@_transparent
public func +=(inout lhs: CGAngle, rhs: CGFloat) {
    lhs.native = CGAngle(lhs.native + rhs).native
}

@_transparent
public func -=(inout lhs: CGAngle, rhs: CGAngle) {
    lhs.native = CGAngle(lhs.native - rhs.native).native
}

@_transparent
public func -=(inout lhs: CGAngle, rhs: CGFloat) {
    lhs.native = CGAngle(lhs.native + rhs).native
}

@_transparent
public func *=(inout lhs: CGAngle, rhs: CGAngle) {
    lhs.native = CGAngle(lhs.native * rhs.native).native
}

@_transparent
public func *=(inout lhs: CGAngle, rhs: CGFloat) {
    lhs.native = CGAngle(lhs.native + rhs).native
}

@_transparent
public func /=(inout lhs: CGAngle, rhs: CGAngle) {
    lhs.native = CGAngle(lhs.native / rhs.native).native
}

@_transparent
public func /=(inout lhs: CGAngle, rhs: CGFloat) {
    lhs.native = CGAngle(lhs.native + rhs).native
}

@_transparent
public func %=(inout lhs: CGAngle, rhs: CGAngle) {
    lhs.native = CGAngle(lhs.native % rhs.native).native
}

@_transparent
public func %=(inout lhs: CGAngle, rhs: CGFloat) {
    lhs.native = CGAngle(lhs.native + rhs).native
}

// CGAngle tgmath.

@_transparent
@warn_unused_result
public func acos(x: CGFloat) -> CGAngle {
    return CGAngle(acos(x))
}

@_transparent
@warn_unused_result
public func cos(x: CGAngle) -> CGFloat {
    return cos(x.native)
}

@_transparent
@warn_unused_result
public func sin(x: CGAngle) -> CGFloat {
    return sin(x.native)
}

@_transparent
@warn_unused_result
public func asin(x: CGFloat) -> CGAngle {
    return CGAngle(asin(x))
}

@_transparent
@warn_unused_result
public func atan(x: CGFloat) -> CGAngle {
    return CGAngle(atan(x))
}

@_transparent
@warn_unused_result
public func tan(x: CGAngle) -> CGFloat {
    return tan(x.native)
}

@_transparent
@warn_unused_result
public func acosh(x: CGFloat) -> CGAngle {
    return CGAngle(acosh(x))
}

@_transparent
@warn_unused_result
public func asinh(x: CGFloat) -> CGAngle {
    return CGAngle(asinh(x))
}

@_transparent
@warn_unused_result
public func atanh(x: CGFloat) -> CGAngle {
    return CGAngle(atanh(x))
}

@_transparent
@warn_unused_result
public func cosh(x: CGAngle) -> CGFloat {
    return cosh(x.native)
}

@_transparent
@warn_unused_result
public func sinh(x: CGAngle) -> CGFloat {
    return sinh(x.native)
}

@_transparent
@warn_unused_result
public func tanh(x: CGAngle) -> CGFloat {
    return tanh(x.native)
}

@_transparent
@warn_unused_result
public func exp(x: CGAngle) -> CGAngle {
    return CGAngle(exp(x.native))
}

@_transparent
@warn_unused_result
public func exp2(x: CGAngle) -> CGAngle {
    return CGAngle(exp2(x.native))
}

@_transparent
@warn_unused_result
public func expm1(x: CGAngle) -> CGAngle {
    return CGAngle(expm1(x.native))
}

@_transparent
@warn_unused_result
public func log(x: CGAngle) -> CGAngle {
    return CGAngle(log(x.native))
}

@_transparent
@warn_unused_result
public func log10(x: CGAngle) -> CGAngle {
    return CGAngle(log10(x.native))
}

@_transparent
@warn_unused_result
public func log2(x: CGAngle) -> CGAngle {
    return CGAngle(log2(x.native))
}

@_transparent
@warn_unused_result
public func log1p(x: CGAngle) -> CGAngle {
    return CGAngle(log1p(x.native))
}

@_transparent
@warn_unused_result
public func logb(x: CGAngle) -> CGAngle {
    return CGAngle(logb(x.native))
}

@_transparent
@warn_unused_result
public func cbrt(x: CGAngle) -> CGAngle {
    return CGAngle(cbrt(x.native))
}

@_transparent
@warn_unused_result
public func erf(x: CGAngle) -> CGAngle {
    return CGAngle(erf(x.native))
}

@_transparent
@warn_unused_result
public func erfc(x: CGAngle) -> CGAngle {
    return CGAngle(erfc(x.native))
}

@_transparent
@warn_unused_result
public func tgamma(x: CGAngle) -> CGAngle {
    return CGAngle(tgamma(x.native))
}

@_transparent
@warn_unused_result
public func fabs(x: CGAngle) -> CGAngle {
    return CGAngle(fabs(x.native))
}

@_transparent
@warn_unused_result
public func sqrt(x: CGAngle) -> CGAngle {
    return CGAngle(sqrt(x.native))
}

@_transparent
@warn_unused_result
public func ceil(x: CGAngle) -> CGAngle {
    return CGAngle(ceil(x.native))
}

@_transparent
@warn_unused_result
public func floor(x: CGAngle) -> CGAngle {
    return CGAngle(floor(x.native))
}

@_transparent
@warn_unused_result
public func nearbyint(x: CGAngle) -> CGAngle {
    return CGAngle(nearbyint(x.native))
}

@_transparent
@warn_unused_result
public func rint(x: CGAngle) -> CGAngle {
    return CGAngle(rint(x.native))
}

@_transparent
@warn_unused_result
public func round(x: CGAngle) -> CGAngle {
    return CGAngle(round(x.native))
}

@_transparent
@warn_unused_result
public func trunc(x: CGAngle) -> CGAngle {
    return CGAngle(trunc(x.native))
}

@_transparent
@warn_unused_result
public func atan2(lhs: CGAngle, _ rhs: CGAngle) -> CGAngle {
    return CGAngle(atan2(lhs.native, rhs.native))
}

@_transparent
@warn_unused_result
public func hypot(lhs: CGAngle, _ rhs: CGAngle) -> CGAngle {
    return CGAngle(hypot(lhs.native, rhs.native))
}

@_transparent
@warn_unused_result
public func pow(lhs: CGAngle, _ rhs: CGAngle) -> CGAngle {
    return CGAngle(pow(lhs.native, rhs.native))
}

@_transparent
@warn_unused_result
public func fmod(lhs: CGAngle, _ rhs: CGAngle) -> CGAngle {
    return CGAngle(fmod(lhs.native, rhs.native))
}

@_transparent
@warn_unused_result
public func remainder(lhs: CGAngle, _ rhs: CGAngle) -> CGAngle {
    return CGAngle(remainder(lhs.native, rhs.native))
}

@_transparent
@warn_unused_result
public func copysign(lhs: CGAngle, _ rhs: CGAngle) -> CGAngle {
    return CGAngle(copysign(lhs.native, rhs.native))
}

@_transparent
@warn_unused_result
public func nextafter(lhs: CGAngle, _ rhs: CGAngle) -> CGAngle {
    return CGAngle(nextafter(lhs.native, rhs.native))
}

@_transparent
@warn_unused_result
public func fdim(lhs: CGAngle, _ rhs: CGAngle) -> CGAngle {
    return CGAngle(fdim(lhs.native, rhs.native))
}

@_transparent
@warn_unused_result
public func fmax(lhs: CGAngle, _ rhs: CGAngle) -> CGAngle {
    return CGAngle(fmax(lhs.native, rhs.native))
}

@_transparent
@warn_unused_result
public func fmin(lhs: CGAngle, _ rhs: CGAngle) -> CGAngle {
    return CGAngle(fmin(lhs.native, rhs.native))
}

@_transparent
@warn_unused_result
public func fpclassify(x: CGAngle) -> Int {
    return fpclassify(x.native)
}

@_transparent
@warn_unused_result
public func isnormal(x: CGAngle) -> Bool {
    return isnormal(x.native)
}

@_transparent
@warn_unused_result
public func isfinite(x: CGAngle) -> Bool {
    return isfinite(x.native)
}

@_transparent
@warn_unused_result
public func isinf(x: CGAngle) -> Bool {
    return isinf(x.native)
}

@_transparent
@warn_unused_result
public func isnan(x: CGAngle) -> Bool {
    return isnan(x.native)
}

@_transparent
@warn_unused_result
public func signbit(x: CGAngle) -> Int {
    return signbit(x.native)
}

@_transparent
@warn_unused_result
public func modf(x: CGAngle) -> (CGAngle, CGAngle) {
    let (ipart, fpart) = modf(x.native)
    return (CGAngle(ipart), CGAngle(fpart))
}

@_transparent
@warn_unused_result
public func ldexp(x: CGAngle, _ n: Int) -> CGAngle {
    return CGAngle(ldexp(x.native, n))
}

@_transparent
@warn_unused_result
public func frexp(x: CGAngle) -> (CGAngle, Int) {
    let (frac, exp) = frexp(x.native)
    return (CGAngle(frac), exp)
}

@_transparent
@warn_unused_result
public func ilogb(x: CGAngle) -> Int {
    return ilogb(x.native)
}

@_transparent
@warn_unused_result
public func scalbn(x: CGAngle, _ n: Int) -> CGAngle {
    return CGAngle(scalbn(x.native, n))
}

@_transparent
@warn_unused_result
public func lgamma(x: CGAngle) -> (CGAngle, Int) {
    let (value, sign) = lgamma(x.native)
    return (CGAngle(value), sign)
}

@_transparent
@warn_unused_result
public func remquo(x: CGAngle, _ y: CGAngle) -> (CGAngle, Int) {
    let (rem, quo) = remquo(x.native, y.native)
    return (CGAngle(rem), quo)
}

@_transparent
@warn_unused_result
public func nan(tag: String) -> CGAngle {
    return CGAngle(nan(tag) as CGFloat)
}

@_transparent
@warn_unused_result
public func fma(x: CGAngle, _ y: CGAngle, _ z: CGAngle) -> CGAngle {
    return CGAngle(fma(x.native, y.native, z.native))
}

@_transparent
@warn_unused_result
public func j0(x: CGAngle) -> CGAngle {
    return CGAngle(j0(Double(x.native)))
}

@_transparent
@warn_unused_result
public func j1(x: CGAngle) -> CGAngle {
    return CGAngle(j1(Double(x.native)))
}

@_transparent
@warn_unused_result
public func jn(n: Int, _ x: CGAngle) -> CGAngle {
    return CGAngle(jn(n, Double(x.native)))
}

@_transparent
@warn_unused_result
public func y0(x: CGAngle) -> CGAngle {
    return CGAngle(y0(Double(x.native)))
}

@_transparent
@warn_unused_result
public func y1(x: CGAngle) -> CGAngle {
    return CGAngle(y1(Double(x.native)))
}

@_transparent
@warn_unused_result
public func yn(n: Int, _ x: CGAngle) -> CGAngle {
    return CGAngle(yn(n, Double(x.native)))
}

@_transparent
extension CGAngle: _CVarArgPassedAsDouble {
    /// Transform `self` into a series of machine words that can be
    /// appropriately interpreted by C varargs
    public var _cVarArgEncoding: [Int] {
        return native._cVarArgEncoding
    }

    /// Return the required alignment in bytes of
    /// the value returned by `_cVarArgEncoding`.
    public var _cVarArgAlignment: Int {
        return native._cVarArgAlignment
    }
}
