//
//  ToastView.swift
//  DSToast
//
//  Created by Dream on 2023/11/17.
//
import Foundation
import Combine
import SwiftUI


extension DSToast: ToastCompatible { }

extension DS where Item == DSToast {
    
    /// Delayed implementation of tasks
    /// - Parameters:
    ///   - time:   Time Delay
    ///   - task:   Delayed tasks
    /// - Returns:  Cancellable tasks
    @discardableResult
    func delay(_ time: TimeInterval, task: @escaping ()->()) -> AnyCancellable {
        Timer.publish(every: time, tolerance: 0.5, on: .main, in: .common)
            .autoconnect()
            .sink { _ in task() }
    }
}

extension Color: ToastCompatible { }
public extension DS where Item == Color {

    /// Default `text` color
     static var textColor: Color {
         Color("TextColor", bundle: .module)
    }
    
    /// Default `blur` background color
    static var blurBackgroundColor: Color {
        Color("BlurBackgroundColor", bundle: .module)
    }
    
    
    /// Default `Toast` Background Color
    static var toastBackgroundColor: Color {
        Color("ToastBackgroundColor", bundle: .module)
    }
}

extension Image: ToastCompatible { }

public extension DS where Item == Image {
    static var `default`: Image {
        Image(systemName: "checkmark.circle")
        
    }
}

