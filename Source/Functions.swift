//
//  Functions.swift
//  CoreGeometry
//
//  Created by Pierre TACCHI on 08/04/16.
//  Copyright © 2016 Pyrolyse. All rights reserved.
//

import Foundation

/**
 Returns the lesser between `max` and the higher between `x` and `min`.
 */
@_transparent
@warn_unused_result
public func clamp<T: Comparable>(x: T, _ min: T, _ max: T) -> T {
    return Swift.min(Swift.max(x, min), max)
}

@_transparent
@warn_unused_result
public func getVector(p1: CGPoint, _ p2: CGPoint) -> CGVector {
    return CGVector(dx: p2.x - p1.x, dy: p2.y - p1.y)
}

@_transparent
@warn_unused_result
public func getNormalizedAngle(center center: CGPoint, point: CGPoint) -> CGAngle {
    return center.getVector(point).direction
}
