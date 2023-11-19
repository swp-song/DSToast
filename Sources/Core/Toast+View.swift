//
//  ToastView.swift
//  DSToast
//
//  Created by Dream on 2023/11/17.
//

import Foundation

import SwiftUI

public extension View {
    
    
    /// Display `Toast` view can be customized
    /// - Parameters:
    ///   - isHidden:   Drive `toast` to display or hide
    ///   - toast:      Display the `toast`
    /// - Returns:      DSToastModifier
    func dsToast<T: View>(_ isHidden: Bool, @ViewBuilder toast: @escaping ()->T) -> some View {
        let isHidden: Binding<Bool> = Binding.constant(isHidden)
        return self.modifier(DSToastModifier(isHidden, content: toast))
    }
    
    
    /// Display `DSToast` view
    /// - Parameter data: Drives the `DSToast` data model
    /// - Returns:  DSToastModifier
    func dsToast(_ data: DSToast.Data) -> some View {
        let toast: ()-> DSToast = {
            return DSToast(data: data)
        }
        let isHidden: Binding<Bool> = Binding.constant(data.config.isHidden)
        return self.modifier(DSToastModifier(isHidden, content: toast))
    }
    
}

