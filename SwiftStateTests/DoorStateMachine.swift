//
//  Tutorial_SimpleStateMachine.swift
//  SwiftState
//
//  Created by Tran Thien Khiem on 8/30/16.
//  Copyright © 2016 Tran Thien Khiem. All rights reserved.
//

import XCTest
import SwiftState

class DoorStateMachineTestCase: XCTestCase {
    
    /// door state
    enum DoorState {
        case Opening
        case Closing
    }
    
    /// door action
    enum DoorAction {
        case Open
        case Close
    }
    
    /// initialize a state machine with inital state is closing
    var doorStateMachine = SimpleStateMachine(initialState: .Closing) {
        (state: DoorState, action: DoorAction) in
        
        var newState: DoorState
        
        switch (action) {
        case .Open:
            newState = .Opening
        case .Close:
            newState = .Closing
        }
        
        return newState
    }
    
    /// test how door
    func testDoorStateMachine() {
        XCTAssert(doorStateMachine.state == .Closing, "The door should be closing by default")
        // some one open the door
        doorStateMachine.dispatch(action: .Open)
        
        XCTAssert(doorStateMachine.state == .Opening, "The door should be opening after someone open the door")
    }
    

}
