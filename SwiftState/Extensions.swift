//
//  Extensions.swift
//  SwiftState
//
//  Created by Tran Thien Khiem on 8/30/16.
//  Copyright © 2016 Tran Thien Khiem. All rights reserved.
//

import Foundation


extension Array {
    
    /// compare two equatable array
    static func ==<T>(lhs: [T], rhs: [T]) -> Bool
                    where T: Equatable {
        var result = lhs.count == rhs.count
        let i = 0
        
        while result && i < lhs.count {
            result = result && (lhs[i] == rhs[i])
        }
                        
        return result
    }
}
