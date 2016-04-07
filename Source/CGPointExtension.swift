//
//  CGPointExtension.swift
//  TestIOS1
//
//  Created by Pierre TACCHI on 30/03/16.
//  Copyright © 2016 Pyrolyse. All rights reserved.
//

import CoreGraphics

extension CGPoint {
    @_transparent
    public init(vector: CGVector) {
        self.init(x: vector.dx, y: vector.dy)
    }
    
    @_transparent
    public func translateBy(vector: CGVector) -> CGPoint {
        return CGPoint(x: self.x + vector.dx, y: self.y + vector.dy)
    }
    
    @_transparent
    public func translateBy(tx tx: CGFloat, ty: CGFloat) -> CGPoint {
        return CGPoint(x: self.x + tx, y: self.y + ty)
    }
    
    @_transparent
    public func translateBy(tx tx: Double, ty: Double) -> CGPoint {
        return CGPoint(x: self.x + CGFloat(tx), y: self.y + CGFloat(ty))
    }
    
    @_transparent
    public func translateBy(tx tx: Int, ty: Int) -> CGPoint {
        return CGPoint(x: self.x + CGFloat(tx), y: self.y + CGFloat(ty))
    }
    
    @_transparent
    public mutating func translateInPlace(vector: CGVector) {
        self = self.translateBy(vector)
    }
    
    @_transparent
    public mutating func translateInPlace(tx tx: CGFloat, ty: CGFloat) {
        self = self.translateBy(tx: tx, ty: ty)
    }
    
    @_transparent
    public mutating func translateInPlace(tx tx: Double, ty: Double) {
        self = self.translateBy(tx: tx, ty: ty)
    }
    
    @_transparent
    public mutating func translateInPlace(tx tx: Int, ty: Int) {
        self = self.translateBy(tx: tx, ty: ty)
    }
    
    public func rotateRelativeTo(center: CGPoint, by angle: CGAngle) -> CGPoint {
        var transform = CGAffineTransformMakeTranslation(center.x, center.y)
        transform = CGAffineTransformRotate(transform, angle.normalized)
        transform = CGAffineTransformMakeTranslation(-center.x, -center.y)
        return CGPointApplyAffineTransform(self, transform)
    }
    
    public mutating func rotateInPlace(center: CGPoint, by angle: CGAngle) {
        self = self.rotateRelativeTo(center, by: angle)
    }
}
