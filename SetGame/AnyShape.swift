//
//  AnyShape.swift
//  SetGame
//
//  Created by Piyush Sharma on 08/04/23.
//

import SwiftUI


public struct AnyShape: Shape {
    public var make: (CGRect, inout Path) -> ()

    public init(_ make: @escaping (CGRect, inout Path) -> ()) {
        self.make = make
    }

    public init<S: Shape>(_ shape: S) {
        self.make = { rect, path in
            path = shape.path(in: rect)
        }
    }

    public func path(in rect: CGRect) -> Path {
        return Path { [make] in make(rect, &$0) }
    }
}

protocol MyProtocol {
    
    func func1()
    func func2() -> Bool
}

struct Impl1: MyProtocol {
    func func1() {
        print(func2())
    }
    
    func func2() -> Bool {
        return true
    }
}

struct Impl2: MyProtocol {
    func func1() {
        print(func2())
    }
    
    func func2() -> Bool {
        return true
    }
}

struct Impl3: MyProtocol {
    func func1() {
        print(func2())
    }
    
    func func2() -> Bool {
        return true
    }
}

struct InstanceManager {
    
    func makeMyProtocol(input: Int) -> MyProtocol {
        switch input {
        case 1: return Impl1()
        case 2: return Impl2()
        default: return Impl3()
            
        }
    }
}
