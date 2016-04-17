//
//  CGRectExtension.swift
//  TestIOS1
//
//  Created by Pierre TACCHI on 30/03/16.
//  Copyright © 2016 Pyrolyse. All rights reserved.
//

import CoreGraphics

public extension CGRect {
        /// The rectangle's center.
    public var center: CGPoint {
        @_transparent
        get { return CGPoint(x: self.midX, y: self.midY) }
    }
    
    @_transparent
    public init(center: CGPoint, size: CGSize) {
        let r = CGRect(origin: CGPointZero, size: size)
        self = r.centerAt(center)
    }
    
    /**
     Returns a copy of `self` centered relative to the given rect.
     */
    @warn_unused_result(mutable_variant = "centerRelativeInPlace")
    public func centerRelativeTo(rect: CGRect) -> CGRect {
        guard !self.isEmpty && !self.isInfinite else { return self }
        let rectCenter = rect.center
        let origin = CGPoint(x: rectCenter.x - self.width / 2.0, y: rectCenter.y - self.height / 2.0)
        return CGRect(origin: origin, size: self.size)
    }
    
    /**
     Center `self` relative to the given rect.
     */
    public mutating func centerRelativeInPlace(rect: CGRect) {
        self = self.centerRelativeTo(rect)
    }
    
    /**
     Returns a copy of `self` centered to the given point.
     */
    public func centerAt(point: CGPoint) -> CGRect {
        guard !self.isEmpty && !self.isInfinite else { return self }
        let origin = CGPoint(x: point.x - self.width / 2.0, y: point.y - self.height / 2.0)
        return CGRect(origin: origin, size: self.size)
    }
    
    /**
     Returns a copy of self centered at `(x,y)`.
     */
    public func centerAt(x x: CGFloat, y: CGFloat) -> CGRect {
        return self.centerAt(CGPoint(x: x, y: y))
    }
    
    /**
     Returns a copy of self centered at `(x,y)`.
     */
    public func centerAt(x x: Double, y: Double) -> CGRect {
        return self.centerAt(CGPoint(x: x, y: y))
    }
    
    /**
     Returns a copy of self centered at `(x,y)`.
     */
    public func centerAt(x x: Int, y: Int) -> CGRect {
        return self.centerAt(CGPoint(x: x, y: y))
    }
    
    /**
     Center `self` at the given point.
     */
    public mutating func centerInPlace(point: CGPoint) {
        self = self.centerAt(point)
    }
    
    /**
     Center `self` at `(x,y)`
     */
    public mutating func centerInPlace(x x: CGFloat, y: CGFloat) {
        self = self.centerAt(x: x, y: y)
    }
    
    /**
     Center `self` at `(x,y)`
     */
    public mutating func centerInPlace(x x: Double, y: Double) {
        self = self.centerAt(x: x, y: y)
    }
    
    /**
     Center `self` at `(x,y)`
     */
    public mutating func centerInPlace(x x: Int, y: Int) {
        self = self.centerAt(x: x, y: y)
    }
    
    /**
     Returns a copy of `self` translated by the given vector.
     */
    @_transparent
    public func translateBy(vector: CGVector) -> CGRect {
        return CGRect(origin: self.origin.translateBy(vector), size: self.size)
    }
    
    /**
     Returns a copy of `self` translated by `(tx,ty)`.
     */
    @_transparent
    public func translateBy(tx tx: CGFloat, ty: CGFloat) -> CGRect {
        return CGRect(origin: self.origin.translateBy(tx: tx, ty: ty), size: self.size)
    }
    
    /**
     Returns a copy of `self` translated by `(tx,ty)`.
     */
    @_transparent
    public func translateBy(tx tx: Double, ty: Double) -> CGRect {
        return CGRect(origin: self.origin.translateBy(tx: tx, ty: ty), size: self.size)
    }
    
    /**
     Returns a copy of `self` translated by `(tx,ty)`.
     */
    @_transparent
    public func translateBy(tx tx: Int, ty: Int) -> CGRect {
        return CGRect(origin: self.origin.translateBy(tx: tx, ty: ty), size: self.size)
    }
    
    /**
     Translate `self` by the given vector.
     */
    @_transparent
    public mutating func translateInPlace(vector: CGVector) {
        self = self.translateBy(vector)
    }
    
    /**
     Translate `self` by `(tx,ty)`.
     */
    @_transparent
    public mutating func translateInPlace(tx tx: CGFloat, ty: CGFloat) {
        self = self.translateBy(tx: tx, ty: ty)
    }
    
    /**
     Translate `self` by `(tx,ty)`.
     */
    @_transparent
    public mutating func translateInPlace(tx tx: Double, ty: Double) {
        self = self.translateBy(tx: tx, ty: ty)
    }
    
    /**
     Translate `self` by `(tx,ty)`.
     */
    @_transparent
    public mutating func translateInPlace(tx tx: Int, ty: Int) {
        self = self.translateBy(tx: tx, ty: ty)
    }
    
    /**
     Returns a copy of `self` rotated by the given angle around the given center.
     */
    @warn_unused_result
    public func rotateRelativeTo(center: CGPoint, by angle: CGAngle) -> CGRect {
        var transform = CGAffineTransformMakeTranslation(center.x, center.y)
        transform = CGAffineTransformRotate(transform, angle.normalized.native)
        transform = CGAffineTransformTranslate(transform, -center.x, -center.y)
        return CGRectApplyAffineTransform(self, transform)
    }
    
    /**
     Rotates `self` by the given angle around the given center.
     */
    public mutating func rotateInPlace(center: CGPoint, by angle: CGAngle) {
        self = self.rotateRelativeTo(center, by: angle)
    }
    
    /**
     Returns a copy of `self` rotated by the given angle around the given center but the orientation will remain the same.
     */
    @warn_unused_result
    public func rotateCenterRelativeTo(center: CGPoint, by angle: CGAngle) -> CGRect {
        return self.centerAt(self.center.rotateRelativeTo(center, by: angle))
    }
    
    /**
     Rotates `self` by the given angle around the given center but the orientation will remain the same.
     */
    public mutating func rotateCenterInPlace(center: CGPoint, by angle: CGAngle) {
        self = self.rotateCenterRelativeTo(center, by: angle)
    }
}