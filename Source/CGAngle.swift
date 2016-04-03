//
//  CGAngle.swift
//  TestIOS1
//
//  Created by Pierre TACCHI on 31/03/16.
//  Copyright © 2016 Pyrolyse. All rights reserved.
//

import CoreGraphics

public struct CGAngle {
    #if arch(i386) || arch(arm)
    public typealias NativeType = Float
    #elseif arch(x86_64) || arch(arm64)
    public typealias NativeType = Double
    #endif
    
    @_transparent public init() {
        self.native = 0.0
    }
    
    @_transparent public init(_ value: Float) {
        self.native = NativeType(value)
    }
    
    @_transparent public init(_ value: Double) {
        self.native = NativeType(value)
    }
    
    /// The native value.
    public var native: NativeType
}

extension CGAngle {
    @_transparent public static var min: CGAngle {
        #if arch(i386) || arch(arm)
            return CGAngle(FLT_MIN)
        #else
            return CGAngle(DBL_MIN)
        #endif
    }
    
    @_transparent public static var max: CGAngle {
        #if arch(i386) || arch(arm)
            return CGAngle(FLT_MAX)
        #else
            return CGAngle(DBL_MAX)
        #endif
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
        return CGAngle(NativeType._fromBitPattern(NativeType._BitsType(bits)))
    }
    
    public func _toBitPattern() -> UInt {
        return UInt(native._toBitPattern())
    }
    
    @_transparent public init(_ value: UInt8) {
        self.native = NativeType(value)
    }
    
    @_transparent public init(_ value: Int8) {
        self.native = NativeType(value)
    }
    
    @_transparent public init(_ value: UInt16) {
        self.native = NativeType(value)
    }
    
    @_transparent public init(_ value: Int16) {
        self.native = NativeType(value)
    }
    
    @_transparent public init(_ value: UInt32) {
        self.native = NativeType(value)
    }
    
    @_transparent public init(_ value: Int32) {
        self.native = NativeType(value)
    }
    
    @_transparent public init(_ value: UInt64) {
        self.native = NativeType(value)
    }
    
    @_transparent public init(_ value: Int64) {
        self.native = NativeType(value)
    }
    
    @_transparent public init(_ value: UInt) {
        self.native = NativeType(value)
    }
    
    @_transparent public init(_ value: Int) {
        self.native = NativeType(value)
    }
    
    public static var infinity: CGAngle {
        return CGAngle(NativeType.infinity)
    }
    
    public static var NaN: CGAngle {
        return CGAngle(NativeType.NaN)
    }
    
