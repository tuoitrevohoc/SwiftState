//
//  SimpleStateMachine.swift
//  SwiftFlux
//
//  Created by Tran Thien Khiem on 8/30/16.
//  Copyright © 2016 Tran Thien Khiem. All rights reserved.
//

import Foundation

///
/// the store
public struct SimpleStateMachine<U: Equatable, V>: StateMachine {
    
    /// the
    public typealias StateType = U
    
    /// the action type
    public typealias ActionType = V
    
    /// state handler
    public typealias StateHandlerFunction = (StateType, ActionType) -> StateType
    
    /// the state callback handler
    public typealias StateCallbackHandler = () -> ()
    
    /// state type
    private var stack = [StateType]()
    
    /// the stack position
    private var position = -1
    
    /// the state handler
    private var stateHandler: StateHandlerFunction
    
    /// current state
    private(set) public var state: StateType {
        didSet {
            /// invoke changes to listener
            for listener in listeners.values {
                listener()
            }
        }
    }
    
    /// can redo
    public var canReplay: Bool {
        return position < stack.count - 1
    }
    
    /// if we can unwind
    public var canUnwind: Bool {
        return position > 0
    }
    
    /// all listener to this store
    var listeners = [String: StateCallbackHandler]()
    
    ///
    /// initialize the store
    public init(initialState: StateType, stateHandler handler: StateHandlerFunction) {
        state = initialState
        stateHandler = handler
    }
    
    ///
    /// action coming
    public mutating func dispatch(action: ActionType) {
        let newState = stateHandler(state, action)
        
        if newState != state {
            update(newState: newState)
        }
        
    }
    
    ///
    /// subscribe for changes
    ///
    public mutating func subscribe(callback: StateCallbackHandler) -> String {
        let uid = UUID().uuidString
        listeners[uid] = callback
        return uid
    }
    
    /// unsubscribe the callback
    public mutating func unsubscribe(id: String) {
        listeners.removeValue(forKey: id)
    }
    
    ///
    /// update to a new state
    private mutating func update(newState: StateType) {
        
        while position > stack.count - 1 {
            stack.remove(at: stack.count - 1)
        }
        
        stack.append(state)
        position = stack.count - 1
        
        state = newState
    }
    
    /// func unwind
    public mutating func unwind() {
        if canUnwind {
            position = position - 1
            state = stack[position]
        }
    }
    
    /// func redo a step
    public mutating func replay() {
        if canReplay {
            position = position + 1
            state = stack[position]
        }
    }
}
