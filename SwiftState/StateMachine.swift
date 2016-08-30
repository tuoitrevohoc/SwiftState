//
//  Store.swift
//  SwiftFlux
//
//  Created by Tran Thien Khiem on 8/29/16.
//  Copyright © 2016 Tran Thien Khiem. All rights reserved.
//

import Foundation

///
/// protocol for state machine
public protocol StateMachine: Observable {
    
    /// the action type
    associatedtype ActionType
    
    /// the state type
    associatedtype StateType
    
    /// the current state
    var state: StateType { get }
    
    /// dispatch an action to the statemachine
    ///
    /// - parameter action: the action to send to the state machine
    mutating func dispatch(action: ActionType)
}

