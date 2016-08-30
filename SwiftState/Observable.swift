//
//  Observable.swift
//  SwiftFlux
//
//  Created by Tran Thien Khiem on 8/29/16.
//  Copyright © 2016 Tran Thien Khiem. All rights reserved.
//

import Foundation

///
/// observable
public protocol Observable {
    
    ///
    /// state type
    associatedtype StateCallBackHandler
    
    ///
    /// subscribe
    mutating func subscribe(callback: StateCallBackHandler) -> String
    
    /// unsubscribe the channel
    mutating func unsubscribe(id: String)
    
}
