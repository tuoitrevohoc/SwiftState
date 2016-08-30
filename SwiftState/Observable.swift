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
    /// change handler
    typealias StateCallbackHandler = () -> ()
    
    ///
    /// subscribe to the change
    ///
    /// - parameter callback: the callback handler
    /// - returns: an id for unsubcribing later
    mutating func subscribe(callback: StateCallbackHandler) -> String
    
    ///
    /// unsubscribe the channel
    ///
    /// - parameter id: the id of the listener to unsubscribe
    mutating func unsubscribe(id: String?)
    
}
