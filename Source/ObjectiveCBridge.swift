//
//  ObjectiveCBridge.swift
//  CoreGeometry
//
//  Created by Pierre TACCHI on 07/04/16.
//  Copyright © 2016 Pyrolyse. All rights reserved.
//
import Foundation

extension CGAngle: _ObjectiveCBridgeable {
    public typealias _ObjectiveCType = NSNumber
    
    public static func _getObjectiveCType() -> Any.Type {
        return _ObjectiveCType.self
    }
    
    public static func _isBridgedToObjectiveC() -> Bool { return true }
    
    public func _bridgeToObjectiveC() -> _ObjectiveCType {
        return NSNumber(double: self.native.native)
    }
    
    public static func _forceBridgeFromObjectiveC(source: _ObjectiveCType, inout result: CGAngle?) {
        result = CGAngle(source.doubleValue)
    }
    
    public static func _conditionallyBridgeFromObjectiveC(source: _ObjectiveCType, inout result: CGAngle?) -> Bool {
        result = CGAngle(source.doubleValue)
        return true
    }
    
    public static func _unconditionallyBridgeFromObjectiveC(source: _ObjectiveCType?) -> CGAngle {
        if let source = source {
            return CGAngle(source.doubleValue)
        } else {
            return CGAngleZero
        }
    }
}
