//
//  CGRectExtension.swift
//  TestIOS1
//
//  Created by Pierre TACCHI on 30/03/16.
//  Copyright © 2016 Pyrolyse. All rights reserved.
//

import CoreGraphics

public extension CGRect {
    public var center: CGPoint {
        @_transparent
        get { return CGPoint(x: self.midX, y: self.midY) }
    }
    
    @_transparent
    public init(center: CGPoint, size: CGSize) {
        let r = CGRect(origin: CGPointZero, size: size)
        self = r.centerAt(center)
    }
    
    @warn_unused_result(mutable_variant = "centerRelativeInPlace")
    public func centerRelativeTo(rect: CGRect) -> CGRect {
        guard !self.isEmpty && !self.isInfinite else { return self }
        let rectCenter = rect.center
        let origin = CGPoint(x: rectCenter.x - self.width / 2.0, y: rectCenter.y - self.height / 2.0)
        return CGRect(origin: origin, size: self.size)
    }
    
    public mutating func centerRelativeInPlace(rect: CGRect) {
        self = self.centerRelativeTo(rect)
    }
    
    public func centerAt(point: CGPoint) -> CGRect {
        guard !self.isEmpty && !self.isInfinite else { return self }
        let origin = CGPoint(x: point.x - self.width / 2.0, y: point.y - self.height / 2.0)
        return CGRect(origin: origin, size: self.size)
    }
    
    public func centerAt(x x: CGFloat, y: CGFloat) -> CGRect {
        return self.centerAt(CGPoint(x: x, y: y))
    }
    
    public func centerAt(x x: Double, y: Double) -> CGRect {
        return self.centerAt(CGPoint(x: x, y: y))
    }
    
    public func centerAt(x x: Int, y: Int) -> CGRect {
        return self.centerAt(CGPoint(x: x, y: y))
    }
    
    public mutating func centerInPlace(point: CGPoint) {
        self = self.centerAt(point)
    }
    
    public mutating func centerInPlace(x x: CGFloat, y: CGFloat) {
        self = self.centerAt(x: x, y: y)
    }
    
    public mutating func centerInPlace(x x: Double, y: Double) {
        self = self.centerAt(x: x, y: y)
    }
    
    public mutating func centerInPlace(x x: Int, y: Int) {
        self = self.centerAt(x: x, y: y)
    }
    
    @warn_unused_result
    public func rotateRelativeTo(center: CGPoint, by angle: CGAngle) -> CGRect {
        var transform = CGAffineTransformMakeTranslation(center.x, center.y)
        transform = CGAffineTransformRotate(transform, angle.normalized)
        transform = CGAffineTransformTranslate(transform, -center.x, -center.y)
        return CGRectApplyAffineTransform(self, transform)
    }
    
    public mutating func rotateInPlace(center: CGPoint, by angle: CGAngle) {
        self = self.rotateRelativeTo(center, by: angle)
    }
    
    @warn_unused_result
    public func rotateCenterRelativeTo(center: CGPoint, by angle: CGAngle) -> CGRect {
        return self.centerAt(self.center.rotateRelativeTo(center, by: angle))
    }
    
    public mutating func rotateCenterInPlace(center: CGPoint, by angle: CGAngle) {
        self = self.rotateCenterRelativeTo(center, by: angle)
    }
}