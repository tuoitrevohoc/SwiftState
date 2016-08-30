//
//  Observable.swift
//  SwiftFlux
//
//  Created by Tran Thien Khiem on 8/29/16.
//  Copyright © 2016 Tran Thien Khiem. All rights reserved.
//

import Foundation

///
/// observable - able to observe the changes of an object
///
public protocol Observable {
    
    ///
    /// Call back handler
    associatedtype StateCallBackHandler
    
    ///
    /// subscribe to the change
    ///
    /// - parameter callback: the callback handler
    /// - returns: an id for unsubcribing later
    mutating func subscribe(callback: StateCallBackHandler) -> String
    
    ///
    /// unsubscribe the channel
    ///
    /// - parameter id: the id of the listener to unsubscribe
    mutating func unsubscribe(id: String)
    
}
