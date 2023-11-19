//
//  ToastView.swift
//  DSToast
//
//  Created by Dream on 2023/11/17.
//

import Foundation
import SwiftUI
import Combine

extension DSToast: DSToastCompatible { }

/// Dipslay the style of DSToast
public struct DSToast: View {
    
    
    /// Drive the `DSToast` data model
    public var data: DSToast.Data

    /// `DSToast` Initialization Method
    /// - Parameters:
    ///   - title:          Tips title
    ///   - message:        Tips message
    public init(title: String, message: String) {
        let data = DSToast.Data(title: title, message: message)
        self.init(data: data)
    }
    
    
    /// `DSToast` Initialization Method
    /// - Parameter data: Drive the `DSToast` data model
    public init(data: DSToast.Data) {
        self.data = data
    }

    public var body: some View {
        
        VStack {
            if case.bottom = data.position {
                Spacer()
            }
        
            #if os(macOS)
            ToastView(model: data.model)
                .background(data.backgroundColor.opacity(0.6))
                .background(.ultraThinMaterial)
                .cornerRadius(10)
            #else
            ToastView(model: data.model)
                .background(data.backgroundColor.opacity(0.8))
                .cornerRadius(10)
            #endif
        
            if case.top = data.position {
                Spacer()
            }
            
        }
        .padding()
        .opacity(self.data.config.isHidden ? 0 : 1.0)
        .transition(.opacity)
        .onAppear {
            if self.data.config.isAutoHidden {
                self.data.config.cancellable = ds.delay(self.data.config.delay) {
                    withAnimation { self.data.config.isHidden = true }
                }
            }
        }
        .onDisappear {
            if self.data.config.isAutoHidden {
                self.data.config.cancellable?.cancel()
                self.data.config.cancellable = nil
            }
        }
        .onTapGesture {
            if (self.data.config.isTapGesture) {
                withAnimation { self.data.config.isHidden = true }
            }
            
        }
        
    }
}
