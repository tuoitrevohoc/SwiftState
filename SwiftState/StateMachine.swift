//
//  Store.swift
//  SwiftFlux
//
//  Created by Tran Thien Khiem on 8/29/16.
//  Copyright © 2016 Tran Thien Khiem. All rights reserved.
//

import Foundation

///
/// protocol store
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
    
    /// dispatch an action to the store
    mutating func dispatch(action: ActionType)
    
    /// unwind a step
    mutating func unwind()
    
    /// redo a step
    mutating func replay()
}

