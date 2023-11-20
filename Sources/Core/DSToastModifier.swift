//
//  ToastView.swift
//  DSToast
//
//  Created by Dream on 2023/11/17.
//

import Foundation

import SwiftUI


/// Drive the `DSToast` ViewModifier, can be customized
struct DSToastModifier<T>: ViewModifier where T: View {

    /// Hidden or display `DSToast`, Hidden = true, display = false, `default` = `true`
    @Binding var isHidden: Bool
    
    /// Display `Toast` view can be customized
    private var content: ()->T
    
    /// `DSToastModifier,
    /// - Parameters:
    ///   - isHidden:   Hidden or display `DSToast`, Hidden = true, display = false, `default` = `true`
    ///   - content:    Display `Toast` view can be customized
    public init(_ isHidden: Binding<Bool>, content: @escaping ()->T) {
        self._isHidden = isHidden
        self.content = content
    }
    
    func body(content: Content) -> some View {
        ZStack {
            content
            ZStack {
                if self.isHidden {
                    EmptyView()
                } else {
                    if let view = self.content() as? DSToast,
                       let blur = view.data.blur {
                        RoundedRectangle(cornerRadius: 5)
                            .fill()
                            .foregroundStyle(blur.backgroundColor)
                            .opacity(blur.opacity)
                            .ignoresSafeArea()
                        view
                    } else {
                        self.content()
                    }
                    
                }
            }
            .opacity(self.isHidden ? 0 : 1.0)
            .transition(.opacity)
        }
    }
   
}
