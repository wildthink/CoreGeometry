//
//  CGRectExtension.swift
//  TestIOS1
//
//  Created by Pierre TACCHI on 30/03/16.
//  Copyright © 2016 Pyrolyse. All rights reserved.
//

import CoreGraphics

public extension CGRect {
    // The rectangle's center.
    @_transparent
    public var center: CGPoint {
        get {
            return CGPoint(x: self.midX, y: self.midY)
        }
        set {
            self.origin = newValue.translated(by: self.center.getVector(self.origin))
        }
    }

    @_transparent
    public init(center: CGPoint, size: CGSize) {
        let r = CGRect(origin: CGPoint.zero, size: size)
        self = r.centered(at: center)
    }

    
    // Returns a copy of `self` centered relative to the given rect.
    @warn_unused_result(mutable_variant = "centerRelativeInPlace")
    public func centered(relativeTo rect: CGRect) -> CGRect {
        guard !self.isEmpty && !self.isInfinite else { return self }
        let rectCenter = rect.center
        let origin = CGPoint(x: rectCenter.x - self.width / 2.0, y: rectCenter.y - self.height / 2.0)
        return CGRect(origin: origin, size: self.size)
    }

    // Center `self` relative to the given rect.
    public mutating func centerInPlace(relativeTo rect: CGRect) {
        self = self.centered(relativeTo: rect)
    }

    // Returns a copy of `self` centered to the given point.
    @warn_unused_result
    public func centered(at point: CGPoint) -> CGRect {
        guard !self.isEmpty && !self.isInfinite else { return self }
        let origin = CGPoint(x: point.x - self.width / 2.0, y: point.y - self.height / 2.0)
        return CGRect(origin: origin, size: self.size)
    }

    // Returns a copy of self centered at `(x,y)`.
    @warn_unused_result
    public func centered(atX x: CGFloat, y: CGFloat) -> CGRect {
        return self.centered(at: CGPoint(x: x, y: y))
    }

    // Returns a copy of self centered at `(x,y)`.
    @warn_unused_result
    public func centered(atX x: Double, y: Double) -> CGRect {
        return self.centered(at: CGPoint(x: x, y: y))
    }

    
    // Returns a copy of self centered at `(x,y)`.
    @warn_unused_result
    public func centered(atX x: Int, y: Int) -> CGRect {
        return self.centered(at: CGPoint(x: x, y: y))
    }

    // Center `self` at the given point.
    public mutating func centerInPlace(point: CGPoint) {
        self = self.centered(at: point)
    }

    // Center `self` at `(x,y)`
    public mutating func centerInPlace(x x: CGFloat, y: CGFloat) {
        self = self.centered(atX: x, y: y)
    }

    // Center `self` at `(x,y)`
    public mutating func centerInPlace(x x: Double, y: Double) {
        self = self.centered(atX: x, y: y)
    }
    
    // Center `self` at `(x,y)`
    public mutating func centerInPlace(x x: Int, y: Int) {
        self = self.centered(atX: x, y: y)
    }
    
    // Returns a copy of self with `origin` = `CGPointZero`.
    @_transparent
    @warn_unused_result
    public func reseted() -> CGRect {
        return CGRect(center: CGPointZero, size: self.size)
    }
    
    // Make `self` origin equal to `CGPointZero`.
    @_transparent
    public mutating func reset() {
        self.origin = CGPointZero
    }

    // Returns a copy of `self` translated by the given vector.
    @_transparent
    @warn_unused_result
    public func translated(by vector: CGVector) -> CGRect {
        return CGRect(origin: self.origin.translated(by: vector), size: self.size)
    }

    // Returns a copy of `self` translated by `(tx,ty)`.
    @_transparent
    @warn_unused_result
    public func translated(byTx tx: CGFloat, ty: CGFloat) -> CGRect {
        return CGRect(origin: self.origin.translated(byTx: tx, ty: ty), size: self.size)
    }

    // Returns a copy of `self` translated by `(tx,ty)`.
    @_transparent
    @warn_unused_result
    public func translated(byTx tx: Double, ty: Double) -> CGRect {
        return CGRect(origin: self.origin.translated(byTx: tx, ty: ty), size: self.size)
    }

    // Returns a copy of `self` translated by `(tx,ty)`.
    @_transparent
    @warn_unused_result
    public func translated(byTx tx: Int, ty: Int) -> CGRect {
        return CGRect(origin: self.origin.translated(byTx: tx, ty: ty), size: self.size)
    }

    // Translate `self` by the given vector.
    @_transparent
    public mutating func translateInPlace(vector: CGVector) {
        self = self.translated(by: vector)
    }

    // Translate `self` by `(tx,ty)`.
    @_transparent
    public mutating func translateInPlace(tx tx: CGFloat, ty: CGFloat) {
        self = self.translated(byTx: tx, ty: ty)
    }

    // Translate `self` by `(tx,ty)`.
    @_transparent
    public mutating func translateInPlace(tx tx: Double, ty: Double) {
        self = self.translated(byTx: tx, ty: ty)
    }

    // Translate `self` by `(tx,ty)`.
    @_transparent
    public mutating func translateInPlace(tx tx: Int, ty: Int) {
        self = self.translated(byTx: tx, ty: ty)
    }

    /**
     Returns a copy of `self` rotated around the given center by the given angle.
     
     - note: Rotates CW on iOS and CCW on OS X.
     */
    @warn_unused_result
    public func rotated(relativeTo center: CGPoint, by angle: CGAngle) -> CGRect {
        var transform = CGAffineTransformMakeTranslation(center.x, center.y)
        transform = CGAffineTransformRotate(transform, angle.normalized.native)
        transform = CGAffineTransformTranslate(transform, -center.x, -center.y)
        return CGRectApplyAffineTransform(self, transform)
    }

    /**
     Rotates `self` around the givent center by the given angle.
     
     - note: Rotates CW on iOS and CCW on OS X.
     */
    public mutating func rotateInPlace(relativeTo center: CGPoint, by angle: CGAngle) {
        self = self.rotated(relativeTo: center, by: angle)
    }
    /**
     Returns a copy of `self` rotated by the given angle around the given center but the orientation will remain the same.
     
     - note: Rotates CW on iOS and CCW on OS X.
     */
    @warn_unused_result
    public func slided(relativeTo center: CGPoint, by angle: CGAngle) -> CGRect {
        return self.centered(at: self.center.rotated(relativeTo: center, by: angle))
    }

    /**
     Rotates `self` by the given angle around the given center but the orientation will remain the same.
     
     - note: Rotates CW on iOS and CCW on OS X.
     */
    public mutating func slideInPlace(relativeTo center: CGPoint, by angle: CGAngle) {
        self = self.slided(relativeTo: center, by: angle)
    }
}
