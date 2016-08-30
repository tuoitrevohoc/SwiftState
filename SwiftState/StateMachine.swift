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
    
    /// the callback handler
    typealias StateCallbackHandler = () -> ()
    
    /// the current state
    var state: StateType { get }
    
    /// if can unwind
    var canUnwind: Bool { get }
    
    /// if can redo
    var canReplay: Bool { get }
    
    /// dispatch an action to the statemachine
    ///
    /// - parameter action: the action to send to the state machine
    mutating func dispatch(action: ActionType)
    
    /// unwind a step - go back to last state
    ///
    mutating func unwind()
    
    /// redo a step - go forward a state
    mutating func replay()
}

