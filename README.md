# SwiftState
A State Machine Manager for Swift

SwiftState implements a state machine to manage state changes in a Swift Application.
By ultilizing unidirectional data flow & usage of value type, SwiftState will helps to make your application easier to understand the logic of the application.

Using:

```
pod 'SwiftState', :git => 'https://github.com/tuoitrevohoc/SwiftState.git'
```

Example of a state machine:

For example a toogle button has two state: On / Off.

- The State: hold the state of the button. There are two states: On / Off
- The Action: button only changed when the action is sent.
- The Observer: listen to the change of the state and reflect to Front End.

```
[ State ] ===> changes ===> [ Observer ]
   ^                              ||
   =============[Action]===========
```

Data is flow only one direction and you can totally control your application.
Here is sample implementation:
```

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
    
    /// listening to state changes
    let subscription = buttonStateMachine.subscribe() {
      print("The button is \(buttonStateMachine ? "on" : "off")")
    }
    
    /// dispatching an action to the state machine
    /// some one pushed the button
    buttonStateMachine.dispatch(action: .Push)
    
    /// unsubscribe
    buttonStateMachine.unsubscribe(id: subscription)
    
    /// implement undo
    buttonStateMachine.unwind()
    
    /// implement redo
    buttonStateMachine.replay()
  ```
