//
//  CGPointExtension.swift
//  TestIOS1
//
//  Created by Pierre TACCHI on 30/03/16.
//  Copyright © 2016 Pyrolyse. All rights reserved.
//

import CoreGraphics

extension CGPoint {
    /**
     Returns the vector that exists between `self` and `p2`.
     
     - returns: A `CGVector` that holds the vector data.
     */
    @_transparent
    public func getVector(p2: CGPoint) -> CGVector {
        return CGVector(dx: p2.x - self.x, dy: p2.y - self.y)
    }
    
    /**
     Returns a copy of `self` translated along the given vector.
     */
    @_transparent
    public func translated(by vector: CGVector) -> CGPoint {
        return CGPoint(x: self.x + vector.dx, y: self.y + vector.dy)
    }
    
    /**
     Returns a copy of `self` translated by `tx` on the X-axis and by `ty` on the Y-axis.
     */
    @_transparent
    public func translated(byTx tx: CGFloat, ty: CGFloat) -> CGPoint {
        return CGPoint(x: self.x + tx, y: self.y + ty)
    }
    
    /**
     Returns a copy of `self` translated by `tx` on the X-axis and by `ty` on the Y-axis.
     */
    @_transparent
    public func translated(byTx tx: Double, ty: Double) -> CGPoint {
        return CGPoint(x: self.x + CGFloat(tx), y: self.y + CGFloat(ty))
    }
    
    /**
     Returns a copy of `self` translated by `tx` on the X-axis and by `ty` on the Y-axis.
     */
    @_transparent
    public func translated(byTx tx: Int, ty: Int) -> CGPoint {
        return CGPoint(x: self.x + CGFloat(tx), y: self.y + CGFloat(ty))
    }
    
    /**
     Translates `self` along the given vector.
     */
    @_transparent
    public mutating func translateInPlace(by vector: CGVector) {
        self = self.translated(by: vector)
    }
    
    /**
     Translates `self` by `tx` on the X-axis and by `ty` on the Y-axis.
     */
    @_transparent
    public mutating func translateInPlace(byTx tx: CGFloat, ty: CGFloat) {
        self = self.translated(byTx: tx, ty: ty)
    }
    
    /**
     Translates `self` by `tx` on the X-axis and by `ty` on the Y-axis.
     */
    @_transparent
    public mutating func translateInPlace(byTx tx: Double, ty: Double) {
        self = self.translated(byTx: tx, ty: ty)
    }
    
    /**
     Translates `self` by `tx` on the X-axis and by `ty` on the Y-axis.
     */
    @_transparent
    public mutating func translateInPlace(byTx tx: Int, ty: Int) {
        self = self.translated(byTx: tx, ty: ty)
    }
    
    /**
     Returns a copy of `self` rotated around the given center by the given angle.
     
     - note: Rotates CW on iOS and CCW on OS X.
     */
    public func rotated(relativeTo center: CGPoint, by angle: CGAngle) -> CGPoint {
        var transform = CGAffineTransformMakeTranslation(center.x, center.y)
        transform = CGAffineTransformRotate(transform, angle.normalized.native)
        transform = CGAffineTransformTranslate(transform, -center.x, -center.y)
        return CGPointApplyAffineTransform(self, transform)
    }
    
    /**
     Rotates `self` around the givent center by the given angle.
     
     - note: Rotates CW on iOS and CCW on OS X.
     */
    public mutating func rotateInPlace(relativeTo center: CGPoint, by angle: CGAngle) {
        self = self.rotated(relativeTo: center, by: angle)
    }
}
