//
//  SimpleStoreTestCase.swift
//  SwiftFlux
//
//  Created by Tran Thien Khiem on 8/30/16.
//  Copyright © 2016 Tran Thien Khiem. All rights reserved.
//

import XCTest
import SwiftState

class SimpleStateMachineTestCase: XCTestCase {
    
    /// the door action
    enum DoorAction {
        case Open
        case Close
    }
    
    /// the door state handler
    func doorStateHandler(state: Bool, action: DoorAction) -> Bool {
        var newState = state
        
        switch action {
        case .Open:
            newState = true
        default:
            newState = false
        }
        
        return newState
    }
    
    /// test
    func testSimpleStoreInitialize() {
        let store = SimpleStateMachine(initialState: false, stateHandler: doorStateHandler)
        XCTAssert(store.state == false)
    }
    
    /// test simple state change
    func testSimpleStateChange() {
        var store = SimpleStateMachine(initialState: false, stateHandler: doorStateHandler)
        store.dispatch(action: DoorAction.Open)
        XCTAssert(store.state == true)
    }
    
    /// test simple state changes
    func testStateChanges() {
        var store = SimpleStateMachine(initialState: false, stateHandler: doorStateHandler)
        store.dispatch(action: .Open)
        store.dispatch(action: .Close)
        XCTAssert(store.state == false)
    }
    
    /// test listen
    func testListen() {
        var invoke = false
        var store = SimpleStateMachine(initialState: false, stateHandler: doorStateHandler)
        
        let id = store.subscribe() {
            invoke = true
        }
        
        store.dispatch(action: .Open)
        
        XCTAssert(invoke == true)
        store.unsubscribe(id: id)
    }
    
    /// no change should be called
    /* func testNoChange() {
        var invoke = false
        var store = SimpleStateMachine(initialState: false, stateHandler: doorStateHandler)
        
        let id = store.subscribe() {
            invoke = true
        }
        
        store.dispatch(action: .Close)
        XCTAssert(invoke == false)
        store.unsubscribe(id: id)
        
    } */
    
    /// test listen
    func testUnsubscribe() {
        var invoke = false
        var store = SimpleStateMachine(initialState: false, stateHandler: doorStateHandler)
        
        let id = store.subscribe() {
            invoke = true
        }
        
        store.unsubscribe(id: id)
        
        store.dispatch(action: .Open)
        XCTAssert(invoke == false)
    }
    
    class Data {
        var store: SimpleStateMachine<Bool, DoorAction>
        init(store: SimpleStateMachine<Bool, DoorAction>) {
            self.store = store
        }
    }
    
    /// test
    func testReference() {
        let data = Data(store: SimpleStateMachine(initialState: false, stateHandler: doorStateHandler))
        data.store.dispatch(action: .Open)
        XCTAssert(data.store.state == true)
    }
}
