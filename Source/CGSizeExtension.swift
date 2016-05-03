//
//  CGSizeExtension.swift
//  CoreGeometry
//
//  Created by Pierre TACCHI on 30/03/16.
//  Copyright © 2016 Pyrolyse. All rights reserved.
//

import CoreGraphics

extension CGSize {
    // Init a size of `(square,square)`.
    @_transparent public init(square: CGFloat) {
        self.init(width: square, height: square)
    }
    
    // Init a size of `(square,square)`.
    @_transparent public init(square: Double) {
        self.init(width: square, height: square)
    }
    
    // Init a size of `(square,square)`.
    @_transparent public init(square: Int) {
        self.init(width: square, height: square)
    }
}

@_transparent
public func *(lhs: CGSize, rhs: CGFloat) -> CGSize {
    return CGSize(width: lhs.width * rhs, height: lhs.height * rhs)
}

@_transparent
public func *(lhs: CGSize, rhs: Double) -> CGSize {
    return CGSize(width: lhs.width * CGFloat(rhs), height: lhs.height * CGFloat(rhs))
}

@_transparent
public func *(lhs: CGSize, rhs: Int) -> CGSize {
    return CGSize(width: lhs.width * CGFloat(rhs), height: lhs.height * CGFloat(rhs))
}

@_transparent
public func /(lhs: CGSize, rhs: CGFloat) -> CGSize {
    return CGSize(width: lhs.width / rhs, height: lhs.height / rhs)
}

@_transparent
public func /(lhs: CGSize, rhs: Double) -> CGSize {
    return CGSize(width: lhs.width / CGFloat(rhs), height: lhs.height / CGFloat(rhs))
}

@_transparent
public func /(lhs: CGSize, rhs: Int) -> CGSize {
    return CGSize(width: lhs.width / CGFloat(rhs), height: lhs.height / CGFloat(rhs))
}