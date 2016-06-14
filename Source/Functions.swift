//
//  Functions.swift
//  CoreGeometry
//
//  Created by Pierre TACCHI on 08/04/16.
//  Copyright © 2016 Pyrolyse. All rights reserved.
//

import Foundation

// Returns the lesser between `max` and the higher between `x` and `min`.
@_transparent
@warn_unused_result
public func clamp<T: Comparable>(_ x: T, _ min: T, _ max: T) -> T {
    return Swift.min(Swift.max(x, min), max)
}

// Returns the vector that exists between `p1` and `p2`.
@_transparent
@warn_unused_result
public func getVector(_ p1: CGPoint, _ p2: CGPoint) -> CGVector {
    return CGVector(dx: p2.x - p1.x, dy: p2.y - p1.y)
}

@_transparent
@warn_unused_result
public func getNormalizedAngle(center: CGPoint, point: CGPoint) -> CGAngle {
    return center.getVector(point).direction
}
