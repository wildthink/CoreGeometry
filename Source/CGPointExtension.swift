//
//  CGPointExtension.swift
//  TestIOS1
//
//  Created by Pierre TACCHI on 30/03/16.
//  Copyright © 2016 Pyrolyse. All rights reserved.
//

import CoreGraphics

public extension CGPoint {
    public init(vector: CGVector) {
        self.init(x: vector.dx, y: vector.dy)
    }
    
    public func translateBy(vector: CGVector) -> CGPoint {
        return CGPoint(x: self.x + vector.dx, y: self.y + vector.dy)
    }
    
    public func translateBy(tx tx: CGFloat, ty: CGFloat) -> CGPoint {
        return CGPoint(x: self.x + tx, y: self.y + ty)
    }
    
    public func translateBy(tx tx: Double, ty: Double) -> CGPoint {
        return CGPoint(x: self.x + CGFloat(tx), y: self.y + CGFloat(ty))
    }
    
    public func translateBy(tx tx: Int, ty: Int) -> CGPoint {
        return CGPoint(x: self.x + CGFloat(tx), y: self.y + CGFloat(ty))
    }
    
    public mutating func translateInPlace(vector: CGVector) {
        self = self.translateBy(vector)
    }
    
    public mutating func translateInPlace(tx: CGFloat, _ ty: CGFloat) {
        self = self.translateBy(tx: tx, ty: ty)
    }
    
    public mutating func translateInPlace(tx: Double, _ ty: Double) {
        self = self.translateBy(tx: tx, ty: ty)
    }
    
    public mutating func translateInPlace(tx: Int, _ ty: Int) {
        self = self.translateBy(tx: tx, ty: ty)
    }
    
    public func rotateRelativeTo(center: CGPoint, by angle: CGFloat) -> CGPoint {
        var transform = CGAffineTransformMakeTranslation(center.x, center.y)
        transform = CGAffineTransformRotate(transform, angle)
        transform = CGAffineTransformMakeTranslation(-center.x, -center.y)
        return CGPointApplyAffineTransform(self, transform)
    }
    
    public mutating func rotateInPlace(center: CGPoint, by angle: CGFloat) {
        self = self.rotateRelativeTo(center, by: angle)
    }
}
