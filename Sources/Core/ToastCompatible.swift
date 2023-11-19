//
//  ToastView.swift
//  DSToast
//
//  Created by Dream on 2023/11/17.
//

import Foundation
import SwiftUI

/// DS Toast Compatible
public protocol DSToastCompatible: View {
    var data: DSToast.Data { get set }
}

/// Data isolation protocol
public protocol ToastCompatible { }

/// Item
public struct DS<Item> {
    
    /// Prefix property
    public let ds: Item
    
    /// Initialization method
    /// - Parameter ds: Item
    public init(_ ds : Item) {
        self.ds = ds
    }
}

public extension ToastCompatible {
    
    /// Instance property
    var ds: DS<Self> {
        set { }
        get { DS(self) }
    }
    
    /// Static property
    static var ds: DS<Self>.Type {
        set { }
        get { DS<Self>.self }
    }
}
