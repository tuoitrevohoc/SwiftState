//
//  SimpleStateMachine.swift
//  SwiftFlux
//
//  Created by Tran Thien Khiem on 8/30/16.
//  Copyright © 2016 Tran Thien Khiem. All rights reserved.
//

import Foundation

///
/// the simple state machine implement with two type
public struct SimpleStateMachine<U, V>: StateMachine {
    
    
    /// the type of the state
    public typealias StateType = U
    
    /// the type of an action that send to the state machine
    public typealias ActionType = V
    
    /// state handler function - handle state changes
    public typealias StateHandlerFunction = (StateType, ActionType) -> StateType
    
    /// state callback handler
    public typealias StateCallbackHandler = () -> ()
    
    /// stack to store state changes
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
    
    /// all listener to this store
    var listeners = [String: StateCallbackHandler]()
    
    ///
    /// initialize the store
    /// 
    /// - parameter initialState: the initial state
    /// - parameter handler: the state handler function to handle actions
    public init(initialState: StateType,
                stateHandler handler: @escaping StateHandlerFunction) {
        state = initialState
        stateHandler = handler
    }
    
    /// dispatch an action to the statemachine
    ///
    /// - parameter action: the action to send to the state machine
    public mutating func dispatch(action: ActionType) {
        let newState = stateHandler(state, action)
        
        update(newState: newState)
        
    }
    
    ///
    /// subscribe to the change
    ///
    /// - parameter callback: the callback handler
    /// - returns: an id for unsubcribing later
    public mutating func subscribe(callback: @escaping StateCallbackHandler) -> String {
        let uid = UUID().uuidString
        listeners[uid] = callback
        return uid
    }
    
    ///
    /// unsubscribe the channel
    ///
    /// - parameter id: the id of the listener to unsubscribe
    public mutating func unsubscribe(id: String?) {
        if let subsription = id {
            listeners.removeValue(forKey: subsription)
        }
    }
    
    ///
    /// update to a new state
    /// push state change to stack
    /// 
    /// - parameter newState: the target state to change
    private mutating func update(newState: StateType) {
        state = newState
    }
}
