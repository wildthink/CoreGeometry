//
//  Operators.swift
//  CoreGeometry
//
//  Created by Pierre TACCHI on 07/04/16.
//  Copyright © 2016 Pyrolyse. All rights reserved.
//

postfix operator ° { }
infix operator ± { associativity none precedence 130 }
infix operator ±= { associativity none precedence 130 }
infix operator =~ { associativity none precedence 130 }

//MARK: ° operator
@_transparent
@warn_unused_result
public postfix func °(lhs: Float) -> CGAngle {
    return CGAngle(degree: lhs)
}

@_transparent
@warn_unused_result
public postfix func °(lhs: Double) -> CGAngle {
    return CGAngle(degree: lhs)
}

@_transparent
@warn_unused_result
public postfix func °(lhs: CGFloat) -> CGAngle {
    return CGAngle(degree: lhs)
}

@_transparent
@warn_unused_result
public postfix func °(lhs: UInt8) -> CGAngle {
    return CGAngle(degree: lhs)
}

@_transparent
@warn_unused_result
public postfix func °(lhs: Int8) -> CGAngle {
    return CGAngle(degree: lhs)
}

@_transparent
@warn_unused_result
public postfix func °(lhs: UInt16) -> CGAngle {
    return CGAngle(degree: lhs)
}

@_transparent
@warn_unused_result
public postfix func °(lhs: Int16) -> CGAngle {
    return CGAngle(degree: lhs)
}

@_transparent
@warn_unused_result
public postfix func °(lhs: UInt32) -> CGAngle {
    return CGAngle(degree: lhs)
}

@_transparent
@warn_unused_result
public postfix func °(lhs: Int32) -> CGAngle {
    return CGAngle(degree: lhs)
}

@_transparent
@warn_unused_result
public postfix func °(lhs: UInt64) -> CGAngle {
    return CGAngle(degree: lhs)
}

@_transparent
@warn_unused_result
public postfix func °(lhs: Int64) -> CGAngle {
    return CGAngle(degree: lhs)
}

@_transparent
@warn_unused_result
public postfix func °(lhs: UInt) -> CGAngle {
    return CGAngle(degree: lhs)
}

@_transparent
@warn_unused_result
public postfix func °(lhs: Int) -> CGAngle {
    return CGAngle(degree: lhs)
}

//MARK: ± operator
@_transparent
@warn_unused_result
public func ± (lhs: CGFloat, rhs: CGFloat) -> Bool {
    return lhs > -rhs && lhs < rhs
}

@_transparent
@warn_unused_result
public func ± (lhs: Float, rhs: Float) -> Bool {
    return lhs > -rhs && lhs < rhs
}

@_transparent
@warn_unused_result
public func ± (lhs: Double, rhs: Double) -> Bool {
    return lhs > -rhs && lhs < rhs
}

@_transparent
@warn_unused_result
public func ± (lhs: UInt8, rhs: UInt8) -> Bool {
    return CGFloat(lhs) > -CGFloat(rhs) && CGFloat(lhs) < CGFloat(rhs)
}

@_transparent
@warn_unused_result
public func ± (lhs: Int8, rhs: Int8) -> Bool {
    return lhs > -rhs && lhs < rhs
}

@_transparent
@warn_unused_result
public func ± (lhs: UInt16, rhs: UInt16) -> Bool {
    return CGFloat(lhs) > -CGFloat(rhs) && CGFloat(lhs) < CGFloat(rhs)
}

@_transparent
@warn_unused_result
public func ± (lhs: Int16, rhs: Int16) -> Bool {
    return lhs > -rhs && lhs < rhs
}

@_transparent
@warn_unused_result
public func ± (lhs: UInt32, rhs: UInt32) -> Bool {
    return CGFloat(lhs) > -CGFloat(rhs) && CGFloat(lhs) < CGFloat(rhs)
}

@_transparent
@warn_unused_result
public func ± (lhs: Int32, rhs: Int32) -> Bool {
    return lhs > -rhs && lhs < rhs
}

@_transparent
@warn_unused_result
public func ± (lhs: UInt64, rhs: UInt64) -> Bool {
    return CGFloat(lhs) > -CGFloat(rhs) && CGFloat(lhs) < CGFloat(rhs)
}

@_transparent
@warn_unused_result
public func ± (lhs: Int64, rhs: Int64) -> Bool {
    return lhs > -rhs && lhs < rhs
}

@_transparent
@warn_unused_result
public func ± (lhs: UInt, rhs: UInt) -> Bool {
    return CGFloat(lhs) > -CGFloat(rhs) && CGFloat(lhs) < CGFloat(rhs)
}

@_transparent
@warn_unused_result
public func ± (lhs: Int, rhs: Int) -> Bool {
    return lhs > -rhs && lhs < rhs
}

//MARK: ±= operator
@_transparent
@warn_unused_result
public func ±= (lhs: CGFloat, rhs: CGFloat) -> Bool {
    return lhs >= -rhs && lhs <= rhs
}

@_transparent
@warn_unused_result
public func ±= (lhs: Float, rhs: Float) -> Bool {
    return lhs >= -rhs && lhs <= rhs
}

@_transparent
@warn_unused_result
public func ±= (lhs: Double, rhs: Double) -> Bool {
    return lhs >= -rhs && lhs <= rhs
}

@_transparent
@warn_unused_result
public func ±= (lhs: UInt8, rhs: UInt8) -> Bool {
    return CGFloat(lhs) >= -CGFloat(rhs) && CGFloat(lhs) <= CGFloat(rhs)
}

@_transparent
@warn_unused_result
public func ±= (lhs: Int8, rhs: Int8) -> Bool {
    return lhs >= -rhs && lhs <= rhs
}

@_transparent
@warn_unused_result
public func ±= (lhs: UInt16, rhs: UInt16) -> Bool {
    return CGFloat(lhs) >= -CGFloat(rhs) && CGFloat(lhs) <= CGFloat(rhs)
}

@_transparent
@warn_unused_result
public func ±= (lhs: Int16, rhs: Int16) -> Bool {
    return lhs >= -rhs && lhs <= rhs
}

@_transparent
@warn_unused_result
public func ±= (lhs: UInt32, rhs: UInt32) -> Bool {
    return CGFloat(lhs) >= -CGFloat(rhs) && CGFloat(lhs) <= CGFloat(rhs)
}

@_transparent
@warn_unused_result
public func ±= (lhs: Int32, rhs: Int32) -> Bool {
    return lhs >= -rhs && lhs <= rhs
}

@_transparent
@warn_unused_result
public func ±= (lhs: UInt64, rhs: UInt64) -> Bool {
    return CGFloat(lhs) >= -CGFloat(rhs) && CGFloat(lhs) <= CGFloat(rhs)
}

@_transparent
@warn_unused_result
public func ±= (lhs: Int64, rhs: Int64) -> Bool {
    return lhs >= -rhs && lhs <= rhs
}

@_transparent
@warn_unused_result
public func ±= (lhs: UInt, rhs: UInt) -> Bool {
    return CGFloat(lhs) >= -CGFloat(rhs) && CGFloat(lhs) <= CGFloat(rhs)
}

@_transparent
@warn_unused_result
public func ±= (lhs: Int, rhs: Int) -> Bool {
    return lhs >= -rhs && lhs <= rhs
}