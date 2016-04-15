//
//  CGVectorExtension.swift
//  CoreGeometry
//
//  Created by Pierre TACCHI on 15/04/16.
//  Copyright © 2016 Pyrolyse. All rights reserved.
//

import CoreGraphics

/// A vector constant with magnitude and direction equal to `0`. The zero vector is equivalent to `CGVectorMake(0, 0)`.
public var CGVectorZero: CGVector { get { return CGVector() } }

extension CGVector {
    public var magnitude: CGFloat {
        @_transparent get {
            return sqrt(pow(dx, 2) + pow(dy, 2))
        }
    }
    
    public var direction: CGAngle {
        get {
            return CGAngle(asin(dy / magnitude)) + (dx < 0 && dy > 0 ? 90° : 0°) - (dx < 0 && dy < 0 ? 90° : 0°) + (dx < 0 && dy == 0 ? 180° : 0°)
        }
    }
}