//
//  Operators.swift
//  BitwiseMasking
//
//  Created by Pilipenko Dima on 11/2/15.
//  Copyright © 2015 dimpiax. All rights reserved.
//

import Foundation

infix operator &| { associativity left }
func &|(lhs: Int, rhs: Int) -> Int {
    if rhs < 0 { return lhs & rhs }
    return lhs | rhs
}

infix operator &|= { associativity left }
func &|=(inout lhs: Int, rhs: Int) {
    lhs = lhs &| rhs
}