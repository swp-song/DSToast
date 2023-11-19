//
//  ContentView.swift
//  MultiPlatform
//
//  Created by Dream on 2023/11/19.
//

import SwiftUI

import DSToast

struct ContentView: View {
    
    @State private var showTopToast = false
    
    @ObservedObject var `default` = DSToast.Data(title: "`Default`",  message: "`Message Top`")
    
    @ObservedObject var top = DSToast.Data(title: "Title",  message: "Message Top", config: DSToast.Config(isAutoHidden: false), blur: DSToast.Blur.default)
    @ObservedObject var bottom = DSToast.Data(model: DSToast.Molde(title: "Title", message: "Bottom Message", textAlignment: .center, alignment: .vertical), position: .bottom)
    
    @ObservedObject var center = DSToast.Data(model: DSToast.Molde(title: "Title", message: "Center Message", alignment: .vertical), position: .center)
    
    var body: some View {
        HStack (spacing: 30) {
            Button("`default`") {
                withAnimation {
                    self.default.config.isHidden = false
                }
            }
            
            Button("top") {
                withAnimation {
                    self.top.config.isHidden = false
                }
            }
            
            Button("center") {
                withAnimation {
                    self.center.config.isHidden = false
                }
            }
            
            Button("bottom") {
                withAnimation {
                    self.bottom.config.isHidden = false
                }
            }
            
            
        }
        .padding()
        .dsToast(self.default)
        .dsToast(self.top)
        .dsToast(self.center)
        .dsToast(self.bottom.config.isHidden) {
            DSToast(data: bottom)
        }
        #if os(macOS)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        #endif
      
    }
}

#Preview {
    ContentView()
}