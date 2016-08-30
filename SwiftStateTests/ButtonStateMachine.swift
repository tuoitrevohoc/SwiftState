//
//  Tutorial_SimpleStateMachine.swift
//  SwiftState
//
//  Created by Tran Thien Khiem on 8/30/16.
//  Copyright © 2016 Tran Thien Khiem. All rights reserved.
//

import XCTest
import SwiftState

class ButtonStateMachineTestCase: XCTestCase {
    
    /// door action
    enum ButtonAction {
        
        /// push the button
        case Push
    }
    
    /// create a button state machine with
    var buttonStateMachine = SimpleStateMachine(initialState: false) {
        (state: Bool, action: ButtonAction) in
        
        var newState: Bool
        
        switch (action) {
        case .Push:
            newState = !state
        }
        
        return newState
    }
    
    /// test how door
    func testDoorStateMachine() {
        XCTAssert(buttonStateMachine.state == false, "The button is off by default")
        
        // some one pushed the button
        buttonStateMachine.dispatch(action: .Push)
        
        XCTAssert(buttonStateMachine.state == true, "The button must be on")
        
        buttonStateMachine.dispatch(action: .Push)
        XCTAssert(buttonStateMachine.state == false, "The button must be off")
    }
    
    
}
