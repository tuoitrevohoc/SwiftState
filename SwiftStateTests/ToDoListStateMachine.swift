//
//  Tutorial_SimpleStateMachine.swift
//  SwiftState
//
//  Created by Tran Thien Khiem on 8/30/16.
//  Copyright © 2016 Tran Thien Khiem. All rights reserved.
//

import XCTest
import SwiftState


///
/// to do item
struct ToDoItem: Equatable {
    var name: String
    var completed: Bool
    
    /// check 2 todo items are equals
    static func ==(lhs: ToDoItem, rhs: ToDoItem) -> Bool {
        return (lhs.completed == rhs.completed)
            && (lhs.name == rhs.name)
    }
}

///
/// the todo list
struct ToDoList: Equatable {
    var items = [ToDoItem]()
    
    static func ==(lhs: ToDoList, rhs: ToDoList) -> Bool {
        return lhs.items == rhs.items
    }
}

class ToDoListStateMachineTestCases: XCTestCase {
    
    /// todo action action
    enum ToDoAction {
        case Append(item: ToDoItem)
        case RemoveItem(index: Int)
        case RemoveAll
        case Check(index: Int, value: Bool)
    }
    
    /// initialize a state machine with inital state is closing
    var toDoListMachine = SimpleStateMachine(initialState: ToDoList()) {
        (state: ToDoList, action: ToDoAction) in
        
        var newState = state
        
        switch (action) {
        case .Append(let item):
            newState.items.append(item)
        case .RemoveItem(let index):
            newState.items.remove(at: index)
        case .RemoveAll:
            newState.items.removeAll()
        case .Check(let index, let value):
            newState.items[index].completed = value
        }
        
        return newState
    }
    
    /// test how to do list work
    func testToDoListStateMachine() {
        toDoListMachine.dispatch(
            action: .Append(item: ToDoItem(name: "Get up", completed: false))
        )
        
        toDoListMachine.dispatch(
            action: .Append(item: ToDoItem(name: "Go back to bed", completed: false))
        )
        
        XCTAssert(toDoListMachine.state.items.count == 2, "There should be two item")
        
        toDoListMachine.dispatch(action: .RemoveItem(index: 0))
        
        XCTAssert(toDoListMachine.state.items.count == 1)
        var first = toDoListMachine.state.items.first!
        
        XCTAssert(first.name == "Go back to bed")
        first.name = "Something else"
        
        XCTAssert(toDoListMachine.state.items.first!.name == "Go back to bed")
        
        toDoListMachine.dispatch(action: .Check(index: 0, value: true))
        XCTAssert(toDoListMachine.state.items.first!.completed)
        
    }
    
    
}
