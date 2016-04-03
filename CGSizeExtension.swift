//
//  CGSizeExtension.swift
//  TestIOS1
//
//  Created by Pierre TACCHI on 30/03/16.
//  Copyright © 2016 Pyrolyse. All rights reserved.
//

import CoreGraphics

public extension CGSize {
    init(square: CGFloat) { self.init(width: square, height: square) }
    init(square: Double) { self.init(width: square, height: square) }
    init(square: Int) { self.init(width: square, height: square) }
}

public func *(lhs: CGSize, rhs: CGFloat) -> CGSize {
    return CGSize(width: lhs.width * rhs, height: lhs.height * rhs)
}

public func *(lhs: CGSize, rhs: Double) -> CGSize {
    return CGSize(width: lhs.width * CGFloat(rhs), height: lhs.height * CGFloat(rhs))
}

public func *(lhs: CGSize, rhs: Int) -> CGSize {
    return CGSize(width: lhs.width * CGFloat(rhs), height: lhs.height * CGFloat(rhs))
}

public func /(lhs: CGSize, rhs: CGFloat) -> CGSize {
    return CGSize(width: lhs.width / rhs, height: lhs.height * rhs)
}

public func /(lhs: CGSize, rhs: Double) -> CGSize {
    return CGSize(width: lhs.width / CGFloat(rhs), height: lhs.height * CGFloat(rhs))
}

public func /(lhs: CGSize, rhs: Int) -> CGSize {
    return CGSize(width: lhs.width / CGFloat(rhs), height: lhs.height * CGFloat(rhs))
}