    public static var quietNaN: CGAngle {
        return CGAngle(NativeType.quietNaN)
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

@available(*,unavailable,message="use CGAngle.min")
public var CGFLOAT_MIN: CGAngle {
    fatalError("can't retrieve unavailable property")
}

@available(*,unavailable,message="use CGAngle.max")
public var CGFLOAT_MAX: CGAngle {
    fatalError("can't retrieve unavailable property")
}

extension CGAngle: CustomReflectable {
    /// Returns a mirror that reflects `self`.
    public func customMirror() -> Mirror {
        return Mirror(reflecting: native)
    }
}

@_transparent extension CGAngle: CustomStringConvertible {
    /// A textual representation of `self`.
    public var description: String {
        return native.description
    }
}

@_transparent extension CGAngle: Hashable {
    /// The hash value.
    ///
    /// **Axiom:** `x == y` implies `x.hashValue == y.hashValue`
    ///
    /// - Note: the hash value is not guaranteed to be stable across
    ///   different invocations of the same program.  Do not persist the
    ///   hash value across program runs.
    public var hashValue: Int {
        return native.hashValue
    }
}

@_transparent extension CGAngle: FloatLiteralConvertible {
    /// Create an instance initialized to `value`.
    public init(floatLiteral value: NativeType) {
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
        return CGAngle(NativeType.abs(x.native))
    }
}

// ###sourceLocation(file: "/Users/Pyroh/Downloads/CGAngle.swift.gyb", line: 199)

@_transparent extension UInt8 {
    public init(_ value: CGAngle) {
        self = UInt8(value.native)
    }
}

// ###sourceLocation(file: "/Users/Pyroh/Downloads/CGAngle.swift.gyb", line: 199)

@_transparent extension Int8 {
    public init(_ value: CGAngle) {
        self = Int8(value.native)
    }
}

// ###sourceLocation(file: "/Users/Pyroh/Downloads/CGAngle.swift.gyb", line: 199)

@_transparent extension UInt16 {
    public init(_ value: CGAngle) {
        self = UInt16(value.native)
    }
}

// ###sourceLocation(file: "/Users/Pyroh/Downloads/CGAngle.swift.gyb", line: 199)

@_transparent extension Int16 {
    public init(_ value: CGAngle) {
        self = Int16(value.native)
    }
}

// ###sourceLocation(file: "/Users/Pyroh/Downloads/CGAngle.swift.gyb", line: 199)

@_transparent extension UInt32 {
    public init(_ value: CGAngle) {
        self = UInt32(value.native)
    }
}

// ###sourceLocation(file: "/Users/Pyroh/Downloads/CGAngle.swift.gyb", line: 199)

@_transparent extension Int32 {
    public init(_ value: CGAngle) {
        self = Int32(value.native)
    }
}

// ###sourceLocation(file: "/Users/Pyroh/Downloads/CGAngle.swift.gyb", line: 199)

@_transparent extension UInt64 {
    public init(_ value: CGAngle) {
        self = UInt64(value.native)
    }
}

// ###sourceLocation(file: "/Users/Pyroh/Downloads/CGAngle.swift.gyb", line: 199)

@_transparent extension Int64 {
    public init(_ value: CGAngle) {
        self = Int64(value.native)
    }
}

// ###sourceLocation(file: "/Users/Pyroh/Downloads/CGAngle.swift.gyb", line: 199)

@_transparent extension UInt {
    public init(_ value: CGAngle) {
        self = UInt(value.native)
    }
}

// ###sourceLocation(file: "/Users/Pyroh/Downloads/CGAngle.swift.gyb", line: 199)

@_transparent extension Int {
    public init(_ value: CGAngle) {
        self = Int(value.native)
    }
}

// ###sourceLocation(file: "/Users/Pyroh/Downloads/CGAngle.swift.gyb", line: 207)


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

// Comparisons.
@_transparent extension CGAngle: Equatable { }

@_transparent
@warn_unused_result
public func ==(lhs: CGAngle, rhs: CGAngle) -> Bool { //FIXME: Not so easy
    return lhs.native == rhs.native
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
public prefix func - (x: CGAngle) -> CGAngle { return CGAngle(-x.native) }//FIXME: Not so easy

@_transparent
public prefix func ++ (inout x: CGAngle) -> CGAngle {
    x.native += 1.0
    return x
}

@_transparent
public prefix func -- (inout x: CGAngle) -> CGAngle {
    x.native -= 1.0
    return x
}

@_transparent
public postfix func ++ (inout x: CGAngle) -> CGAngle {
    let tmp = x
    x.native += 1.0
    return tmp
}

@_transparent
public postfix func -- (inout x: CGAngle) -> CGAngle {
    let tmp = x
    x.native -= 1.0
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
public func -(lhs: CGAngle, rhs: CGAngle) -> CGAngle {
    return CGAngle(lhs.native - rhs.native)
}

@_transparent
@warn_unused_result
public func *(lhs: CGAngle, rhs: CGAngle) -> CGAngle {
    return CGAngle(lhs.native * rhs.native)
}

@_transparent
@warn_unused_result
public func /(lhs: CGAngle, rhs: CGAngle) -> CGAngle {
    return CGAngle(lhs.native / rhs.native)
}

@_transparent
@warn_unused_result
public func %(lhs: CGAngle, rhs: CGAngle) -> CGAngle {
    return CGAngle(lhs.native % rhs.native)
}

// CGAngle assignment operators.
@_transparent
public func +=(inout lhs: CGAngle, rhs: CGAngle) {
    lhs.native = lhs.native + rhs.native
}

@_transparent
public func -=(inout lhs: CGAngle, rhs: CGAngle) {
    lhs.native = lhs.native - rhs.native
}

@_transparent
public func *=(inout lhs: CGAngle, rhs: CGAngle) {
    lhs.native = lhs.native * rhs.native
}

@_transparent
public func /=(inout lhs: CGAngle, rhs: CGAngle) {
    lhs.native = lhs.native / rhs.native
}

@_transparent
public func %=(inout lhs: CGAngle, rhs: CGAngle) {
    lhs.native = lhs.native % rhs.native
}

// CGAngle tgmath.

@_transparent
@warn_unused_result
public func acos(x: CGAngle) -> CGFloat {
    return CGFloat(acos(x.native))
}

@_transparent
@warn_unused_result
public func cos(x: CGAngle) -> CGFloat {
    return CGFloat(cos(x.native))
}

@_transparent
@warn_unused_result
public func sin(x: CGAngle) -> CGFloat {
    return CGFloat(sin(x.native))
}

@_transparent
@warn_unused_result
public func asin(x: CGAngle) -> CGFloat {
    return CGFloat(asin(x.native))
}

@_transparent
@warn_unused_result
public func atan(x: CGAngle) -> CGFloat {
    return CGFloat(atan(x.native))
}

@_transparent
@warn_unused_result
public func tan(x: CGAngle) -> CGFloat {
    return CGFloat(tan(x.native))
}

@_transparent
@warn_unused_result
public func acosh(x: CGAngle) -> CGFloat {
    return CGFloat(acosh(x.native))
}

@_transparent
@warn_unused_result
public func asinh(x: CGAngle) -> CGFloat {
    return CGFloat(asinh(x.native))
}

@_transparent
@warn_unused_result
public func atanh(x: CGAngle) -> CGFloat {
    return CGFloat(atanh(x.native))
}

@_transparent
@warn_unused_result
public func cosh(x: CGAngle) -> CGFloat {
    return CGFloat(cosh(x.native))
}

@_transparent
@warn_unused_result
public func sinh(x: CGAngle) -> CGAngle {
    return CGAngle(sinh(x.native))
}

@_transparent
@warn_unused_result
public func tanh(x: CGAngle) -> CGAngle {
    return CGAngle(tanh(x.native))
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
    return CGAngle(nan(tag) as CGAngle.NativeType)
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
