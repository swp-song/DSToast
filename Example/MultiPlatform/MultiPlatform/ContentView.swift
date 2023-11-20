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
    
    @ObservedObject var `default` = DSToast.Data(title: "`Default`",  message: "`Default Message`")
    @ObservedObject var top = DSToast.Data(title: "`Top`",  message: "`Message Top`", config: DSToast.Config(isAutoHidden: false), blur: DSToast.Blur.default)
    @ObservedObject var center = DSToast.Data(model: DSToast.Molde(title: "`Center`", message: "`Center Message`", alignment: .vertical), position: .center)
    @ObservedObject var bottom = DSToast.Data(model: DSToast.Molde(title: "`Bottom`", message: "`Bottom Message`", textAlignment: .center, alignment: .vertical), position: .bottom)
    
    var body: some View {
        HStack (spacing: 30) {
            Button("`default`") {
                DSToast.ds.display(self.default)
            }
            
            Button("`top`") {
                DSToast.ds.display(self.top)
            }
            
            Button("`center`") {
                DSToast.ds.display(self.center)
            }
            
            Button("`bottom`") {
                DSToast.ds.display(self.bottom)
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
