//
//  CGVectorExtension.swift
//  CoreGeometry
//
//  Created by Pierre TACCHI on 15/04/16.
//  Copyright © 2016 Pyrolyse. All rights reserved.
//

import CoreGraphics

/// A vector constant with magnitude and direction equal to `0`. The zero vector is equivalent to `CGVectorMake(0, 0)`.
public var CGVectorZero: CGVector {
    get {
        return CGVector()
    }
}

extension CGVector {
        /// The vector magnitude.
    public var magnitude: CGFloat {
        @_transparent get {
            return sqrt(pow(dx, 2) + pow(dy, 2))
        }
    }
    
        /// The vector direction.
    public var direction: CGAngle {
        @_transparent get {
            return CGAngle(atan2(dy, dx)).normalized
        }
    }
    
    // Returns a reversed copy of `self`.
    @_transparent
    public func reversed() -> CGVector {
        return CGVector(dx: -self.dx, dy: -self.dy)
    }
    
    // Reverse `self`
    @_transparent
    public mutating func reverseInPlace() {
        self = self.reversed()
    }
}