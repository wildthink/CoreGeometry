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
    
    public static func _isBridgedToObjectiveC() -> Bool { 
        return true
    }
    
    public func _bridgeToObjectiveC() -> _ObjectiveCType {
        #if arch(i386) || arch(arm)
            return NSNumber(float: self.native.native)
        #elseif arch(x86_64) || arch(arm64)
            return NSNumber(double: self.native.native)
        #endif
    }
    
    public static func _forceBridgeFromObjectiveC(source: _ObjectiveCType, inout result: CGAngle?) {
        #if arch(i386) || arch(arm)
            result = CGAngle(source.floatValue)
        #elseif arch(x86_64) || arch(arm64)
            result = CGAngle(source.doubleValue)
        #endif
        
    }
    
    public static func _conditionallyBridgeFromObjectiveC(source: _ObjectiveCType, inout result: CGAngle?) -> Bool {
        #if arch(i386) || arch(arm)
            result = CGAngle(source.floatValue)
        #elseif arch(x86_64) || arch(arm64)
            result = CGAngle(source.doubleValue)
        #endif
        return true
    }
    
    public static func _unconditionallyBridgeFromObjectiveC(source: _ObjectiveCType?) -> CGAngle {
        if let source = source {
            #if arch(i386) || arch(arm)
                return CGAngle(source.floatValue)
            #elseif arch(x86_64) || arch(arm64)
                return CGAngle(source.doubleValue)
            #endif
        } else {
            return CGAngleZero
        }
    }
}
